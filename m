Return-Path: <SRS0=avim=NG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ty1jpn01on0090.outbound.protection.outlook.com ([104.47.93.90]:20704
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726149AbeJZSXM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 26 Oct 2018 14:23:12 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 1/2] dt-bindings: dmaengine: usb-dmac: Add binding for
 r8a77470
Date: Fri, 26 Oct 2018 09:46:42 +0000
Message-ID: <TYXPR01MB17753769855B5BAE60D44BBEC0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540479218-4954-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540479218-4954-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH 1/2] dt-bindings: dmaengine: usb-dmac: Add binding for r8=
a77470
>
> This patch adds usb high-speed dmac binding for r8a77470 (RZ/G1C) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> This patch tested against linux-next.
> ---
>  Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> index 1743017..a1e7b814 100644
> --- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> +++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> @@ -6,6 +6,7 @@ Required Properties:
>    - "renesas,r8a7743-usb-dmac" (RZ/G1M)
>    - "renesas,r8a7744-usb-dmac" (RZ/G1N)
>    - "renesas,r8a7745-usb-dmac" (RZ/G1E)
> +  - "renesas,r8a77470-usb-dmac" (RZ/G1C)
>    - "renesas,r8a7790-usb-dmac" (R-Car H2)
>    - "renesas,r8a7791-usb-dmac" (R-Car M2-W)
>    - "renesas,r8a7793-usb-dmac" (R-Car M2-N)
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
