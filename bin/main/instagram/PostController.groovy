package instagram
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
//import org.springframework.web.multipart.MultipartFile

class PostController {

   def create(){
    // render(view:"create")
   }
  
    //println "${params}"
    //def logo=params.photo
    def upload() {
      println "iupload..........${params.user}"
        def username=params.user
        def imageFile = request.getFile('photo')
        def imageInstance = new Post()
        if (imageFile && !imageFile.empty) {
            imageInstance.photo = imageFile.bytes
            imageInstance.photoContentType = imageFile.contentType
            imageInstance.caption=params.caption
            imageInstance.type="photo"
            imageInstance.user=User.findByUsername(params.user)}
            //println "............${imageInstance}"
            if (imageInstance.validate()) {
               imageInstance.save()
                println "Post saved successfully"
               redirect(controller:"user",action:"userDetails",params:[username:username])
            } 
            else {
                println "image upload failed"
                flash.message = "Image upload failed."
        }
    }
     def show() {
        def imageInstance = Post.get(params?.id)
        if (imageInstance) {
            response.contentType = imageInstance.photoContentType
            response.outputStream << imageInstance.photo
            response.outputStream.flush()
        } else {
            render status: 404
        }
    }
    def mypost(){
        println "helo............."
        def user=User.findByUsername(params.id)
       println "userparams .....${user}"
        def pro=Post.createCriteria().list(){
          eq("user",user)
          projections{
            property("id")
            property("photo")
            property("photoContentType")
            property("caption")
          }
        }
        //println "${pro.id}"
         if(pro!=null){
           render(view:"mypost",model:[pro:pro,user:user])
      }
      else{
        println "failed"
        flash.message="No post yet upload your first post ......"}
      }
      def search(){
        def username = params.username
        def user=User.findByUsername(username)
        println "${user}"
        println "inside the search action................."
        if(user==null){
          flash.message="No user Found"
          render(view:"search")
        }else{
        def post=Post.createCriteria().list(){
          eq("user",user)
          projections{
            property("id")
            property("photo")
            property("photoContentType")
            property("caption")
          }
        }
        println "----------------------------${post}"
            render(view:"search",model:[pro:post,user:user])
        }
         
      }
}
   
