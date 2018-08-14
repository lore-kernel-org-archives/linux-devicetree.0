From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: net: ravb: Add support for r8a774a1 SoC
Date: Tue, 14 Aug 2018 17:58:21 +0000
Message-ID: <TY1PR01MB17704E702054D5368C84C029C0380@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1534250017-15725-1-git-send-email-fabrizio.castro@bp.renesas.com>
        <20180814.100957.1728722828479885181.davem@davemloft.net>
        <TY1PR01MB177019FF77871E7149595ED9C0380@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20180814.101934.1621967443721994871.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180814.101934.1621967443721994871.davem@davemloft.net>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, Biju Das <biju.das@bp.renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "horms@verge.net.au" <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>
List-Id: devicetree@vger.kernel.org

Hello David,

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Date: Tue, 14 Aug 2018 17:13:30 +0000
>
> > Hello David,
> >
> >> Subject: Re: [PATCH] dt-bindings: net: ravb: Add support for r8a774a1 =
SoC
> >>
> >> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >> Date: Tue, 14 Aug 2018 13:33:37 +0100
> >>
> >> > Document RZ/G2M (R8A774A1) SoC bindings.
> >> >
> >> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> >>
> >> Which tree is this targetting?
> >
> > This patch applies on next-20180814
>
> I'm asking something different.  I'm asking which subsystem tree, and
> which maintainer, should apply this patch.

I think this is appropriate for net-next, and as far as I can tell previous=
 patches have either been applied by you (mostly) or Rob Herring.
Maybe I should have put "[PATCH net-next]" in the Subject like the followin=
g?
https://patchwork.kernel.org/patch/10314835/

Thanks,
Fab



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
