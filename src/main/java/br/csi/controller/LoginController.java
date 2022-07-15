package br.csi.controller;

import br.csi.model.Usuario;
import br.csi.service.UsuarioService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("login")
public class LoginController {

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam  String senha, HttpServletRequest req){
        Usuario usuario = new UsuarioService().autenticado(email, senha);

        System.out.println( email + senha);
        req.getSession();
        HttpSession sessao = req.getSession();
        sessao.setAttribute("usuario_logado", usuario);


        if(usuario != null){
            return "visualizarproduto";
        }else {
            return "login";
        }

    }

}
