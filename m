From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCHv2] arm64: dts: ls1028a: add flexspi nodes
Date: Thu, 23 May 2019 16:00:51 +0800
Message-ID: <20190523080049.GI9261@dragon>
References: <20190515110924.13726-1-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190515110924.13726-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2019 at 11:09:25AM +0000, Xiaowei Bao wrote:
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
> 
> Add fspi node property for LS1028A SoC for FlexSPI driver.
> Property added for the FlexSPI controller and for the connected
> slave device for the LS1028ARDB and LS1028AQDS target.
> This is having one SPI-NOR flash device, mt35xu02g connected at
> CS0.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - modify the commit message and the dts format.
> 
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts |   15 +++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts |   15 +++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi    |   12 ++++++++++++
>  3 files changed, 42 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> index 5bcd491..6e12806 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> @@ -158,6 +158,21 @@
>  	};
>  };
>  
> +&fspi {

Keep the labeling node sort alphabetically.  That said, &fspi should be
added before &i2c0.

> +	status = "okay";

Please have newline between property and child node.

> +	mt35xu02g: flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "spansion,m25p80";

Please start properties with compatible.

> +		m25p,fast-read;
> +		spi-max-frequency = <20000000>;
> +		reg = <0>;
> +		/* The following setting enables 1-1-8 (CMD-ADDR-DATA) mode */
> +		spi-rx-bus-width = <8>; /* 8 SPI Rx lines */
> +		spi-tx-bus-width = <1>; /* 1 SPI Tx line */
> +	};
> +};
> +
>  &sai1 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> index 25d2370..5d39616 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> @@ -136,6 +136,21 @@
>  	};
>  };
>  
> +&fspi {
> +	status = "okay";
> +	mt35xu02g: flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "spansion,m25p80";
> +		m25p,fast-read;
> +		spi-max-frequency = <20000000>;
> +		reg = <0>;
> +		/* The following setting enables 1-1-8 (CMD-ADDR-DATA) mode */
> +		spi-rx-bus-width = <8>; /* 8 SPI Rx lines */
> +		spi-tx-bus-width = <1>; /* 1 SPI Tx line */
> +	};
> +};
> +
>  &duart0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index ba71a33..a27cd60 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -109,6 +109,18 @@
>  		};
>  	};
>  
> +	fspi: spi@20c0000 {

Are you sure you want to add this device node outside of 'soc' node?

> +		compatible = "nxp,lx2160a-fspi", "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x0 0x20c0000 0x0 0x10000>,
> +		    <0x0 0x20000000 0x0 0x10000000>;

Fix the indentation to git it aligned with above '<'.

> +		reg-names = "FSPI", "FSPI-memory";
> +		interrupts = <0 25 0x4>; /* Level high type */

interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;

Shawn

> +		clocks = <&clockgen 4 3>, <&clockgen 4 3>;
> +		clock-names = "fspi_en", "fspi";
> +	};
> +
>  	soc: soc {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> -- 
> 1.7.1
> 
