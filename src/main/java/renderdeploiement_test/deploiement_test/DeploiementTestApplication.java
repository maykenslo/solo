package renderdeploiement_test.deploiement_test;

import java.util.Optional;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DeploiementTestApplication {

	public static void main(String[] args) {
		SpringApplication.run(DeploiementTestApplication.class, args);

		String port = Optional.ofNullable(System.getenv("PORT")).orElse("non défini");
		System.out.println(">>>> PORT fournie par Render : " + port);
		SpringApplication.run(DeploiementTestApplication.class, args);

	}

}
