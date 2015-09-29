From: Jose Rivera <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 1/3] Docs: dt: fsl-mc: update binding to include
 msi-parent
Date: Tue, 29 Sep 2015 19:21:21 +0000
Message-ID: <DM2PR0301MB13099F9FC85FC5F88D1BEB17FE4E0@DM2PR0301MB1309.namprd03.prod.outlook.com>
References: <1443215286-3126-1-git-send-email-stuart.yoder@freescale.com>
 <1443215286-3126-2-git-send-email-stuart.yoder@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443215286-3126-2-git-send-email-stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sharma Bhupesh <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Katz Itai <itai.katz-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Stuart Yoder [mailto:stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org]
> Sent: Friday, September 25, 2015 4:08 PM
> To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Rivera
> Jose-B46482; Sharma Bhupesh-B45370; katz Itai-RM05202; Yoder Stuart-
> B08248
> Subject: [PATCH 1/3] Docs: dt: fsl-mc: update binding to include msi-
> parent
> 
> The Freescale Management Complex and all associated objects use message
> interrupts, and thus an msi-parent is required.
> 
> Signed-off-by: Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> index c7a26ca..6aac955 100644
> --- a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> +++ b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> @@ -30,11 +30,17 @@ Required properties:
>                          region may not be present in some scenarios,
> such
>                          as in the device tree presented to a virtual
> machine.
> 
> +    - msi-parent
> +        Value type: <phandle>
> +        Definition: Must be present and point to the MSI controller node
> +                    handling message interrupts for the MC.
> +
>  Example:
> 
>          fsl_mc: fsl-mc@80c000000 {
>                  compatible = "fsl,qoriq-mc";
>                  reg = <0x00000008 0x0c000000 0 0x40>,    /* MC portal
> base */
>                        <0x00000000 0x08340000 0 0x40000>; /* MC control
> reg */
> +                msi-parent = <&its>;
>          };
> 
> --
> 2.3.3

Acked-by: J. German Rivera <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
