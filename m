From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a7795: salvator-xs: enable
 USB2.0 phy channel 3
Date: Mon, 2 Oct 2017 10:20:03 +0200
Message-ID: <CAMuHMdUGU-6c=QoekksFfpoP1x15vUmFu272wd5YqqnQe-RwmA@mail.gmail.com>
References: <1506925789-19392-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1506925789-19392-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506925789-19392-2-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kieran Bingham <kieran-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Mon, Oct 2, 2017 at 8:29 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch enables the USB2.0 phy channel 3. R-Car H3 ES2.0 has
> this channel and we can use it on the Salvator-XS.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> @@ -99,6 +99,11 @@
>                 groups = "usb2";
>                 function = "usb2";
>         };
> +
> +       usb2_ch3_pins: usb2_ch3 {
> +               groups = "usb2_ch3";
> +               function = "usb2_ch3";
> +       };
>  };

Using these pins requires changing SW31, disabling the interrupt capabilities
of the ADV7482? Does the ADV7482 still work after that?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
