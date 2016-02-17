From: Han Xu <xhnjupt@gmail.com>
Subject: Re: [PATCH v4 6/7] dts/ls2080a: update the DTS for QSPI and DSPI
 support
Date: Thu, 18 Feb 2016 01:16:27 +0800
Message-ID: <20160217171627.GG16812@shlinux2>
References: <1453793041-35868-1-git-send-email-yao.yuan@freescale.com>
 <1453793041-35868-6-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453793041-35868-6-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuan Yao <yao.yuan@freescale.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, han.xu@freescale.com, robh@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, yao.yuan@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 26, 2016 at 03:24:00PM +0800, Yuan Yao wrote:
> Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> ---
> Changed in v4:
> No changes.
> 
> Changed in v3:
> No changes.
> 
> Changed in v2:
> Update my email to <yao.yuan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts | 9 ++++++++-
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi    | 4 ++--
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
> index 4cb996d..e8801fa 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
> @@ -178,7 +178,14 @@
>  
>  &qspi {
>  	status = "okay";
> -	qflash0: s25fl008k {
> +	flash0: s25fl256s1@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "st,m25p80";
> +		spi-max-frequency = <20000000>;
> +		reg = <0>;
> +	};
> +	flash2: s25fl256s1@2 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		compatible = "st,m25p80";
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> index 2b23d03..65e612a 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> @@ -318,7 +318,7 @@
>  
>  		dspi: dspi@2100000 {
>  			status = "disabled";
> -			compatible = "fsl,vf610-dspi";
> +			compatible = "fsl,ls2080a-dspi", "fsl,ls2085a-dspi";
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			reg = <0x0 0x2100000 0x0 0x10000>;
> @@ -444,7 +444,7 @@
>  
>  		qspi: quadspi@20c0000 {
>  			status = "disabled";
> -			compatible = "fsl,vf610-qspi";
> +			compatible = "fsl,ls2080a-qspi", "fsl,ls1021a-qspi";
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			reg = <0x0 0x20c0000 0x0 0x10000>,
> -- 
> 2.1.0.27.g96db324
> 
> 
Acked-by: Han xu <han.xu@nxp.com>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
