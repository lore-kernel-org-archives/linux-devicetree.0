Return-Path: <SRS0=DwSA=TP=verge.net.au=horms@kernel.org>
Date: Wed, 15 May 2019 09:53:14 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 02/15] ARM: dts: rza2mevb: Add 48MHz USB clock
Message-ID: <20190515075313.nq4hp2xgy5er3ni7@verge.net.au>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-3-chris.brandt@renesas.com>
 <CAMuHMdWctj6bEBQ9OF93T6h10Chb-ankN4QRaY+UPLLQuBJDHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWctj6bEBQ9OF93T6h10Chb-ankN4QRaY+UPLLQuBJDHQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, May 15, 2019 at 09:43:02AM +0200, Geert Uytterhoeven wrote:
> Hi Chris,
> 
> On Tue, May 14, 2019 at 4:57 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> > The RZ/A2M EVB has a 48MHz clock attached to USB_X1.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.3.

> > --- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> > +++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> > @@ -58,6 +58,11 @@
> >         clock-frequency = <32768>;
> >  };
> >
> > +/* USB_X1 */
> > +&usb_x1_clk {
> > +       clock-frequency = <48000000>;
> > +};
> > +
> >  &pinctrl {
> >         /* Serial Console */
> >         scif4_pins: serial4 {
> 
> BTW, it looks like this file can use a sorting sweep.

Thanks, I'll look into it.
