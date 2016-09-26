From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/3] ARM: dts: rskrza1: add sdhi1 DT support
Date: Mon, 26 Sep 2016 16:44:32 +0200
Message-ID: <20160926144432.GB5792@verge.net.au>
References: <20160922213211.7988-1-chris.brandt@renesas.com>
 <20160922213211.7988-4-chris.brandt@renesas.com>
 <CAMuHMdWckFaU__BM=WAOvJ+fVjEvNdLCFy0GNiKwU159aZTdhg@mail.gmail.com>
 <20160923074123.GD20129@verge.net.au>
 <SG2PR06MB1165D28EC2B25A642B480F208AC80@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165D28EC2B25A642B480F208AC80@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 23, 2016 at 02:33:10PM +0000, Chris Brandt wrote:
> > > On Thu, Sep 22, 2016 at 11:32 PM, Chris Brandt
> > <chris.brandt@renesas.com> wrote:
> > > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > > > ---
> > > >  arch/arm/boot/dts/r7s72100-rskrza1.dts | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts
> > > > b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> > > > index e5dea5b..548b51f 100644
> > > > --- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
> > > > +++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> > > > @@ -56,6 +56,10 @@
> > > >         };
> > > >  };
> > > >
> > > > +&sdhi1 {
> > > > +       status = "okay";
> > >
> > > On all other boards, we have the bus-width property in the
> > > board-specific .dts instead of in the SoC-specific .dtsi.
> 
> I did see that.
> But, in my opinion, using 4-bit SDHI is way more common that 1-bit SDHI.
> So I figured I'd make 4-bit the 'default' by putting it in the dtsi, and if for some reason someone needed 1-bit, they could override it in the board .dts.
> 
> 
> > I'd like us to be consistent as much as possible.
> > But I do wonder why it has been added as a board property.
> 
> It doesn't really matter to me. If you want me to move it to the board dts it to keep it consistent, just let me know and I'll change it.

Please do.
