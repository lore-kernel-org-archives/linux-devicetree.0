Return-Path: <SRS0=cfG7=P7=verge.net.au=horms@kernel.org>
Date: Wed, 23 Jan 2019 10:41:56 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v4 0/2] Add Initial Device Tree for RZ/A2
Message-ID: <20190123094155.ynxgmvy2xg6l2ywq@verge.net.au>
References: <20181218170555.121673-1-chris.brandt@renesas.com>
 <TY1PR01MB1562E0657C155C47620BF6F68A9F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1562E0657C155C47620BF6F68A9F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jan 21, 2019 at 09:17:20PM +0000, Chris Brandt wrote:
> Hi Simon,
> 
> On Tuesday, December 18, 2018, Chris Brandt wrote:
> > Add a Device Tree for RZ/A2 and the existing eval board.
> > 
> > Once these get approved, I'll start piling on the other drivers in
> > another patch series
> > 
> > NOTE:
> > Since Rob is currently converting shmobile.txt to renesas.yaml,
> > I'll wait till renesas.yaml hits -next, then add this RZ/A2M EVB
> > board (it's too confusing to me to figure out how to make a patch
> > series using multiple different trees)
> > 
> > Chris Brandt (2):
> >   ARM: dts: r7s9210: Initial SoC device tree
> >   ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
> > 
> >  arch/arm/boot/dts/Makefile             |   1 +
> >  arch/arm/boot/dts/r7s9210-rza2mevb.dts |  82 +++++++++++++
> >  arch/arm/boot/dts/r7s9210.dtsi         | 218
> > +++++++++++++++++++++++++++++++++
> >  3 files changed, 301 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts
> >  create mode 100644 arch/arm/boot/dts/r7s9210.dtsi
> 
> 
> What ever happened to these patches?
> 
> I didn't see any negative feedback after V4, but I also never saw 
> anything get queued up.

Sorry about that, it slipped through the cracks somehow.

I have now applied this for v5.1.
