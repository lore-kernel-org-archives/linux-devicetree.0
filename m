From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCHv4 4/6] dt-bindings: arm: add Freescale LS1021A SoC device
 tree binding
Date: Fri, 26 Sep 2014 14:18:52 +0800
Message-ID: <20140926061851.GE31948@dragon>
References: <1411371952-5618-1-git-send-email-jingchang.lu@freescale.com>
 <1411371952-5618-5-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411371952-5618-5-git-send-email-jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 22, 2014 at 03:45:50PM +0800, Jingchang Lu wrote:
> Signed-off-by: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/fsl.txt | 38 +++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
> index e935d7d..2e0ba09 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> @@ -74,3 +74,41 @@ Required root node properties:
>  i.MX6q generic board
>  Required root node properties:
>      - compatible = "fsl,imx6q";
> +
> +
> +Freescale LS1021A Platform Device Tree Bindings
> +------------------------------------------------
> +
> +Required root node compatible properties:
> +  - compatible = "fsl,ls1021a";
> +
> +Freescale LS1021A SoC-specific Device Tree Bindings
> +-------------------------------------------
> +
> +Freescale SCFG
> +  scfg is the supplemental configuration unit, that provides SoC specific

s/scfg/SCFG

> +configuration and status registers for the chip. Such as getting PEX port
> +status.
> +  Required properties:
> +  - compatible: should be "fsl,ls1021a-scfg"
> +  - reg: should contain base address and length of SCFG memory-mapped registers
> +
> +Example:
> +	scfg: scfg@1570000 {
> +		compatible = "fsl,ls1021a-scfg";
> +		reg = <0x0 0x1570000 0x0 0x10000>;
> +	};
> +
> +Freescale DCFG
> +  dcfg is the device configuration unit, that provides general purpose

s/dcfg/DCFG

Shawn

> +configuration and status for the device. Such as setting the secondary
> +core start address and release the secondary core from holdoff and startup.
> +  Required properties:
> +  - compatible: should be "fsl,ls1021a-dcfg"
> +  - reg : should contain base address and length of DCFG memory-mapped registers
> +
> +Example:
> +	dcfg: dcfg@1ee0000 {
> +		compatible = "fsl,ls1021a-dcfg";
> +		reg = <0x0 0x1ee0000 0x0 0x10000>;
> +	};
> -- 
> 1.8.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
