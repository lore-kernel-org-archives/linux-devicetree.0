From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: ls1028a: Add FlexSPI support for NXP LS1028
Date: Sun, 6 Oct 2019 11:20:21 +0800
Message-ID: <20191006032019.GP7150@dragon>
References: <1568118055-9740-1-git-send-email-Ashish.Kumar@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568118055-9740-1-git-send-email-Ashish.Kumar@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ashish Kumar <Ashish.Kumar@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 05:50:51PM +0530, Ashish Kumar wrote:
> Add fspi node property for LS1028A SoC for FlexSPI driver.
> Property added for FlexSPI controller and for the connected
> slave device for the LS1028ARDB and LS1028AQDS target.
> RDB and QDS is having one SPI-NOR flash device, mt35xu02g
> connected at CS0.
> This flash device "mt35xu02g" is tested for octal read
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Ashish Kumar <Ashish.Kumar@nxp.com>

When you send a patch series, the patches should be numbered properly
and preferably with a cover-letter.

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 15 +++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts | 15 +++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi    | 13 +++++++++++++
>  3 files changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> index 5e14e5a..5d46993 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> @@ -103,6 +103,21 @@
>  	status = "okay";
>  };
>  
> +&fspi {
> +	status = "okay";

Have a newline between properties and child node..

> +	flash0: mt35xu02g@0 {

Use a generic node name and specific label name.

> +		compatible = "micron,mt35xu02g", "jedec,spi-nor";

"micron,mt35xu02g" is undocumented.

Shawn

> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		m25p,fast-read;
> +		spi-max-frequency = <50000000>;
> +		reg = <0>;
> +		/* The following setting enables 1-1-8 (CMD-ADDR-DATA) mode */
> +		spi-rx-bus-width = <8>; /* 8 SPI Rx lines */
> +		spi-tx-bus-width = <1>; /* 1 SPI Tx line */
> +	};
> +};
> +
>  &i2c0 {
>  	status = "okay";
>  
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> index 1a69221..f33cb2e 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> @@ -96,6 +96,21 @@
>  	status = "okay";
>  };
>  
> +&fspi {
> +	status = "okay";
> +	flash0: mt35xu02g@0 {
> +		compatible = "micron,mt35xu02g", "jedec,spi-nor";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		m25p,fast-read;
> +		spi-max-frequency = <50000000>;
> +		reg = <0>;
> +		/* The following setting enables 1-1-8 (CMD-ADDR-DATA) mode */
> +		spi-rx-bus-width = <8>; /* 8 SPI Rx lines */
> +		spi-tx-bus-width = <1>; /* 1 SPI Tx line */
> +	};
> +};
> +
>  &i2c0 {
>  	status = "okay";
>  
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index b139b29..4aa1825 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -174,6 +174,19 @@
>  			clocks = <&sysclk>;
>  		};
>  
> +		fspi: spi@20c0000 {
> +			compatible = "nxp,lx2160a-fspi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0 0x20c0000 0x0 0x10000>,
> +			      <0x0 0x20000000 0x0 0x10000000>;
> +			reg-names = "fspi_base", "fspi_mmap";
> +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
> +			clock-names = "fspi_en", "fspi";
> +			status = "disabled";
> +		};
> +
>  		i2c0: i2c@2000000 {
>  			compatible = "fsl,vf610-i2c";
>  			#address-cells = <1>;
> -- 
> 2.7.4
> 
