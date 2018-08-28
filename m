From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/2] ARM: uniphier: dts: add more clocks to Denali NAND
 controller node
Date: Tue, 28 Aug 2018 23:26:33 +0900
Message-ID: <CAK7LNAS6YZeM5s=kxYFKfCDKHEmArqG-+R3Hoy20rX165iqMBA@mail.gmail.com>
References: <1532076645-10769-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532076645-10769-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

2018-07-20 17:50 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Catch up with the new binding of the Denali IP where three clocks,
> "nand", "nand_x", "ecc" are required.
>
> For UniPhier SoCs, the "nand_x" and "ecc" are tied up because they
> are both 200MHz.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Both applied.


>  arch/arm/boot/dts/uniphier-ld4.dtsi  | 3 ++-
>  arch/arm/boot/dts/uniphier-pro4.dtsi | 3 ++-
>  arch/arm/boot/dts/uniphier-pro5.dtsi | 3 ++-
>  arch/arm/boot/dts/uniphier-pxs2.dtsi | 3 ++-
>  arch/arm/boot/dts/uniphier-sld8.dtsi | 3 ++-
>  5 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/uniphier-ld4.dtsi b/arch/arm/boot/dts/uniphier-ld4.dtsi
> index 37950ad..2a17066 100644
> --- a/arch/arm/boot/dts/uniphier-ld4.dtsi
> +++ b/arch/arm/boot/dts/uniphier-ld4.dtsi
> @@ -347,7 +347,8 @@
>                         interrupts = <0 65 4>;
>                         pinctrl-names = "default";
>                         pinctrl-0 = <&pinctrl_nand2cs>;
> -                       clocks = <&sys_clk 2>;
> +                       clock-names = "nand", "nand_x", "ecc";
> +                       clocks = <&sys_clk 2>, <&sys_clk 3>, <&sys_clk 3>;
>                         resets = <&sys_rst 2>;
>                 };
>         };
> diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
> index 49539f0..da88ccc 100644
> --- a/arch/arm/boot/dts/uniphier-pro4.dtsi
> +++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
> @@ -394,7 +394,8 @@
>                         interrupts = <0 65 4>;
>                         pinctrl-names = "default";
>                         pinctrl-0 = <&pinctrl_nand>;
> -                       clocks = <&sys_clk 2>;
> +                       clock-names = "nand", "nand_x", "ecc";
> +                       clocks = <&sys_clk 2>, <&sys_clk 3>, <&sys_clk 3>;
>                         resets = <&sys_rst 2>;
>                 };
>         };
> diff --git a/arch/arm/boot/dts/uniphier-pro5.dtsi b/arch/arm/boot/dts/uniphier-pro5.dtsi
> index 06c2cef..40a84f2 100644
> --- a/arch/arm/boot/dts/uniphier-pro5.dtsi
> +++ b/arch/arm/boot/dts/uniphier-pro5.dtsi
> @@ -439,7 +439,8 @@
>                         interrupts = <0 65 4>;
>                         pinctrl-names = "default";
>                         pinctrl-0 = <&pinctrl_nand2cs>;
> -                       clocks = <&sys_clk 2>;
> +                       clock-names = "nand", "nand_x", "ecc";
> +                       clocks = <&sys_clk 2>, <&sys_clk 3>, <&sys_clk 3>;
>                         resets = <&sys_rst 2>;
>                 };
>         };
> diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
> index 641d961..1903752 100644
> --- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
> +++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
> @@ -528,7 +528,8 @@
>                         interrupts = <0 65 4>;
>                         pinctrl-names = "default";
>                         pinctrl-0 = <&pinctrl_nand2cs>;
> -                       clocks = <&sys_clk 2>;
> +                       clock-names = "nand", "nand_x", "ecc";
> +                       clocks = <&sys_clk 2>, <&sys_clk 3>, <&sys_clk 3>;
>                         resets = <&sys_rst 2>;
>                 };
>         };
> diff --git a/arch/arm/boot/dts/uniphier-sld8.dtsi b/arch/arm/boot/dts/uniphier-sld8.dtsi
> index e9b9b4f..dc723bf 100644
> --- a/arch/arm/boot/dts/uniphier-sld8.dtsi
> +++ b/arch/arm/boot/dts/uniphier-sld8.dtsi
> @@ -351,7 +351,8 @@
>                         interrupts = <0 65 4>;
>                         pinctrl-names = "default";
>                         pinctrl-0 = <&pinctrl_nand2cs>;
> -                       clocks = <&sys_clk 2>;
> +                       clock-names = "nand", "nand_x", "ecc";
> +                       clocks = <&sys_clk 2>, <&sys_clk 3>, <&sys_clk 3>;
>                         resets = <&sys_rst 2>;
>                 };
>         };
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
