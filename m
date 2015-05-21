From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH 5/5] ARM64: MediaTek MT8173: Add SCPSYS device node
Date: Thu, 21 May 2015 22:32:40 +0800
Message-ID: <CAGS+omDHEY54TzhNTJcFOeHkGbXAQwiTh9gxc=PsbzjwmpHEDA@mail.gmail.com>
References: <1432131540-2523-1-git-send-email-s.hauer@pengutronix.de> <1432131540-2523-6-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432131540-2523-6-git-send-email-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, Sasha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 20, 2015 at 10:19 PM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> This adds the SCPSYS device node to the MT8173 dtsi file.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 924fdb6..12430f0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -125,6 +125,16 @@
>                                                 <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               scpsys: scpsys@10006000 {
> +                       compatible = "mediatek,mt8173-scpsys";
> +                       #power-domain-cells = <1>;
> +                       reg = <0 0x10006000 0 0x1000>;
> +                       clocks = <&clk26m>,

Why is mfg using <&clk26m> and not <&topckgen CLK_TOP_MFG_SEL>?
I saw another patch set on the list today from James Liao that adds more clocks.
Perhaps we can move the SCPSYS set on top of that one and include more clocks?

> +                                <&topckgen CLK_TOP_MM_SEL>;

FYI: the devicetree changes in this set depend on your other patch set
starting with:

https://patchwork.kernel.org/patch/6446341/
"arm64: dts: mt8173: Add clock controller device nodes"

This patch isn't based on top of the other set, though, so it may lead
to a small merge conflict when folding in the .dtsi device nodes (ie,
placing scpsys@10006000 after pwrap@1000d000).

I'm not sure how people usually resolve this or manage the ordering of
co-dependent patch sets upstream.

-Dan

> +                       clock-names = "mfg", "mm";
> +                       infracfg = <&infracfg>;
> +               };
> +
>                 sysirq: intpol-controller@10200620 {
>                         compatible = "mediatek,mt8173-sysirq",
>                                         "mediatek,mt6577-sysirq";
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
