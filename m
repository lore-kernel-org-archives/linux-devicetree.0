From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [git pull] clk: shmobile: Add new Renesas CPG/MSSR DT bindings for
Date: Wed, 21 Oct 2015 02:27:49 -0700
Message-ID: <20151021092749.20687.86043@quantum>
References: <1445367000-11525-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445367000-11525-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Geert Uytterhoeven (2015-10-20 11:49:58)
>         Hi Mike, Stephen,
> 
> The following changes since commit 64291f7db5bd8150a74ad2036f1037e6a0428df2:
> 
>   Linux 4.2 (2015-08-30 11:34:09 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-shmobile-for-v4.4

Pulled.

Thanks,
Mike

> 
> for you to fetch changes up to 9d0c3c682033d3f10ac1ad8e72ca0c1b48063409:
> 
>   clk: shmobile: Add r8a7795 CPG Core Clock Definitions (2015-10-20 20:36:00 +0200)
> 
> Summary:
>   - clk: shmobile: Add new Renesas CPG/MSSR DT bindings for r8a7795
> 
> Thanks for pulling!
> 
> ----------------------------------------------------------------
> Geert Uytterhoeven (2):
>       clk: shmobile: Add new Renesas CPG/MSSR DT bindings
>       clk: shmobile: Add r8a7795 CPG Core Clock Definitions
> 
>  .../devicetree/bindings/clock/renesas,cpg-mssr.txt | 69 ++++++++++++++++++++++
>  include/dt-bindings/clock/r8a7795-cpg-mssr.h       | 63 ++++++++++++++++++++
>  include/dt-bindings/clock/renesas-cpg-mssr.h       | 15 +++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
>  create mode 100644 include/dt-bindings/clock/r8a7795-cpg-mssr.h
>  create mode 100644 include/dt-bindings/clock/renesas-cpg-mssr.h
> 
> Gr{oetje,eeting}s,
> 
>                                                 Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
