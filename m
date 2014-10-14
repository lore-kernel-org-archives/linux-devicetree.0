From: "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH] mfd: syscon: binding: Add syscon endianness support.
Date: Tue, 14 Oct 2014 02:30:04 +0000
Message-ID: <a6a3c9cf91444ac9a50f85b8ee2d4635@BY2PR0301MB0613.namprd03.prod.outlook.com>
References: <1411025249-34333-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411025249-34333-1-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi DT guys,

Could someone help me review or ack this patch?

Thanks very much.

BRs
Xiubo



> -----Original Message-----
> From: Xiubo Li [mailto:Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org]
> Sent: Thursday, September 18, 2014 3:27 PM
> To: Dong Aisheng-B29396; pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> pawel.moll-5wv7dgnIgG8@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org;
> galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org; sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org; lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Xiubo Li-B47053
> Subject: [PATCH] mfd: syscon: binding: Add syscon endianness support.
> 
> For many drivers which will support rich endianness of Devices
> need define DT properties by itself with the binding support.
> 
> The regmap core has already support endianness of the following
> case:
> Index      Device     DT properties needed
> ------------------------------------------
> 1          BE         'big-endian'
> 2          LE         'little-endian'
> 
> Please see the regmap binding for more detail information of
> the endianness support.
> 
> Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> 
> 
> This patch hasn't any dependency with Pankaj Dubey's:
>     mfd: syscon: Decouple syscon interface from platform devices
> 
> 
> 
>  Documentation/devicetree/bindings/mfd/syscon.txt | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt
> b/Documentation/devicetree/bindings/mfd/syscon.txt
> index fe8150b..7c33178 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.txt
> +++ b/Documentation/devicetree/bindings/mfd/syscon.txt
> @@ -10,11 +10,22 @@ OS driver) to determine the location of the registers, and
> access the
>  registers directly.
> 
>  Required properties:
> -- compatible: Should contain "syscon".
> -- reg: the register region can be accessed from syscon
> +- compatible:		Should contain "syscon".
> +- reg:			The register region can be accessed from syscon
> 
> -Examples:
> +Optional property:
> +- {big,little}-endian:	Boolean property. Please see ../regmap/regmap.txt
> +			for more information.
> +
> +Example 1:
>  gpr: iomuxc-gpr@020e0000 {
>  	compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
>  	reg = <0x020e0000 0x38>;
>  };
> +
> +Example 2:
> +dcfg: dcfg@1ee0000 {
> +	compatible = "fsl,ls1021a-dcfg", "syscon";
> +	reg = <0x0 0x1ee0000 0x0 0x10000>;
> +	big-endian;
> +};
> --
> 2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
