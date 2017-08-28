From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH ] ARM: dts: iwg20d-q7: Add chosen node
Date: Mon, 28 Aug 2017 09:53:01 +0200
Message-ID: <20170828075301.GC22421@verge.net.au>
References: <1503075488-44304-1-git-send-email-biju.das@bp.renesas.com>
 <20170822080735.GH30838@verge.net.au>
 <SG2PR06MB1711E12964D1C1300C4EEB64B89A0@SG2PR06MB1711.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1711E12964D1C1300C4EEB64B89A0@SG2PR06MB1711.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 24, 2017 at 02:32:47PM +0000, Biju Das wrote:
> 
> 
> > -----Original Message-----
> > From: Simon Horman [mailto:horms@verge.net.au]
> > Sent: 22 August 2017 09:08
> > To: Biju Das <biju.das@bp.renesas.com>
> > Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> > <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> > Russell King <linux@armlinux.org.uk>; Chris Paterson
> > <Chris.Paterson2@renesas.com>; Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com>; devicetree@vger.kernel.org; linux-renesas-
> > soc@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH ] ARM: dts: iwg20d-q7: Add chosen node
> >
> > On Fri, Aug 18, 2017 at 05:58:08PM +0100, Biju Das wrote:
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > > This patch tested against renesas-dev tag
> > > renesas-devel-20170815-v4.13-rc5
> >
> > Thanks, I have applied this for v4.15.
> >
> > There was some fuzz when applying this patch.
> > Please check that it is correct when I have pushed today's devel tag to the
> > renesas tree.
> 
> Looks like this node is misplaced. I will repost this patch.

Thanks, I have dropped this patch.
