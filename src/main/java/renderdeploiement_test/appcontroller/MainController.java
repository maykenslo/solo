package renderdeploiement_test.appcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {

   @GetMapping("/")
   public String homeController(Model model) {
       model.addAttribute("message", "Bienvenu sur mon site");
    return "index";
   }
   
   
}
