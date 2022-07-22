package br.csi.controller;

import br.csi.dao.ProdutoDao;
import br.csi.model.Usuario;
import br.csi.service.UsuarioService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @GetMapping
    public String login(){
        return "login";
    }



    @PostMapping("/autenticar")
    public String autenticar(@RequestParam String email, @RequestParam  String senha, HttpServletRequest req, Model model ){
        Usuario usuario = new UsuarioService().autenticado(email, senha);

        System.out.println( email + senha);
        req.getSession();
        HttpSession sessao = req.getSession();
        sessao.setAttribute("usuario_logado", usuario);


        if(usuario != null){
            ProdutoDao pDao = new ProdutoDao();
            model.addAttribute("produtos", pDao.getProdutos());

            return "visualizarproduto";

        }else {
            return "login";
        }

    }

}
