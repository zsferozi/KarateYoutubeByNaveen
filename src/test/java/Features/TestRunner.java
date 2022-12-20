package Features;
import com.intuit.karate.junit5.Karate;

public class TestRunner {
	@Karate.Test
	Karate GetAPITest() {
		return Karate.run("getAPI").relativeTo(getClass());
		
	 //this ("getAPI") is the class or the feature file name
		
	}
	@Karate.Test
	Karate PostAPITest() {
		return Karate.run("POST").relativeTo(getClass());
	}
	@Karate.Test
	Karate PutAPITest() {
		return Karate.run("putrequest").relativeTo(getClass());
	}
	@Karate.Test
	Karate DeleteAPITest() {
		return Karate.run("deleterequest").relativeTo(getClass());
	}
}
