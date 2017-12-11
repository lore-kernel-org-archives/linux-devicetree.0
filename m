From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] arm: dts: uniphier: add efuse node for UniPhier 32bit SoC
Date: Tue, 12 Dec 2017 01:05:40 +0900
Message-ID: <CAK7LNARmYfnYpACrUtYccBPyjnvXg0ymA=WZ=+nGAtanaXZk1w@mail.gmail.com>
References: <1512375130-16860-1-git-send-email-hayashibara.keiji@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512375130-16860-1-git-send-email-hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Kiyoshi Owada <owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-12-04 17:12 GMT+09:00 Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
> Add efuse node for UniPhier LD4, Pro4, sLD8, Pro5 and PXs2.
> This efuse node is included in soc-glue.
>
> Signed-off-by: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
>  arch/arm/boot/dts/uniphier-ld4.dtsi  | 18 ++++++++++++++++++
>  arch/arm/boot/dts/uniphier-pro4.dtsi | 23 +++++++++++++++++++++++
>  arch/arm/boot/dts/uniphier-pro5.dtsi | 33 +++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/uniphier-pxs2.dtsi | 18 ++++++++++++++++++
>  arch/arm/boot/dts/uniphier-sld8.dtsi | 18 ++++++++++++++++++
>  5 files changed, 110 insertions(+)


Applied to linux-uniphier,
but please reconsider To: list next time.

This patch was addressed to Rob and Mark,
but they do not pick up platform DT patches.


You do not need to get Rob's Ack for a patch like this.


Binding is a contract between operation system and DT.

The binding for this
(Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt)
was approved by Rob and merged in the mainline.

Given that this patch follows the binding correctly,
it should be safe.

Thanks.



> diff --git a/arch/arm/boot/dts/uniphier-ld4.dtsi b/arch/arm/boot/dts/uniphier-ld4.dtsi
> index 01fc3e1..6883f3b 100644
> --- a/arch/arm/boot/dts/uniphier-ld4.dtsi
> +++ b/arch/arm/boot/dts/uniphier-ld4.dtsi
> @@ -273,6 +273,24 @@
>                         };
>                 };
>
> +               soc-glue@5f900000 {
> +                       compatible = "socionext,uniphier-ld4-soc-glue-debug",
> +                                    "simple-mfd";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0x5f900000 0x2000>;
> +
> +                       efuse@100 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x100 0x28>;
> +                       };
> +
> +                       efuse@130 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x130 0x8>;
> +                       };
> +               };
> +
>                 timer@60000200 {
>                         compatible = "arm,cortex-a9-global-timer";
>                         reg = <0x60000200 0x20>;
> diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
> index 7955c3a..150726b 100644
> --- a/arch/arm/boot/dts/uniphier-pro4.dtsi
> +++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
> @@ -294,6 +294,29 @@
>                         };
>                 };
>
> +               soc-glue@5f900000 {
> +                       compatible = "socionext,uniphier-pro4-soc-glue-debug",
> +                                    "simple-mfd";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0x5f900000 0x2000>;
> +
> +                       efuse@100 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x100 0x28>;
> +                       };
> +
> +                       efuse@130 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x130 0x8>;
> +                       };
> +
> +                       efuse@200 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x200 0x14>;
> +                       };
> +               };
> +
>                 aidet: aidet@5fc20000 {
>                         compatible = "socionext,uniphier-pro4-aidet";
>                         reg = <0x5fc20000 0x200>;
> diff --git a/arch/arm/boot/dts/uniphier-pro5.dtsi b/arch/arm/boot/dts/uniphier-pro5.dtsi
> index 6589b8a..f291dd6 100644
> --- a/arch/arm/boot/dts/uniphier-pro5.dtsi
> +++ b/arch/arm/boot/dts/uniphier-pro5.dtsi
> @@ -355,6 +355,39 @@
>                         };
>                 };
>
> +               soc-glue@5f900000 {
> +                       compatible = "socionext,uniphier-pro5-soc-glue-debug",
> +                                    "simple-mfd";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0x5f900000 0x2000>;
> +
> +                       efuse@100 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x100 0x28>;
> +                       };
> +
> +                       efuse@130 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x130 0x8>;
> +                       };
> +
> +                       efuse@200 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x200 0x28>;
> +                       };
> +
> +                       efuse@300 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x300 0x14>;
> +                       };
> +
> +                       efuse@400 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x400 0x8>;
> +                       };
> +               };
> +
>                 aidet: aidet@5fc20000 {
>                         compatible = "socionext,uniphier-pro5-aidet";
>                         reg = <0x5fc20000 0x200>;
> diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
> index d82d6d8..8e54e87 100644
> --- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
> +++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
> @@ -375,6 +375,24 @@
>                         };
>                 };
>
> +               soc-glue@5f900000 {
> +                       compatible = "socionext,uniphier-pxs2-soc-glue-debug",
> +                                    "simple-mfd";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0x5f900000 0x2000>;
> +
> +                       efuse@100 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x100 0x28>;
> +                       };
> +
> +                       efuse@200 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x200 0x58>;
> +                       };
> +               };
> +
>                 aidet: aidet@5fc20000 {
>                         compatible = "socionext,uniphier-pxs2-aidet";
>                         reg = <0x5fc20000 0x200>;
> diff --git a/arch/arm/boot/dts/uniphier-sld8.dtsi b/arch/arm/boot/dts/uniphier-sld8.dtsi
> index 7188536..afafe7c 100644
> --- a/arch/arm/boot/dts/uniphier-sld8.dtsi
> +++ b/arch/arm/boot/dts/uniphier-sld8.dtsi
> @@ -277,6 +277,24 @@
>                         };
>                 };
>
> +               soc-glue@5f900000 {
> +                       compatible = "socionext,uniphier-sld8-soc-glue-debug",
> +                                    "simple-mfd";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0x5f900000 0x2000>;
> +
> +                       efuse@100 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x100 0x28>;
> +                       };
> +
> +                       efuse@200 {
> +                               compatible = "socionext,uniphier-efuse";
> +                               reg = <0x200 0x14>;
> +                       };
> +               };
> +
>                 timer@60000200 {
>                         compatible = "arm,cortex-a9-global-timer";
>                         reg = <0x60000200 0x20>;
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
