package instagram
import grails.gorm.transactions.Transactional

@Transactional


class UserController {
 def index(){
     redirect(controller: 'user', action: 'login')
  }
    def login(){
        def username=params.username;
        def password=params.password;
        println "username ......... ${params.username}"
        if(params.username==null){
            render(view:"login")
        }else{
        flash.message =null;
        //println "login ...................${customer.deleted}"
        def customer=User.findByUsernameAndPassword(username,password)
        println "customer details ..........${customer}"
        if(!customer){
          flash.message="Login failed! Invalid username or password!"
           render(view:"login")  
        }
        else if(customer.deleted==false){
            println "Login successful!"
            redirect(action:"userDetails", params:[username:username])
           
          }
          else if(username != null){
            flash.message="Login failed! Invalid username or password!"
            render(view:"login") 
          }
        }
    }

def login1(){

    render(view:"createProfile")
}
def createProfile(){
  println ".......................createProfile."
    def userInstance=new User(
      username:params.username,
      password:params.password,
      bio:params.bio,
      name:params.name,
      deleted:false
    )
    if(userInstance.validate()){
      println "successfully"
      userInstance.save()
      // println "helo%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5"
      redirect(controller:'user' ,action:'index')
    }else{
      println "failed"
    }
  }
  def userDetails(){
      println "------------------------userdetails"
      def username=params.username;
      println "${params}"
      def userDetailsIns=User.createCriteria().get(){
        eq("username",username)
          projections{
            property("username")
            property("name")
            property("bio")
          }
          maxResults(1);
        }
        println "------------------------userdetails${userDetailsIns}"
        def postIns=Post.list()
         [post:postIns]
        //println "${post}"
      if(userDetailsIns!=null){
        render(view:"create",model:[userDetailsIns:userDetailsIns,post:postIns])
      }
      else
        println "failed"
      }
  def delete(){
    def username =params.username;// println "------------------------${params.username}"
    def userDetailsIns = User.findByUsername(params.username)//println "delete------------------------${userDetailsIns[0]}"
    if(userDetailsIns){
      userDetailsIns.deleted=true
      userDetailsIns.save()
      //println "your account deleted successfully((((((((((((((((((((((((((("
      redirect(controller:'user' ,action:'index')}
    else{
      println "user account not found or already deleted..***********************"
    }
  }

  def profileCreation(){
     render(view:"/profile/createprofile")
  }
  def log(){
    render(view:"login")
  }
}