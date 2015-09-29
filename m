From: Jose Rivera <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 2/3] Docs: dt: fsl-mc update binding to include definition
 of ranges
Date: Tue, 29 Sep 2015 19:21:37 +0000
Message-ID: <DM2PR0301MB1309154EC128853314F9CB41FE4E0@DM2PR0301MB1309.namprd03.prod.outlook.com>
References: <1443215286-3126-1-git-send-email-stuart.yoder@freescale.com>
 <1443215286-3126-3-git-send-email-stuart.yoder@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443215286-3126-3-git-send-email-stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
> Subject: [PATCH 2/3] Docs: dt: fsl-mc update binding to include
> definition of ranges
> 
> Define a ranges property to specify the mapping between the MC address
> space and the system address space.
> 
> Signed-off-by: Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  .../devicetree/bindings/misc/fsl,qoriq-mc.txt      | 30
> +++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> index 6aac955..848975f 100644
> --- a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> +++ b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> @@ -35,6 +35,26 @@ Required properties:
>          Definition: Must be present and point to the MSI controller node
>                      handling message interrupts for the MC.
> 
> +    - ranges
> +        Value type: <prop-encoded-array>
> +        Definition: A standard property.  Defines the mapping between
> the child
> +                    MC address space and the parent system address
> space.
> +
> +                    The MC address space is defined by 3 components:
> +                       <region type> <offset hi> <offset lo>
> +
> +                    Valid values for region type are
> +                       0x0 - MC portals
> +                       0x1 - QBMAN portals
> +
> +    - #address-cells
> +        Value type: <u32>
> +        Definition: Must be 3.  (see definition in 'ranges' property)
> +
> +    - #size-cells
> +        Value type: <u32>
> +        Definition: Must be 1.
> +
>  Example:
> 
>          fsl_mc: fsl-mc@80c000000 {
> @@ -42,5 +62,13 @@ Example:
>                  reg = <0x00000008 0x0c000000 0 0x40>,    /* MC portal
> base */
>                        <0x00000000 0x08340000 0 0x40000>; /* MC control
> reg */
>                  msi-parent = <&its>;
> -        };
> +                #address-cells = <3>;
> +                #size-cells = <1>;
> 
> +                /*
> +                 * Region type 0x0 - MC portals
> +                 * Region type 0x1 - QBMAN portals
> +                 */
> +                ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
> +                          0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
> +        };
> --
> 2.3.3

Acked-by: J. German Rivera <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
