From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH net-next] dt-bindings: net: ravb: Add support for r8a7744
 SoC
Date: Mon, 24 Sep 2018 10:45:42 +0200
Message-ID: <20180924084542.qcvb4uykzqel3uu7@verge.net.au>
References: <1537539943-24712-1-git-send-email-biju.das@bp.renesas.com>
 <922d6b1d-764a-ad2d-6a6c-8d992f3fbe15@cogentembedded.com>
 <OSBPR01MB21036782B7F7938C35D0D859B8120@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <OSBPR01MB21036782B7F7938C35D0D859B8120@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 21, 2018 at 03:57:33PM +0000, Biju Das wrote:
> Hi Sergei,
> 
> Thanks  for the feedback.
> 
> > Subject: Re: [PATCH net-next] dt-bindings: net: ravb: Add support for
> > r8a7744 SoC
> >
> > Hello!
> >
> > On 09/21/2018 05:25 PM, Biju Das wrote:
> >
> > > Document RZ/G1N (R8A7744) SoC bindings.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >
> > > ---
> > >  Documentation/devicetree/bindings/net/renesas,ravb.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt
> > b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> > > index da249b7..3530256 100644
> > > --- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
> > > +++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> > > @@ -6,6 +6,7 @@ interface contains.
> > >  Required properties:
> > >  - compatible: Must contain one or more of the following:
> > >        - "renesas,etheravb-r8a7743" for the R8A7743 SoC.
> > > +      - "renesas,etheravb-r8a7744" for the R8A7744 SoC.
> >
> >    Mmm, I thought it was decided to go with the full model #s, like with
> > R8A77470 below?
> 
> For RZ/G1C case, there are 2 variants 1 with HDMI(R8A77470) and the other without HDMI(R8A77471).
> Current support is for R8A77470.

r8a7744 is consistent with other bindings for this SoC and my understanding
is that it is a) sufficient to differentiate this SoC and b) in keeping
with most other RZ/G1 SoCs (RZ/G1C being the exception).

In short, this seems fine to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> > >        - "renesas,etheravb-r8a7745" for the R8A7745 SoC.
> > >        - "renesas,etheravb-r8a77470" for the R8A77470 SoC.
> > >        - "renesas,etheravb-r8a7790" for the R8A7790 SoC.
