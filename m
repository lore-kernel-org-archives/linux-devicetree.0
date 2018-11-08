From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 4/6] dt-bindings: dmaengine: usb-dmac: Add binding for
 r8a774a1
Date: Thu, 8 Nov 2018 14:12:59 +0000
Message-ID: <TY1PR01MB17701846C753070EE6D572B6C0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1535097375-5561-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1535097375-5561-5-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535097375-5561-5-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Vinod,

Do you think you can take this patch?

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 24 August 2018 08:56
> Subject: [PATCH 4/6] dt-bindings: dmaengine: usb-dmac: Add binding for r8=
a774a1
>
> From: Biju Das <biju.das@bp.renesas.com>
>
> This patch adds binding for r8a774a1 (RZ/G2M).
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> index 482e543..417ca90 100644
> --- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> +++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> @@ -5,6 +5,7 @@ Required Properties:
>  Examples with soctypes are:
>    - "renesas,r8a7743-usb-dmac" (RZ/G1M)
>    - "renesas,r8a7745-usb-dmac" (RZ/G1E)
> +  - "renesas,r8a774a1-usb-dmac" (RZ/G2M)
>    - "renesas,r8a7790-usb-dmac" (R-Car H2)
>    - "renesas,r8a7791-usb-dmac" (R-Car M2-W)
>    - "renesas,r8a7793-usb-dmac" (R-Car M2-N)
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
