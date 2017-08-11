From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7743: Add IIC cores to dtsi
Date: Fri, 11 Aug 2017 10:48:42 +0200
Message-ID: <20170811084842.GB20909@verge.net.au>
References: <1502196418-31341-1-git-send-email-biju.das@bp.renesas.com>
 <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
 <20170810080121.GE16647@verge.net.au>
 <20170810112411.GA4380@katana>
 <TY1PR06MB0702EA22AFE7D8145BF623A6B7880@TY1PR06MB0702.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <TY1PR06MB0702EA22AFE7D8145BF623A6B7880@TY1PR06MB0702.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 10, 2017 at 01:49:05PM +0000, Chris Paterson wrote:
> Hello,
> 
> > From: Wolfram Sang [mailto:wsa@the-dreams.de]
> > Sent: 10 August 2017 12:24
> > 
> > 
> > > > >+		i2c6: i2c@e60b0000 {
> > > >
> > > >    I'd use iic0 as the label.
> > >
> > > I have no preference here other than that we try to be consistent in
> > > DT for different R-Car SoCs. Wolfram, do you have an opinion on this?
> > 
> > Back then, for M2-W, I decided to go with the schematics/datasheets.
> > And those mentioned i2c6 rather than iic0. For that reason, the comment
> 
> The M2 schematics still use i2c6, and for consistency I'd vote to use the same with RZ/G1M.

+1

> > "/* The memory map in the User's Manual maps the cores to bus numbers */"
> > 
> > exists in r8a7791.dtsi. Dunno the manual of this SoC here.
> 
> The manual for r8a7743 uses the same terminology as the r8a7791 manuals.
