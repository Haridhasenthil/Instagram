package instagram
class User{
    String name
    String bio
    String username
    String password
    boolean deleted = false
    static constraints={
        name(nullable:false)
        bio(nullable:true)
        username(nullable:false,unique:true)
        password(nullable:false)
        }
 
    static mapping={
        bio datatype:"Longtext"
        // comments cascade: "all-delete-orphan" // cascades all operations to associated comments
        }

    static hasmany=[posts:Post]

}