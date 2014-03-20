From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: Re: [PATCH 09/11] ARM: at91/dt: define main xtal frequency of the
 at91sam9261ek board
Date: Thu, 20 Mar 2014 10:24:35 +0100
Message-ID: <CACh+v5OF52ZuDBpkqpev1Jxv0DJ1ckRR+DjcX500i3o0o4HE9A@mail.gmail.com>
References: <1395173924-3648-1-git-send-email-b.brezillon.dev@gmail.com>
	<1395173924-3648-10-git-send-email-b.brezillon.dev@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395173924-3648-10-git-send-email-b.brezillon.dev@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris BREZILLON <brezillonboris@gmail.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Mike Turquette <mturquette@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, devicetree <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Boris BREZILLON <b.brezillon.dev@gmail.com>
List-Id: devicetree@vger.kernel.org

2014-03-18 21:18 GMT+01:00 Boris BREZILLON <brezillonboris@gmail.com>:
>
> Define at91sam9261ek main crystal frequency.
>
> Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
> ---
>  arch/arm/boot/dts/at91sam9261ek.dts |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/at91sam9261ek.dts b/arch/arm/boot/dts/at91sam9261ek.dts
> index 2ce527e..7175986 100644
> --- a/arch/arm/boot/dts/at91sam9261ek.dts
> +++ b/arch/arm/boot/dts/at91sam9261ek.dts
> @@ -29,6 +29,10 @@
>                         compatible = "atmel,osc", "fixed-clock";
>                         clock-frequency = <18432000>;
>                 };
> +
> +               main_xtal: main_xtal {
> +                       clock-frequency = <18432000>;
> +               };
>         };
>
>         ahb {
> --
> 1.7.9.5
>
You forgot to remove the old fixed-clock definition for the main_clock: clock@0

Otherwise:
Acked-by: Jean-Jacques HIBLOT <jjhiblot@traphandler.com>
