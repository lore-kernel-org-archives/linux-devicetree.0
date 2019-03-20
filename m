From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/3] ARM: DTS: imx6q-logicpd: Fix Analog audio capture
Date: Wed, 20 Mar 2019 20:46:35 +0800
Message-ID: <20190320124634.GP4980@dragon>
References: <20190306140402.17122-1-aford173@gmail.com>
 <20190306140402.17122-3-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190306140402.17122-3-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 06, 2019 at 08:04:01AM -0600, Adam Ford wrote:
> The original submission had functional audio out and was based
> on reviewing other boards using the same wm8962 codec. However,
> the Logic PD board uses an analog microphone which was being
> disabled for a digital mic.  This patch corrects that and
> explicitly sets the gpio-cfg pins all to 0x0000 which allows the
> analog microphone to capture audio.
> 
> Fixes: 1c207f911fe9 ("ARM: dts: imx: Add support for Logic PD
> i.MX6QD EVM")

If audio capture has never worked, the change is more like a "new feature"
than critical fix.

Shawn

> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
> index e31b6923cb72..db6b5b900826 100644
> --- a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
> +++ b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
> @@ -248,9 +248,9 @@
>  		gpio-cfg = <
>  			0x0000 /* 0:Default */
>  			0x0000 /* 1:Default */
> -			0x0013 /* 2:FN_DMICCLK */
> +			0x0000 /* 2:FN_DMICCLK */
>  			0x0000 /* 3:Default */
> -			0x8014 /* 4:FN_DMICCDAT */
> +			0x0000 /* 4:FN_DMICCDAT */
>  			0x0000 /* 5:Default */
>  		>;
>  	};
> -- 
> 2.17.1
> 
