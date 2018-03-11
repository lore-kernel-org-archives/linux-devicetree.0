From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 14/15] arm64: dts: mt7622: add High-Speed DMA device
 nodes
Date: Sun, 11 Mar 2018 20:39:17 +0100
Message-ID: <78991976-0af0-2292-78a1-89b19e4781c0@gmail.com>
References: <cover.1518895232.git.sean.wang@mediatek.com>
 <a350bd0f5ce5b94bd71fd7f02af804b9c0584fd7.1518895232.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a350bd0f5ce5b94bd71fd7f02af804b9c0584fd7.1518895232.git.sean.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 02/17/2018 08:54 PM, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> add High-Speed DMA (HSDMA) nodes
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

NAK. AFAIK the driver is not yest upstream

Regards,
Matthias

> ---
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index bad1e99..ffb934b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -715,6 +715,16 @@
>  		#reset-cells = <1>;
>  	};
>  
> +	hsdma: dma-controller@1b007000 {
> +		compatible = "mediatek,mt7622-hsdma";
> +		reg = <0 0x1b007000 0 0x1000>;
> +		interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&ethsys CLK_ETH_HSDMA_EN>;
> +		clock-names = "hsdma";
> +		power-domains = <&scpsys MT7622_POWER_DOMAIN_ETHSYS>;
> +		#dma-cells = <1>;
> +	};
> +
>  	eth: ethernet@1b100000 {
>  		compatible = "mediatek,mt7622-eth",
>  			     "mediatek,mt2701-eth",
> 
