From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] ARM: dts: uniphier: add audio in/out pin-mux node
Date: Thu, 15 Mar 2018 23:53:35 +0900
Message-ID: <CAK7LNARDrg2ihb1UVPagQtck_KgfFzRh0==HOfjXZySMvM2dqg@mail.gmail.com>
References: <20180314051732.6177-1-suzuki.katsuhiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180314051732.6177-1-suzuki.katsuhiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2018-03-14 14:17 GMT+09:00 Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
> The UniPhier AIO audio system needs I2S data in/out lines
> and clock signal pins to connect external codec chip.
>
> Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
> ---

Applied to linux-uniphier. Thanks!


>  arch/arm/boot/dts/uniphier-pinctrl.dtsi | 40 +++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/arch/arm/boot/dts/uniphier-pinctrl.dtsi b/arch/arm/boot/dts/uniphier-pinctrl.dtsi
> index de481c372467..c213f17a12ca 100644
> --- a/arch/arm/boot/dts/uniphier-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/uniphier-pinctrl.dtsi
> @@ -13,6 +13,46 @@
>                 function = "aout";
>         };
>
> +       pinctrl_ain1: ain1 {
> +               groups = "ain1";
> +               function = "ain1";
> +       };
> +
> +       pinctrl_ain2: ain2 {
> +               groups = "ain2";
> +               function = "ain2";
> +       };
> +
> +       pinctrl_ainiec1: ainiec1 {
> +               groups = "ainiec1";
> +               function = "ainiec1";
> +       };
> +
> +       pinctrl_aout1: aout1 {
> +               groups = "aout1";
> +               function = "aout1";
> +       };
> +
> +       pinctrl_aout2: aout2 {
> +               groups = "aout2";
> +               function = "aout2";
> +       };
> +
> +       pinctrl_aout3: aout3 {
> +               groups = "aout3";
> +               function = "aout3";
> +       };
> +
> +       pinctrl_aoutiec1: aoutiec1 {
> +               groups = "aoutiec1";
> +               function = "aoutiec1";
> +       };
> +
> +       pinctrl_aoutiec2: aoutiec2 {
> +               groups = "aoutiec2";
> +               function = "aoutiec2";
> +       };
> +
>         pinctrl_emmc: emmc {
>                 groups = "emmc", "emmc_dat8";
>                 function = "emmc";
> --
> 2.16.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
