Return-Path: <SRS0=2YST=M6=verge.net.au=horms@kernel.org>
Date: Thu, 18 Oct 2018 14:45:10 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779{7|8}0: add MSIOF support
Message-ID: <20181018124509.o7htawdlgzsoefc2@verge.net.au>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <2c172c3a-8c79-5430-22c6-66464819e801@cogentembedded.com>
 <20181017081201.635ik3n5qjqbnscb@verge.net.au>
 <CAMuHMdXNGHZqmMfH=NDVoiX3t3t_TsDHpBr2C4oCELAX=eRrAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXNGHZqmMfH=NDVoiX3t3t_TsDHpBr2C4oCELAX=eRrAQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Oct 17, 2018 at 10:52:14AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Oct 17, 2018 at 10:13 AM Simon Horman <horms@verge.net.au> wrote:
> > On Tue, Oct 16, 2018 at 10:36:33PM +0300, Sergei Shtylyov wrote:
> > > Describe MSIOF in the R8A779{7|8}0 device trees.
> > >
> > > The DMA props are deliberately omitted as the MSIOF DMA doesn't work on
> > > R8A77970 (due to IPMMU issue) and the RT-DMAC isn't supported on R8A77980.
> >
> > For the record: In the short term I'm fine with not enabling DMA if there
> > are known problems. But in the long term we should describe DMA in DT as
> > the purpose of DT is to describe hardware rather than software.
> >
> > So please, as follow-up work, lets work towards a solution that allows us
> > to describe the hardware in DT.
> >
> > > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > >
> > > ---
> > > This patch is against the 'renesas-devel-20181015-v4.19-rc8' branch of
> > > Simon Horman's 'renesas.git' repo.
> > >
> > > The MSIOF bindings patch has just been posted...
> > >
> > >  arch/arm64/boot/dts/renesas/r8a77970.dtsi |   56 ++++++++++++++++++++++++++++++
> > >  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   56 ++++++++++++++++++++++++++++++
> > >  2 files changed, 112 insertions(+)
> > >
> > > Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > > ===================================================================
> > > --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > > +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > > @@ -22,6 +22,10 @@
> > >               i2c2 = &i2c2;
> > >               i2c3 = &i2c3;
> > >               i2c4 = &i2c4;
> > > +             spi1 = &msiof0;
> > > +             spi2 = &msiof1;
> > > +             spi3 = &msiof2;
> > > +             spi4 = &msiof3;
> >
> > Geert, could you comment on these aliases and the similar ones below?
> > I'm not seeing them for any other ARM64-based Renesas SoCs.
> 
> I2c and spi aliases are "used, but not recommended", cfr.
> https://lore.kernel.org/lkml/20181015180046.GA18294@bogus/
> 
> Personally (but I'm biased, referring to an email thread I participated in ;-),
> I'd only leave serial0 (+ perhaps a 2nd/3th serial port) and ethernet0.

Thanks, it seems to me that would be a good direction to move towards.

Sergei, could you consider dropping the alias portions of this patch?
