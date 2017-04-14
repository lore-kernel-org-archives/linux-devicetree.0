From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH 5/8] ARM: dts: imx7s: Mark 'gpr' compatible with i.MX6
 variant
Date: Fri, 14 Apr 2017 23:56:39 +0800
Message-ID: <20170414155639.GC1792@b29396-OptiPlex-7040>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
 <20170413133242.5068-6-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170413133242.5068-6-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, yurovsky@gmail.com, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 06:32:39AM -0700, Andrey Smirnov wrote:
> List GPR block as compatible "fsl,imx6q-iomuxc-gpr" to support drivers
> requesting it that way (PCIe driver is one example).
> 
> Cc: yurovsky@gmail.com
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  arch/arm/boot/dts/imx7s.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 1a7058f..cc23478 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -491,7 +491,8 @@
>  			};
>  
>  			gpr: iomuxc-gpr@30340000 {
> -				compatible = "fsl,imx7d-iomuxc-gpr", "syscon";
> +				compatible = "fsl,imx7d-iomuxc-gpr",
> +					"fsl,imx6q-iomuxc-gpr", "syscon";

This looks wrong to me.
mx7d-iomux-gpr gets a big difference from mx6q-iomux-gpr and mostly
not compatible.

Regards
Dong Aisheng
