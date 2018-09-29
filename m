From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: add pwrap device node for
 mt8183
Date: Sat, 29 Sep 2018 15:30:54 +0200
Message-ID: <f1cc2f58-ad3c-2f88-8e86-b80848e17cc5@gmail.com>
References: <1537341961-20736-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1537341961-20736-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537341961-20736-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: argus.lin@mediatek.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, chenglin.xu@mediatek.com, chen.zhong@mediatek.com, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org



On 19/09/2018 09:26, Hsin-Hsiung Wang wrote:
> add pwrap device node for mt8183.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)

The basic support for mt8183 is not ready to be merged.
I'll also try to not forget about this patch.
If you re-submit after basic mt8183 support got accepted, that will help me. :)

Thanks,
Matthias

> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c22a2dc..fa67d781 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -170,6 +170,16 @@
>  		#clock-cells = <1>;
>  	};
>  
> +	pwrap: pwrap@1000d000 {
> +		compatible = "mediatek,mt8183-pwrap";
> +		reg = <0 0x1000d000 0 0x1000>;
> +		reg-names = "pwrap";
> +		interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&topckgen CLK_TOP_MUX_PMICSPI>,
> +			 <&infracfg CLK_INFRA_PMIC_AP>;
> +		clock-names = "spi", "wrap";
> +	};
> +
>  	uart0: serial@11002000 {
>  		compatible = "mediatek,mt8183-uart",
>  			     "mediatek,mt6577-uart";
> 
