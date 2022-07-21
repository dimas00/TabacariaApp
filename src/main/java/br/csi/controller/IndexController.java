package br.csi.controller;

import br.csi.dao.ProdutoDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class IndexController {

    ProdutoDao pDao = new ProdutoDao();

    @GetMapping("/login")
    public String login(){
        return "login" ;

    }

    @GetMapping("/produtos")
    public String produtos(Model model) {
        model.addAttribute("produtos", pDao.getProdutos());

        return "visualizarproduto";
    }

    @GetMapping("/")
    public RedirectView indexController() {
        return new RedirectView("/produtos", true);
    }

}
