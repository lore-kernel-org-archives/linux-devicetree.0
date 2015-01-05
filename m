From: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH] [v3] power/fsl: add MDIO dt binding for FMan
Date: Mon, 5 Jan 2015 11:21:20 +0000
Message-ID: <DM2PR0301MB08640979E5088618D1395CFAE2580@DM2PR0301MB0864.namprd03.prod.outlook.com>
References: <1419321466-5575-1-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419321466-5575-1-git-send-email-shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Emilian Medve <Emilian.Medve-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Scott,

Is this v3 OK?

Best Regards, 
Shaohui Xie
> -----Original Message-----
> From: shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org [mailto:shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> Sent: Tuesday, December 23, 2014 3:58 PM
> To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Wood Scott-B07421
> Cc: Medve Emilian-EMMEDVE1; Xie Shaohui-B21989
> Subject: [PATCH] [v3] power/fsl: add MDIO dt binding for FMan
> 
> From: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> This binding is for FMan MDIO, it covers FMan v2 & FMan v3.
> 
> Signed-off-by: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> changes in v3:
> rephrase the 'Definition' of property 'bus-frequency', don't include the
> property in example.
> 
> changes in v2:
> addressed comments from Scott in V1.
> 
>  .../devicetree/bindings/powerpc/fsl/fman.txt       | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> index edeea16..737aa4c 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> @@ -7,6 +7,7 @@ CONTENTS
>    - FMan MURAM Node
>    - FMan dTSEC/XGEC/mEMAC Node
>    - FMan IEEE 1588 Node
> +  - FMan MDIO Node
>    - Example
> 
>  =============================================================================
> @@ -357,6 +358,69 @@ ptp-timer@fe000 {
>  };
> 
>  =============================================================================
> +FMan MDIO Node
> +
> +DESCRIPTION
> +
> +The MDIO is a bus to which the PHY devices are connected.
> +
> +PROPERTIES
> +
> +- compatible
> +		Usage: required
> +		Value type: <stringlist>
> +		Definition: A standard property.
> +		Must include "fsl,fman-mdio" for 1 Gb/s MDIO from FMan v2.
> +		Must include "fsl,fman-xmdio" for 10 Gb/s MDIO from FMan v2.
> +		Must include "fsl,fman-memac-mdio" for 1/10 Gb/s MDIO from
> +		FMan v3.
> +
> +- reg
> +		Usage: required
> +		Value type: <prop-encoded-array>
> +		Definition: A standard property.
> +
> +- bus-frequency
> +		Usage: optional
> +		Value type: <u32>
> +		Definition: Specifies the external MDIO bus clock speed to
> +		be used, if different from the standard 2.5 MHz.
> +		This may be due to the standard speed being unsupported (e.g.
> +		due to a hardware problem), or to advertise that all relevant
> +		components in the system support a faster speed.
> +
> +- interrupts
> +		Usage: optional
> +		Value type: <prop-encoded-array>
> +		Definition: Event interrupt of external MDIO controller.
> +		1 Gb/s MDIO and 10 Gb/s MDIO has one interrupt respectively.
> +
> +- fsl,fman-internal-mdio
> +		Usage: required for internal MDIO
> +		Value type: boolean
> +		Definition: Fman has internal MDIO for internal PCS(Physical
> +		Coding Sublayer) PHYs and external MDIO for external PHYs.
> +		The settings and programming routines for internal/external
> +		MDIO are different. Must be included for internal MDIO.
> +
> +EXAMPLE
> +
> +Example for FMan v2 external MDIO:
> +
> +mdio@f1000 {
> +	compatible = "fsl,fman-xmdio";
> +	reg = <0xf1000 0x1000>;
> +};
> +
> +Example for FMan v3 internal MDIO:
> +
> +mdio@f1000 {
> +	compatible = "fsl,fman-memac-mdio";
> +	reg = <0xf1000 0x1000>;
> +	fsl,fman-internal-mdio;
> +};
> +
> +=======================================================================
> +======
>  Example
> 
>  fman@400000 {
> @@ -531,4 +595,9 @@ fman@400000 {
>  		compatible = "fsl,fman-ptp-timer";
>  		reg = <0xfe000 0x1000>;
>  	};
> +
> +	mdio@f1000 {
> +		compatible = "fsl,fman-xmdio";
> +		reg = <0xf1000 0x1000>;
> +	};
>  };
> --
> 1.8.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
