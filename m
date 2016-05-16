From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 22/23] arm64: dts: r8a7795: Fix W=1 dtc warnings
Date: Mon, 16 May 2016 10:16:24 +0200
Message-ID: <CAMuHMdV6QwYwWkNfnBZZZdJG7=19ip81kYRKB4MTKH_K857fKA@mail.gmail.com>
References: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
	<1463126163-29423-23-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463126163-29423-23-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 13, 2016 at 9:56 AM, Geert Uytterhoeven
<geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -69,20 +69,22 @@
>                         next-level-cache = <&L2_CA57>;
>                         enable-method = "psci";
>                 };
> -       };
>
> -       L2_CA57: cache-controller@0 {
> -               compatible = "cache";
> -               power-domains = <&sysc R8A7795_PD_CA57_SCU>;
> -               cache-unified;
> -               cache-level = <2>;
> -       };
> +               L2_CA57: cache-controller@0 {
> +                       compatible = "cache";
> +                       reg = <0>;
> +                       power-domains = <&sysc R8A7795_PD_CA57_SCU>;
> +                       cache-unified;
> +                       cache-level = <2>;
> +               };
>
> -       L2_CA53: cache-controller@1 {
> -               compatible = "cache";
> -               power-domains = <&sysc R8A7795_PD_CA53_SCU>;
> -               cache-unified;
> -               cache-level = <2>;
> +               L2_CA53: cache-controller@100 {
> +                       compatible = "cache";
> +                       reg = <100>;

Oops, <0x100>

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
