From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: net: ravb: Add support for r8a774c0 SoC
Date: Fri, 14 Dec 2018 08:20:37 +0000
Message-ID: <TYXPR01MB17757A77BB1088F94AD0C3A8C0A10@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1544732314-6041-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544732314-6041-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S. Miller" <davem@davemloft.net>, Simon Horman <horms+renesas@verge.net.au>, Biju Das <biju.das@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>
List-Id: devicetree@vger.kernel.org

This is for net-next, sorry for not putting it in the subject.

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 13 December 2018 20:19
> Subject: [PATCH] dt-bindings: net: ravb: Add support for r8a774c0 SoC
>
> Document RZ/G2E (R8A774C0) SoC bindings.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/net/renesas,ravb.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Doc=
umentation/devicetree/bindings/net/renesas,ravb.txt
> index 3530256..7ad3621 100644
> --- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
> +++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> @@ -18,6 +18,7 @@ Required properties:
>  R-Car Gen2 and RZ/G1 devices.
>
>        - "renesas,etheravb-r8a774a1" for the R8A774A1 SoC.
> +      - "renesas,etheravb-r8a774c0" for the R8A774C0 SoC.
>        - "renesas,etheravb-r8a7795" for the R8A7795 SoC.
>        - "renesas,etheravb-r8a7796" for the R8A7796 SoC.
>        - "renesas,etheravb-r8a77965" for the R8A77965 SoC.
> --
> 2.7.4



[https://www2.renesas.eu/media/email/unicef.jpg]

This Christmas, instead of sending out cards, Renesas Electronics Europe ha=
ve decided to support Unicef with a donation. For further details click her=
e<https://www.unicef.org/> to find out about the valuable work they do, hel=
ping children all over the world.
We would like to take this opportunity to wish you a Merry Christmas and a =
prosperous New Year.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
