Return-Path: <SRS0=avim=NG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ty1jpn01on0137.outbound.protection.outlook.com ([104.47.93.137]:61031
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727291AbeJZSZD (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 26 Oct 2018 14:25:03 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a77470 CMT
 support
Date: Fri, 26 Oct 2018 09:48:19 +0000
Message-ID: <TYXPR01MB1775E03BA074105B92580477C0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540542973-15752-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540542973-15752-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a77470 CMT =
support
>
> Document SoC specific compatible strings for r8a77470. No driver change
> is needed as the fallback strings will activate the right code.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> This patch is tested against linux-next
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Do=
cumentation/devicetree/bindings/timer/renesas,cmt.txt
> index 6de27b6..eb602c5 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> @@ -28,6 +28,8 @@ Required Properties:
>      - "renesas,r8a7744-cmt1" for the 48-bit CMT1 device included in r8a7=
744.
>      - "renesas,r8a7745-cmt0" for the 32-bit CMT0 device included in r8a7=
745.
>      - "renesas,r8a7745-cmt1" for the 48-bit CMT1 device included in r8a7=
745.
> +    - "renesas,r8a77470-cmt0" for the 32-bit CMT0 device included in r8a=
77470.
> +    - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in r8a=
77470.
>      - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7=
790.
>      - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7=
790.
>      - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7=
791.
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
