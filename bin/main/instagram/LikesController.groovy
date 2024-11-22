package instagram


import grails.gorm.transactions.Transactional

@Transactional


class LikesController {
    def toggleLike() {
        println "..............toggle ${params}"
        def username=params.username
        def userId = User.findByUsername(params.username)
        def postId = Post.get(params.postId)
        def userDetailsIns=User.createCriteria().get(){
        eq("username",username)
          projections{
            property("username")
            property("name")
            property("bio")
          }
          maxResults(1);
        }        // println "user@@@@@@@@ ${userDetailsIns}"
        def postIns=Post.list()
         [post:postIns]// println "post%%%%%%%%%%%${postIns}"
        if(Likes.findByUserAndPost(userId, postId)==null) {// println "geting wrong"
             def newLike = new Likes(user: userId, post: postId,isliked:true)
             newLike.save() 
             flash.message ="post liked successfully"
             render(view:'/user/create',model:[post:postIns,userDetailsIns:userDetailsIns]) //   render(view:"create",model:[userDetailsIns:userDetailsIns,post:postIns])
        }
        else{
        def existingLike = Likes.findByUserAndPost(userId, postId)
        if (existingLike.isliked==true) {// println "...............deleted ${existingLike.isliked}..."
            existingLike.delete()  
            flash.message="post unliked successfully"  
            render(view:'/user/create',model:[post:postIns,userDetailsIns:userDetailsIns])  
        } 
    }// render(view:'toggleLike')
    }
        def countLikesByPostId() {// println "count&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
        def postId = params.postId
        def post = Post.get(postId)

        if (!post) {
            flash.message = "no like"
            redirect(action: "index")
            return
        }

        def likeCount = Likes.countByPost(post)
        println "${likeCount}"// render(view:, model: [post: post, likeCount: likeCount])
    }
}
