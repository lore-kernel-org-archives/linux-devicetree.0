From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] arm64: dts: uniphier: add syscon property for UniPhier
 sound system
Date: Mon, 19 Mar 2018 23:35:32 +0900
Message-ID: <CAK7LNAQ__FYvJdvxPhzazyi4fSCwkMzCWGVVjy5FKfOp+-hfcg@mail.gmail.com>
References: <20180319012158.26411-1-suzuki.katsuhiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180319012158.26411-1-suzuki.katsuhiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2018-03-19 10:21 GMT+09:00 Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
> This patch adds syscon property for specifying soc-glue core into
> device-tree of LD11/LD20 SoC.
>
> Currently, soc-glue core is used for changing the state of S/PDIF
> signal output pin to signal output state or Hi-Z state.
>
> Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
> ---
>  arch/arm/boot/dts/uniphier-pxs2.dtsi             | 4 +++-


Please split PXs2 changes into a different patch.


>  arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 4 +++-
>  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 4 +++-
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
> index 595045441c9c..c72c0a123c87 100644
> --- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
> +++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
> @@ -243,6 +243,8 @@
>                         resets = <&sys_rst 40>;
>                         #sound-dai-cells = <1>;
>
> +                       socionext,syscon = <&sg>;


Remove unneeded blank line between properties.


> +
>                         i2s_port0: port@0 {
>                                 i2s_hdmi: endpoint {
>                                 };
> @@ -418,7 +420,7 @@
>                         };
>                 };
>
> -               soc-glue@5f800000 {
> +               sg: soc-glue@5f800000 {
>                         compatible = "socionext,uniphier-pxs2-soc-glue",
>                                      "simple-mfd", "syscon";
>                         reg = <0x5f800000 0x2000>;


Could you use 'soc_glue', please?
I saw a conflict between 'sg' and 'soc_glue' among Socionext engineers
and I prefer the latter.



-- 
Best Regards
Masahiro Yamada
