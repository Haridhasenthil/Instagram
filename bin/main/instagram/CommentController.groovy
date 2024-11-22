package instagram;
class CommentController{
    def usercomment() {    
      println "...................${params.user}"
      def username=params.user
      def id = User.findByUsername(params.user)
      def commentInstance=new Comment (
           comment:params.comment,
           user:id,  
           post: Post.get(params.post) )
           println "${commentInstance}"
       if(commentInstance.validate()) {
        commentInstance.save() 
        println "comment saved successfully"
        flash.message = "Comment saved successfully"
       redirect(controller:"user",action:"userDetails",params:[username:username])
       }
       else {
        println "comment not saved successfully"
        //flash.message="comment not saved successfully"
       }  
    }
    // def values(){       
    // }
    def values() {
      println ".......................show comment"
        def postIns=Post.get(params.post)
        // //def post=Comment.get(params?.id)
        def pro=Comment.createCriteria().list(){
          eq("post",postIns)
          projections{
            user{property("username")}
            property("comment")
          }
        }
        println "${pro}"
        if(postIns){
         println "Comments for Post ID ${params.postId}: ${pro}"
         println "000000000000000${pro.user}"
         println ",,,,,,,,,,,,,,,,,,,,,,,,,${pro}"
        render(view : "values",model:[pro:pro])}

    }
}