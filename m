Return-Path: <SRS0=20pF=KZ=verge.net.au=horms@kernel.org>
Date: Fri, 10 Aug 2018 13:13:29 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 2/5] soc: renesas: rcar-sysc: Add r8a774a1 support
Message-ID: <20180810111328.5w3nizvuaashxi6h@verge.net.au>
References: <1533221599-52948-1-git-send-email-biju.das@bp.renesas.com>
 <5b6cc303.1c69fb81.26116.320b@mx.google.com>
 <OSBPR01MB2103F54A22AD3A78011F2446B8240@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103F54A22AD3A78011F2446B8240@OSBPR01MB2103.jpnprd01.prod.outlook.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, batareich batareich <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, TAKESHI KIHARA <takeshi.kihara.df@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 10, 2018 at 07:37:18AM +0000, Biju Das wrote:
> Hi Rob,
> 
> > Subject: Re: [PATCH v2 2/5] soc: renesas: rcar-sysc: Add r8a774a1 support
> >
> > Hi, this is an automated email from Rob's (experimental) review bot. I found
> > a couple of common problems with your patch. Please see below.
> 
> Do I need to send another patch? The mail says " Rob's (experimental)
> review bot".  Previously for RZ/G1C upstreaming I have submitted the
> patches in similar fashion.  Is anything changed?

Yes, indeed.

At one point I was enforcing such a split but as it did not seem to be a
universal practice I stopped doing so.  I'd like some clear guidance from
Rob if he'd like this split to occur going forwards.

As for this patch, I have applied it for v4.20.

> 
> > On Thu,  2 Aug 2018 15:53:19 +0100, Biju Das wrote:
> > > Add support for RZ/G2M (R8A774A1) SoC power areas to the R-Car SYSC
> > > driver.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > The preferred subject prefix is "dt-bindings: <binding dir>: ...".
> >
> > DT bindings (including binding headers) should be a separate patch. See
> > Documentation/devicetree/bindings/submitting-patches.txt.
> 
> Regards,
> Biju
> 
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
> 
