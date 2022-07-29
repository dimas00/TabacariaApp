package br.csi.controller;

import br.csi.dao.UsuarioDao;
import br.csi.model.Produto;
import br.csi.model.Usuario;
import br.csi.service.UsuarioService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/cadastro")
public class CadastroController {

    UsuarioDao udao = new UsuarioDao();

    @GetMapping("/redirect")
    public String redirect() {

        return "cadastro";
    }

    @PostMapping("/cadastrar")
    public RedirectView cadastrar(@ModelAttribute("usuario") Usuario usuario, RedirectAttributes redirect) {
        if (new UsuarioService().CadastrarUsuario(usuario)) {
            redirect.addFlashAttribute("msg", "Cadastro feito com sucesso");
            return new RedirectView("/login", true);

        } else {
            redirect.addFlashAttribute("msg", "Erro no cadastro");
            return new RedirectView("/TabaricaApp/cadastro/cadastrar", true);
        }


    }
}
