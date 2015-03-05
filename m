From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] of: Kconfig: Let OF_UNITTEST depend on "I2C=y" and "I2C_MUX=y"
Date: Thu, 5 Mar 2015 09:06:54 +0100
Message-ID: <CAMuHMdUg=X9siUKLzqAwPUn-WeKeirGy+XN4aSRFV7eX7WV1=A@mail.gmail.com>
References: <BLU437-SMTP82811F6F904D6C74EE62E3B91E0@phx.gbl>
	<CAMuHMdXPONxoNm+stn5sx579kzWo6auVP7hrRv26VSGySr7K2A@mail.gmail.com>
	<2530315.qdy5ZZGCEr@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2530315.qdy5ZZGCEr@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Chen Gang <xili_gchen_5257-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 4, 2015 at 8:49 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -979,7 +979,7 @@ static int of_path_platform_device_exists(const char *path)
>         return pdev != NULL;
>  }
>
> -#if IS_ENABLED(CONFIG_I2C)
> +#if IS_BUILTIN(CONFIG_I2C)

Wondering: is there any advantage in using "#if IS_BUILTIN(CONFIG_XXX)"
instead of "#ifdef CONFIG_XXX"?

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
