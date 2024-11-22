package instagram
class Post{
User user
String type
String caption
byte[] photo
String photoContentType
static constraints={
    caption(nullable:false)
photo(nullable:false)
}
static mapping={
    photo sqlType:"LONGBLOB"
}

static hasmany=[comments:Comment,likes:Likes]
}