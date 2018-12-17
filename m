Return-Path: <SRS0=NQmY=O2=verge.net.au=horms@kernel.org>
Date: Mon, 17 Dec 2018 13:42:49 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 11/17] arm64: dts: renesas: r8a774c0: Add USB-DMAC and
 HSUSB device nodes
Message-ID: <20181217124249.tdyeafem7exry4xr@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-12-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181217105437.u2lgri7iuomjn7wq@verge.net.au>
 <TY1PR01MB1770B4A08F1C04979B88C0FBC0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770B4A08F1C04979B88C0FBC0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Dec 17, 2018 at 12:17:12PM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Thank you for your feedback!
> 
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 17 December 2018 10:55
> > To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Subject: Re: [PATCH 11/17] arm64: dts: renesas: r8a774c0: Add USB-DMAC and HSUSB device nodes
> >
> > On Fri, Dec 14, 2018 at 09:37:34AM +0000, Fabrizio Castro wrote:
> > > Add usb dmac and hsusb device nodes on RZ/G2E SoC dtsi.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 45 +++++++++++++++++++++++++++++++
> > >  1 file changed, 45 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > index 0ab3aa6..79cdaac 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > @@ -514,6 +514,51 @@
> > >  status = "disabled";
> > >  };
> > >
> > > +hsusb: usb@e6590000 {
> > > +compatible = "renesas,usbhs-r8a774c0",
> > > +     "renesas,rcar-gen3-usbhs";
> > > +reg = <0 0xe6590000 0 0x200>;
> >
> > The above looks good but while reviewing this patch I noticed
> > that the size of the hsusb register range on in the DT for r8a774a1
> > is 0x100, Is that correct?
> 
> That is a good catch! No, I don't think it's correct, I'll send a patch to fix that.

Great, thanks!
