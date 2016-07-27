From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3] arm64: dts: mt8173: add mmsel clocks for 4K support
Date: Wed, 27 Jul 2016 11:32:44 +0200
Message-ID: <1469611964.2470.30.camel@pengutronix.de>
References: <1469607914-64831-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469607914-64831-1-git-send-email-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, James Liao <jamesjj.liao@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, YH Huang <yh.huang@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, "dawei.chien@mediatek.com" <dawei.chien@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Ju
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 27.07.2016, 16:25 +0800 schrieb Bibby Hsieh:
> If MT8173 can support HDMI 4K resoultion, the
> VENCPLL should be configured to 800MHZ.
> We didn't set VENCPLL directly, we set the
> mm_sel to 400MHz statically in the board device tree.

Maybe add a comment that the board .dts file should override the clock
rate property with the higher VENCPLL frequency the board supports HDMI
4K resolution.

> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
> Changes since v2:
>  - Align the clocks of dpi0 node.
> 
> Changes since v1:
>  - Do not set the VENCPLL by clk_set_rate
>    at display driver.
>  - Configure the mm_sel to 400MHz statically
>    in the board device tree.
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 78529e4..9c22204 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -690,7 +690,9 @@
>  			compatible = "mediatek,mt8173-mmsys", "syscon";
>  			reg = <0 0x14000000 0 0x1000>;
>  			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> +			clocks = <&topckgen CLK_TOP_MM_SEL>;
>  			#clock-cells = <1>;
> +			clock-frequency  = <400000000>;

According to the "Assigned clock parents and rates" section in
Documentation/devicetree/bindings/clock/clock-bindings.txt,
this should be:
			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
			assigned-clock-rates = <400000000>;

regards
Philipp
