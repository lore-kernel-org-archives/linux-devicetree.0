From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] arm64: dts: mt2712: Remove un-used property for PCIe
Date: Fri, 12 Apr 2019 11:02:51 +0100
Message-ID: <20190412100251.GC8113@red-moon>
References: <1552897675-8051-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552897675-8051-1-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: matthias.bgg@gmail.com, robh@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ryder.lee@mediatek.com, robh+dt@kernel.org, youlin.pei@mediatek.com, jianjun.wang@mediatek.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 18, 2019 at 04:27:55PM +0800, honghui.zhang@mediatek.com wrote:
> From: Honghui Zhang <honghui.zhang@mediatek.com>
> 
> The "num-lanes" property for PCIe is not used, remove it.
> 
> Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 2 --
>  1 file changed, 2 deletions(-)

Applied to pci/mediatek for v5.2, thanks.

Lorenzo

> diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> index 976d92a..43307ba 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> @@ -819,7 +819,6 @@
>  			#size-cells = <2>;
>  			#interrupt-cells = <1>;
>  			ranges;
> -			num-lanes = <1>;
>  			interrupt-map-mask = <0 0 0 7>;
>  			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
>  					<0 0 0 2 &pcie_intc0 1>,
> @@ -840,7 +839,6 @@
>  			#size-cells = <2>;
>  			#interrupt-cells = <1>;
>  			ranges;
> -			num-lanes = <1>;
>  			interrupt-map-mask = <0 0 0 7>;
>  			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
>  					<0 0 0 2 &pcie_intc1 1>,
> -- 
> 2.6.4
> 
