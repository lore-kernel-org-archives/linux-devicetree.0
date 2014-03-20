From: Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
Subject: Re: [PATCH 08/11] ARM: at91/dt: move at91sam9261 SoC to the new main
 clock model
Date: Thu, 20 Mar 2014 10:22:51 +0100
Message-ID: <CACh+v5Ngvdt=FnyzMz4Q0i1U7kNmrgXWDavzi4xvLDJR0qh0WA@mail.gmail.com>
References: <1395173924-3648-1-git-send-email-b.brezillon.dev@gmail.com>
	<1395173924-3648-9-git-send-email-b.brezillon.dev@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395173924-3648-9-git-send-email-b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <brezillonboris-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-03-18 21:18 GMT+01:00 Boris BREZILLON <brezillonboris-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>
> Signed-off-by: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/at91sam9261.dtsi |   10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/at91sam9261.dtsi b/arch/arm/boot/dts/at91sam9261.dtsi
> index e21dda0..e00fabc 100644
> --- a/arch/arm/boot/dts/at91sam9261.dtsi
> +++ b/arch/arm/boot/dts/at91sam9261.dtsi
> @@ -45,6 +45,14 @@
>                 reg = <0x20000000 0x08000000>;
>         };
>
> +       clocks {
> +               main_xtal: main_xtal {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <0>;
> +               };
> +       };
> +
>         ahb {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
> @@ -534,7 +542,7 @@
>                                         compatible = "atmel,at91rm9200-clk-main";
>                                         #clock-cells = <0>;
>                                         interrupts-extended = <&pmc AT91_PMC_MOSCS>;
> -                                       clocks = <&clk32k>;
> +                                       clocks = <&main_xtal>;
>                                 };
>
>                                 plla: pllack {
> --
> 1.7.9.5
>

Acked-by: Jean-Jacques HIBLOT <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
