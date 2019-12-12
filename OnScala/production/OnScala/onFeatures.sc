import scala.io._

val url = "http://dev.markitondemand.com/MODApis/Api/v2/Quote?symbol=GOOG"
//val response = Source.fromURL(url).mkString

import scala.concurrent._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.util._

val response: Future[Unit] = Future {
  Thread.sleep(10000) // sleep for 10s
  Source.fromURL(url).mkString
}
response.isCompleted

response.onComplete {
  case Success(s) => println(s)
  case Failure(e) => println(s"Error fetching page: $e")
}



