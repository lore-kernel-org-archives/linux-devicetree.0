From: Jose Rivera <German.Rivera@freescale.com>
Subject: RE: [PATCH 3/3] Docs: dt: fsl-mc: update binding to define dpmac
 subnodes
Date: Tue, 29 Sep 2015 19:21:57 +0000
Message-ID: <DM2PR0301MB130916AFC3D82C9C58152CF8FE4E0@DM2PR0301MB1309.namprd03.prod.outlook.com>
References: <1443215286-3126-1-git-send-email-stuart.yoder@freescale.com>
 <1443215286-3126-4-git-send-email-stuart.yoder@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443215286-3126-4-git-send-email-stuart.yoder@freescale.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sharma Bhupesh <bhupesh.sharma@freescale.com>, Katz Itai <itai.katz@freescale.com>, Stuart Yoder <stuart.yoder@freescale.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Stuart Yoder [mailto:stuart.yoder@freescale.com]
> Sent: Friday, September 25, 2015 4:08 PM
> To: robh+dt@kernel.org; mark.rutland@arm.com
> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Rivera
> Jose-B46482; Sharma Bhupesh-B45370; katz Itai-RM05202; Yoder Stuart-
> B08248
> Subject: [PATCH 3/3] Docs: dt: fsl-mc: update binding to define dpmac
> subnodes
> 
> The fsl-mc node may optionally have dpmac sub-nodes that describe the
> relationship between the Ethernet MACs which belong to the MC and the
> Ethernet PHYs on the system board.
> 
> Signed-off-by: Stuart Yoder <stuart.yoder@freescale.com>
> ---
>  .../devicetree/bindings/misc/fsl,qoriq-mc.txt      | 45
> ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> index 848975f..6611a7c 100644
> --- a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> +++ b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> @@ -55,6 +55,40 @@ Required properties:
>          Value type: <u32>
>          Definition: Must be 1.
> 
> +Sub-nodes:
> +
> +        The fsl-mc node may optionally have dpmac sub-nodes that
> describe
> +        the relationship between the Ethernet MACs which belong to the
> MC
> +        and the Ethernet PHYs on the system board.
> +
> +        The dpmac nodes must be under a node named "dpmacs" which
> contains
> +        the following properties:
> +
> +            - #address-cells
> +              Value type: <u32>
> +              Definition: Must be present if dpmac sub-nodes are defined
> and must
> +                          have a value of 1.
> +
> +            - #size-cells
> +              Value type: <u32>
> +              Definition: Must be present if dpmac sub-nodes are defined
> and must
> +                          have a value of 0.
> +
> +        These nodes must have the following properties:
> +
> +            - compatible
> +              Value type: <string>
> +              Definition: Must be "fsl,qoriq-mc-dpmac".
> +
> +            - reg
> +              Value type: <prop-encoded-array>
> +              Definition: Specifies the id of the dpmac.
> +
> +            - phy-handle
> +              Value type: <phandle>
> +              Definition: Specifies the phandle to the PHY device node
> associated
> +                          with the this dpmac.
> +
>  Example:
> 
>          fsl_mc: fsl-mc@80c000000 {
> @@ -71,4 +105,15 @@ Example:
>                   */
>                  ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
>                            0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
> +
> +                dpmacs {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    dpmac@1 {
> +                        compatible = "fsl,qoriq-mc-dpmac";
> +                        reg = <1>;
> +                        phy-handle = <&mdio0_phy0>;
> +                    }
> +                }
>          };
> --
> 2.3.3

Acked-by: J. German Rivera <German.Rivera@freescale.com>
