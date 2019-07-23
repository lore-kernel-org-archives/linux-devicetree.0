From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 02/10] ARM: dts: imx6ul: segin: Add boot media to dts
 filename
Date: Tue, 23 Jul 2019 11:10:33 +0800
Message-ID: <20190723031032.GM3738@dragon>
References: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
 <1562656767-273566-3-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1562656767-273566-3-git-send-email-s.riedmueller@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: s.hauer@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, martyn.welch@collabora.com, linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 09, 2019 at 09:19:19AM +0200, Stefan Riedmueller wrote:
> There is now a PHYTEC phyCORE-i.MX 6UL with eMMC instead of NAND flash
> available. The dts filename needs to reflect that to differentiate both.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  arch/arm/boot/dts/Makefile                                           | 2 +-
>  ...l-phytec-segin-ff-rdk.dts => imx6ul-phytec-segin-ff-rdk-nand.dts} | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>  rename arch/arm/boot/dts/{imx6ul-phytec-segin-ff-rdk.dts => imx6ul-phytec-segin-ff-rdk-nand.dts} (85%)
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index e1924b06f3cb..668b57c8cc57 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -573,7 +573,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ul-opos6uldev.dtb \
>  	imx6ul-pico-hobbit.dtb \
>  	imx6ul-pico-pi.dtb \
> -	imx6ul-phytec-segin-ff-rdk.dtb \
> +	imx6ul-phytec-segin-ff-rdk-nand.dtb \
>  	imx6ul-tx6ul-0010.dtb \
>  	imx6ul-tx6ul-0011.dtb \
>  	imx6ul-tx6ul-mainboard.dtb \
> diff --git a/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk.dts b/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
> similarity index 85%
> rename from arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk.dts
> rename to arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
> index 1e59183a2f7c..dc06029c5701 100644
> --- a/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk.dts
> +++ b/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
> @@ -10,8 +10,9 @@
>  #include "imx6ul-phytec-segin-peb-eval-01.dtsi"
>  
>  / {
> -	model = "PHYTEC phyBOARD-Segin i.MX6 UltraLite Full Featured";
> -	compatible = "phytec,imx6ul-pbacd10", "phytec,imx6ul-pcl063", "fsl,imx6ul";
> +	model = "PHYTEC phyBOARD-Segin i.MX6 UltraLite Full Featured with NAND";
> +	compatible = "phytec,imx6ul-pbacd10-nand", "phytec,imx6ul-pbacd10",

The board compatibles need to be documented.

Shawn

> +		     "phytec,imx6ul-pcl063", "fsl,imx6ul";
>  };
>  
>  &adc1 {
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
