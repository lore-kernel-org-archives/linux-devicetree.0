From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6: Extend support for Phytec phycore
 i.MX6ULL SoM
Date: Sun, 6 Oct 2019 16:23:52 +0800
Message-ID: <20191006082349.GA7150@dragon>
References: <20190912202928.946200-1-pn@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190912202928.946200-1-pn@denx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Parthiban Nallathambi <pn@denx.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2019 at 10:29:28PM +0200, Parthiban Nallathambi wrote:
> Extend Phycore i.MX6UL SoM for i.MX6ULL with on board eMMC. Phycore
> i.MX6ULL is deployed with same carrier board Segin as the pins are
> compatible with UL version.
> 
> Signed-off-by: Parthiban Nallathambi <pn@denx.de>

What is the base that the patch was generated from?  It doesn't apply to
my tree.

Shawn

> ---
>  arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi   | 26 +++++++++++++++++--
>  .../dts/imx6ul-phytec-phyboard-segin-full.dts |  5 ++++
>  arch/arm/boot/dts/imx6ull-phytec-pcl063.dtsi  | 24 +++++++++++++++++
>  3 files changed, 53 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/dts/imx6ull-phytec-pcl063.dtsi
> 
> diff --git a/arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi b/arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi
> index fc2997449b49..822a178ce438 100644
> --- a/arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi
> +++ b/arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi
> @@ -7,7 +7,6 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pwm/pwm.h>
> -#include "imx6ul.dtsi"
>  
>  / {
>  	model = "Phytec phyCORE i.MX6 UltraLite";
> @@ -65,7 +64,7 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
>  	nand-on-flash-bbt;
> -	status = "okay";
> +	status = "disabled";
>  };
>  
>  &i2c1 {
> @@ -90,6 +89,15 @@
>  	status = "okay";
>  };
>  
> +&usdhc2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc2>;
> +	bus-width = <8>;
> +	no-1-8-v;
> +	non-removable;
> +	status = "disabled";
> +};
> +
>  &iomuxc {
>  	pinctrl_enet1: enet1grp {
>  		fsl,pins = <
> @@ -145,4 +153,18 @@
>  		>;
>  	};
>  
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170f9
> +			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100f9
> +			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170f9
> +			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170f9
> +			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170f9
> +			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170f9
> +			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170f9
> +			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170f9
> +			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170f9
> +			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170f9
> +		>;
> +	};
>  };
> diff --git a/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts b/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts
> index b6a1407a9d44..76f2447f2657 100644
> --- a/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts
> +++ b/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts
> @@ -5,6 +5,7 @@
>   */
>  
>  /dts-v1/;
> +#include "imx6ul.dtsi"
>  #include "imx6ul-phytec-pcl063.dtsi"
>  #include "imx6ul-phytec-phyboard-segin.dtsi"
>  #include "imx6ul-phytec-peb-eval-01.dtsi"
> @@ -37,6 +38,10 @@
>  	status = "okay";
>  };
>  
> +&gpmi {
> +	status = "okay";
> +};
> +
>  &i2c_rtc {
>  	status = "okay";
>  };
> diff --git a/arch/arm/boot/dts/imx6ull-phytec-pcl063.dtsi b/arch/arm/boot/dts/imx6ull-phytec-pcl063.dtsi
> new file mode 100644
> index 000000000000..3f749d9f09a5
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ull-phytec-pcl063.dtsi
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2018 PHYTEC Messtechnik GmbH
> + * Author: Stefan Riedmueller <s.riedmueller@phytec.de>
> + */
> +
> +#include "imx6ul-phytec-pcl063.dtsi"
> +
> +/ {
> +	model = "PHYTEC phyCORE-i.MX 6ULL";
> +	compatible = "phytec,imx6ull-pcl063", "fsl,imx6ull";
> +};
> +
> +&iomuxc {
> +	/delete-node/ gpioledssomgrp;
> +};
> +
> +&iomuxc_snvs {
> +	pinctrl_gpioleds_som: gpioledssomgrp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x0b0b0
> +		>;
> +	};
> +};
> -- 
> 2.21.0
> 
