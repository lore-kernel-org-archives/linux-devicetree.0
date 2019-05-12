Return-Path: <shawnguo@kernel.org>
Date: Sun, 12 May 2019 16:28:23 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: imx7d: correct the pad drive strength
 setting
Message-ID: <20190512082822.GO15856@dragon>
References: <20190429124547.19928-1-haibo.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429124547.19928-1-haibo.chen@nxp.com>
To: BOUGH CHEN <haibo.chen@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Apr 29, 2019 at 12:37:57PM +0000, BOUGH CHEN wrote:
> commit 5490c77d596a ("dt-bindings: pinctrl: imx7d: Fix PAD_CTL_DSE_X*")
> point out that the PAD_CTL_DSE_X* values are wrongly document in the
> RM. For the USDHC 100Mhz pad drive strength, it should be PAD_CTL_DSE_X4,
> this patch fix this.
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

I do not apply patches using base64 encoding.

Shawn

> ---
>  arch/arm/boot/dts/imx7-colibri.dtsi | 22 +++++++++----------
>  arch/arm/boot/dts/imx7-mba7.dtsi    | 10 ++++-----
>  arch/arm/boot/dts/imx7-tqma7.dtsi   | 20 ++++++++---------
>  arch/arm/boot/dts/imx7d-pico.dtsi   | 32 +++++++++++++--------------
>  arch/arm/boot/dts/imx7d-sdb.dts     | 34 ++++++++++++++---------------
>  5 files changed, 59 insertions(+), 59 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
> index 895fbde4d433..b9d5dd35731b 100644
> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> @@ -630,17 +630,17 @@
>  
>  	pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
>  		fsl,pins = <
> -			MX7D_PAD_SD3_CMD__SD3_CMD		0x5a
> -			MX7D_PAD_SD3_CLK__SD3_CLK		0x1a
> -			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x5a
> -			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x5a
> -			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x5a
> -			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x5a
> -			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x5a
> -			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x5a
> -			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x5a
> -			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x5a
> -			MX7D_PAD_SD3_STROBE__SD3_STROBE         0x1a
> +			MX7D_PAD_SD3_CMD__SD3_CMD		0x59
> +			MX7D_PAD_SD3_CLK__SD3_CLK		0x19
> +			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x59
> +			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x59
> +			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x59
> +			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x59
> +			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x59
> +			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x59
> +			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x59
> +			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59
> +			MX7D_PAD_SD3_STROBE__SD3_STROBE         0x19
>  		>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/imx7-mba7.dtsi b/arch/arm/boot/dts/imx7-mba7.dtsi
> index 50abf18ad30b..9ecaabe7bcc7 100644
> --- a/arch/arm/boot/dts/imx7-mba7.dtsi
> +++ b/arch/arm/boot/dts/imx7-mba7.dtsi
> @@ -437,12 +437,12 @@
>  
>  	pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {
>  		fsl,pins = <
> -			MX7D_PAD_SD1_CMD__SD1_CMD		0x5a
> +			MX7D_PAD_SD1_CMD__SD1_CMD		0x59
>  			MX7D_PAD_SD1_CLK__SD1_CLK		0x57
> -			MX7D_PAD_SD1_DATA0__SD1_DATA0		0x5a
> -			MX7D_PAD_SD1_DATA1__SD1_DATA1		0x5a
> -			MX7D_PAD_SD1_DATA2__SD1_DATA2		0x5a
> -			MX7D_PAD_SD1_DATA3__SD1_DATA3		0x5a
> +			MX7D_PAD_SD1_DATA0__SD1_DATA0		0x59
> +			MX7D_PAD_SD1_DATA1__SD1_DATA1		0x59
> +			MX7D_PAD_SD1_DATA2__SD1_DATA2		0x59
> +			MX7D_PAD_SD1_DATA3__SD1_DATA3		0x59
>  		>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/imx7-tqma7.dtsi b/arch/arm/boot/dts/imx7-tqma7.dtsi
> index 9aaed85138cb..a3aa63b241e2 100644
> --- a/arch/arm/boot/dts/imx7-tqma7.dtsi
> +++ b/arch/arm/boot/dts/imx7-tqma7.dtsi
> @@ -178,17 +178,17 @@
>  
>  	pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
>  		fsl,pins = <
> -			MX7D_PAD_SD3_CMD__SD3_CMD               0x5a
> +			MX7D_PAD_SD3_CMD__SD3_CMD               0x59
>  			MX7D_PAD_SD3_CLK__SD3_CLK               0x51
> -			MX7D_PAD_SD3_DATA0__SD3_DATA0           0x5a
> -			MX7D_PAD_SD3_DATA1__SD3_DATA1           0x5a
> -			MX7D_PAD_SD3_DATA2__SD3_DATA2           0x5a
> -			MX7D_PAD_SD3_DATA3__SD3_DATA3           0x5a
> -			MX7D_PAD_SD3_DATA4__SD3_DATA4           0x5a
> -			MX7D_PAD_SD3_DATA5__SD3_DATA5           0x5a
> -			MX7D_PAD_SD3_DATA6__SD3_DATA6           0x5a
> -			MX7D_PAD_SD3_DATA7__SD3_DATA7           0x5a
> -			MX7D_PAD_SD3_STROBE__SD3_STROBE         0x1a
> +			MX7D_PAD_SD3_DATA0__SD3_DATA0           0x59
> +			MX7D_PAD_SD3_DATA1__SD3_DATA1           0x59
> +			MX7D_PAD_SD3_DATA2__SD3_DATA2           0x59
> +			MX7D_PAD_SD3_DATA3__SD3_DATA3           0x59
> +			MX7D_PAD_SD3_DATA4__SD3_DATA4           0x59
> +			MX7D_PAD_SD3_DATA5__SD3_DATA5           0x59
> +			MX7D_PAD_SD3_DATA6__SD3_DATA6           0x59
> +			MX7D_PAD_SD3_DATA7__SD3_DATA7           0x59
> +			MX7D_PAD_SD3_STROBE__SD3_STROBE         0x19
>  		>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/imx7d-pico.dtsi b/arch/arm/boot/dts/imx7d-pico.dtsi
> index 6f50ebf31a0a..223092eae6c0 100644
> --- a/arch/arm/boot/dts/imx7d-pico.dtsi
> +++ b/arch/arm/boot/dts/imx7d-pico.dtsi
> @@ -491,12 +491,12 @@
>  
>  	pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {
>  		fsl,pins = <
> -			MX7D_PAD_SD1_CMD__SD1_CMD		0x5a
> -			MX7D_PAD_SD1_CLK__SD1_CLK		0x1a
> -			MX7D_PAD_SD1_DATA0__SD1_DATA0		0x5a
> -			MX7D_PAD_SD1_DATA1__SD1_DATA1		0x5a
> -			MX7D_PAD_SD1_DATA2__SD1_DATA2		0x5a
> -			MX7D_PAD_SD1_DATA3__SD1_DATA3		0x5a
> +			MX7D_PAD_SD1_CMD__SD1_CMD		0x59
> +			MX7D_PAD_SD1_CLK__SD1_CLK		0x19
> +			MX7D_PAD_SD1_DATA0__SD1_DATA0		0x59
> +			MX7D_PAD_SD1_DATA1__SD1_DATA1		0x59
> +			MX7D_PAD_SD1_DATA2__SD1_DATA2		0x59
> +			MX7D_PAD_SD1_DATA3__SD1_DATA3		0x59
>  			MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x15
>  		>;
>  	};
> @@ -541,16 +541,16 @@
>  
>  	pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
>  		fsl,pins = <
> -			MX7D_PAD_SD3_CMD__SD3_CMD		0x5a
> -			MX7D_PAD_SD3_CLK__SD3_CLK		0x1a
> -			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x5a
> -			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x5a
> -			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x5a
> -			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x5a
> -			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x5a
> -			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x5a
> -			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x5a
> -			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x5a
> +			MX7D_PAD_SD3_CMD__SD3_CMD		0x59
> +			MX7D_PAD_SD3_CLK__SD3_CLK		0x19
> +			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x59
> +			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x59
> +			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x59
> +			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x59
> +			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x59
> +			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x59
> +			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x59
> +			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59
>  		>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
> index 202922ed3754..6a6035b2bc22 100644
> --- a/arch/arm/boot/dts/imx7d-sdb.dts
> +++ b/arch/arm/boot/dts/imx7d-sdb.dts
> @@ -665,12 +665,12 @@
>  
>  		pinctrl_usdhc2_100mhz: usdhc2grp_100mhz {
>  			fsl,pins = <
> -				MX7D_PAD_SD2_CMD__SD2_CMD		0x5a
> -				MX7D_PAD_SD2_CLK__SD2_CLK		0x1a
> -				MX7D_PAD_SD2_DATA0__SD2_DATA0		0x5a
> -				MX7D_PAD_SD2_DATA1__SD2_DATA1		0x5a
> -				MX7D_PAD_SD2_DATA2__SD2_DATA2		0x5a
> -				MX7D_PAD_SD2_DATA3__SD2_DATA3		0x5a
> +				MX7D_PAD_SD2_CMD__SD2_CMD		0x59
> +				MX7D_PAD_SD2_CLK__SD2_CLK		0x19
> +				MX7D_PAD_SD2_DATA0__SD2_DATA0		0x59
> +				MX7D_PAD_SD2_DATA1__SD2_DATA1		0x59
> +				MX7D_PAD_SD2_DATA2__SD2_DATA2		0x59
> +				MX7D_PAD_SD2_DATA3__SD2_DATA3		0x59
>  			>;
>  		};
>  
> @@ -704,17 +704,17 @@
>  
>  		pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
>  			fsl,pins = <
> -				MX7D_PAD_SD3_CMD__SD3_CMD		0x5a
> -				MX7D_PAD_SD3_CLK__SD3_CLK		0x1a
> -				MX7D_PAD_SD3_DATA0__SD3_DATA0		0x5a
> -				MX7D_PAD_SD3_DATA1__SD3_DATA1		0x5a
> -				MX7D_PAD_SD3_DATA2__SD3_DATA2		0x5a
> -				MX7D_PAD_SD3_DATA3__SD3_DATA3		0x5a
> -				MX7D_PAD_SD3_DATA4__SD3_DATA4		0x5a
> -				MX7D_PAD_SD3_DATA5__SD3_DATA5		0x5a
> -				MX7D_PAD_SD3_DATA6__SD3_DATA6		0x5a
> -				MX7D_PAD_SD3_DATA7__SD3_DATA7		0x5a
> -				MX7D_PAD_SD3_STROBE__SD3_STROBE		0x1a
> +				MX7D_PAD_SD3_CMD__SD3_CMD		0x59
> +				MX7D_PAD_SD3_CLK__SD3_CLK		0x19
> +				MX7D_PAD_SD3_DATA0__SD3_DATA0		0x59
> +				MX7D_PAD_SD3_DATA1__SD3_DATA1		0x59
> +				MX7D_PAD_SD3_DATA2__SD3_DATA2		0x59
> +				MX7D_PAD_SD3_DATA3__SD3_DATA3		0x59
> +				MX7D_PAD_SD3_DATA4__SD3_DATA4		0x59
> +				MX7D_PAD_SD3_DATA5__SD3_DATA5		0x59
> +				MX7D_PAD_SD3_DATA6__SD3_DATA6		0x59
> +				MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59
> +				MX7D_PAD_SD3_STROBE__SD3_STROBE		0x19
>  			>;
>  		};
>  
> -- 
> 2.17.1
> 
