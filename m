From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: ls1012a: Add QSPI support for ls1012a
Date: Thu, 23 May 2019 16:43:42 +0800
Message-ID: <20190523084340.GM9261@dragon>
References: <20190516114807.30817-1-kuldeep.singh@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190516114807.30817-1-kuldeep.singh@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kuldeep Singh <kuldeep.singh@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, Ashish Kumar <ashish.kumar@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 16, 2019 at 11:47:04AM +0000, Kuldeep Singh wrote:
> QSPI support is added for kernel version greater than 5.0 and supports
> quad mode defined by
> TX-WIDTH = <4>, RX-WIDTH = <4>
> 
> RDB/QDS has one 64MB flash from SPANSION(s25fs512s)
> 
> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> ---
> Dependency on https://patchwork.ozlabs.org/patch/1100471/
> Dependency on https://patchwork.ozlabs.org/patch/1100472/
> 
>  .../arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts | 15 +++++++++++++++
>  .../arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts | 15 +++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts | 15 +++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts | 15 +++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi    | 15 +++++++++++++++
>  5 files changed, 75 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
> index f90c040fd5e8..8826278b37bf 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
> @@ -61,6 +61,21 @@
>  	status = "okay";
>  };
>  
> +&qspi {

Please sort these labeling nodes alphabetically.  That said, &qspi
should go after &i2c0.

> +	status = "okay";
> +
> +	qflash0: flash@0 {
> +		compatible = "spansion,m25p80", "jedec,spi-nor";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		m25p,fast-read;
> +		spi-max-frequency = <20000000>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <4>;
> +		reg = <0>;
> +	};
> +};
> +
>  &i2c0 {
>  	status = "okay";
>  
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
> index 8749634c55ee..0246e8c97628 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
> @@ -20,6 +20,21 @@
>  	status = "okay";
>  };
>  
> +&qspi {
> +	status = "okay";
> +
> +	qflash0: flash@0 {
> +		compatible = "spansion,m25p80", "jedec,spi-nor";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		m25p,fast-read;
> +		spi-max-frequency = <20000000>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <4>;
> +		reg = <0>;
> +	};
> +};
> +
>  &i2c0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
> index 2fb1cb1f7d8f..c304fa20c1c9 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
> @@ -90,6 +90,21 @@
>  	};
>  };
>  
> +&qspi {
> +	status = "okay";
> +
> +	qflash0: flash@0 {
> +		compatible = "spansion,m25p80", "jedec,spi-nor";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		m25p,fast-read;
> +		spi-max-frequency = <20000000>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <4>;
> +		reg = <0>;
> +	};
> +};
> +
>  &duart0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
> index 5edb1e137a52..6017e9cfe40a 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
> @@ -38,3 +38,18 @@
>  &sata {
>  	status = "okay";
>  };
> +
> +&qspi {
> +	status = "okay";
> +
> +	qflash0: flash@0  {
> +		compatible = "spansion,m25p80", "jedec,spi-nor";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		m25p,fast-read;
> +		spi-max-frequency = <20000000>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <4>;
> +		reg = <0>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> index ec6257a5b251..268268c6a149 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> @@ -350,6 +350,21 @@
>  			status = "disabled";
>  		};
>  
> +		qspi: spi@1550000 {

Please sort node with unit-address in that address.  That said, it
should go before esdhc@1560000.

> +			compatible = "fsl,ls1021a-qspi", "fsl,ls1012a-qspi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0 0x1550000 0x0 0x10000>,
> +				<0x0 0x40000000 0x0 0x10000000>;
> +			reg-names = "QuadSPI", "QuadSPI-memory";
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-names = "qspi_en", "qspi";
> +			clocks = <&clockgen 4 1>, <&clockgen 4 1>;
> +			big-endian;
> +			fsl,qspi-has-second-chip;

Undocumented property?

Shawn

> +			status = "disabled";
> +		};
> +
>  		duart0: serial@21c0500 {
>  			compatible = "fsl,ns16550", "ns16550a";
>  			reg = <0x00 0x21c0500 0x0 0x100>;
> -- 
> 2.17.1
> 
