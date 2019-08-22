From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: fix pwrap gic number
Date: Thu, 22 Aug 2019 11:26:12 +0200
Message-ID: <4a12b168-23ce-03cf-d87f-b03f69f28e67@gmail.com>
References: <1566464140-26977-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566464140-26977-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org



On 22/08/2019 10:55, Hsin-Hsiung Wang wrote:
> The correct gic number of pwrap is 185 instead of 209. This patch fixes
> it to avoid triggering error interrupt.
> 
> Fixes: e526c9bc11f8 ("arm64: dts: Add Mediatek SoC MT8183 and evaluation board dts and Makefile")
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c2749c4..afb0996 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -248,7 +248,7 @@
>  			compatible = "mediatek,mt8183-pwrap";
>  			reg = <0 0x1000d000 0 0x1000>;
>  			reg-names = "pwrap";
> -			interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&topckgen CLK_TOP_MUX_PMICSPI>,
>  				 <&infracfg CLK_INFRA_PMIC_AP>;
>  			clock-names = "spi", "wrap";
> 

Applied, thanks.
