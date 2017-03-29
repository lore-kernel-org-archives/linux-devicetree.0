From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r7s72100: add power-domains to sdhi
Date: Wed, 29 Mar 2017 10:09:09 +0200
Message-ID: <20170329080909.GE6512@verge.net.au>
References: <20170209133803.21539-1-chris.brandt@renesas.com>
 <CAMuHMdXRD3o7KdaADvPYxzeuEVo44nRVWHfCverPc+9s=0owPA@mail.gmail.com>
 <20170324070228.GI1319@verge.net.au>
 <CAMuHMdUJMEjb8UhaHHK3aE2uEoUpKFtSFXLhYwgJHKu9YDeVHQ@mail.gmail.com>
 <SG2PR06MB116573C9325106B5ED4580578A3E0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB116573C9325106B5ED4580578A3E0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 11:17:25AM +0000, Chris Brandt wrote:
> On Friday, March 24, 2017, Geert Uytterhoeven wrote:
> > > The fixes tag above indicates this is a fix for v4.10, however, when I
> > > tried to apply it on top of v4.11-rc1 there was a conflict.  So I
> > > think a backport will be required if we want it to be considered for
> > > v4.11 and be considered for and in turn v4.10-stable.
> > 
> > That's because of commit 3d2abda02ad2d06d
> > ("ARM: dts: r7s72100: update sdhi clock bindings")
> 
> 
> Between the two, "update sdhi clock bindings" is more important this this patch ("add power-domains").
> Without "update sdhi clock bindings", the SDHI /might/ not work.
> 
> 
> But, "update sdhi clock bindings", also relies on the driver update 34a1654706c6 ("mmc: sh_mobile_sdhi: add support for 2 clocks").
> That one is in v4.11-rc1, but not in 4.10.5.
> 
> I just noticed now that 34a1654706c6 does not have "Fixes" in the commit log, so it is probably not marked to go into v4.10-stable, so in that case backporting the dtsi is pointless.

We could try to coordinate getting 34a1654706c6 and the dtsi changes into
v4.10-stable if you it is sufficiently important. What are your thoughts on
that?
