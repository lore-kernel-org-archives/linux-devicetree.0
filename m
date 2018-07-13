Return-Path: <SRS0=mbb1=J5=verge.net.au=horms@kernel.org>
Date: Fri, 13 Jul 2018 09:47:55 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] dt: serial: Add Renesas RZ/N1 binding documentation
Message-ID: <20180713074754.lcu4t6zunpxlyqg4@verge.net.au>
References: <1531312174-17489-1-git-send-email-phil.edworthy@renesas.com>
 <1531312174-17489-2-git-send-email-phil.edworthy@renesas.com>
 <CAMuHMdU6-vKAfbd-pf9jXrrFFbSANHckGGQnkHsXabQsCvFFNg@mail.gmail.com>
 <TY1PR01MB1769F2878EB466D0A1BB4268F5590@TY1PR01MB1769.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1769F2878EB466D0A1BB4268F5590@TY1PR01MB1769.jpnprd01.prod.outlook.com>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jul 12, 2018 at 12:05:21PM +0000, Phil Edworthy wrote:
> Hi Geert,
> 
> On 11 July 2018 13:39, Geert Uytterhoeven wrote:
> > On Wed, Jul 11, 2018 at 2:30 PM Phil Edworthy wrote:
> > > The RZ/N1 UART is a modified Synopsys DesignWare UART.
> > > The modifications only relate to DMA so you could actually use the
> > > controller with the Synopsys compatible string if you are not using
> > > DMA, but you should not do so.
> > >
> > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > 
> > Thanks for your patch!
> > 
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/serial/renesas,rzn1-uart.txt
> > > @@ -0,0 +1,10 @@
> > > +Renesas RZ/N1 UART
> > > +
> > > +This controller is based on the Synopsys DesignWare ABP UART and
> > > +inherits all properties defined in snps-dw-apb-uart.txt except for the
> > compatible property.
> > > +
> > > +Required properties:
> > > +- compatible : The device specific string followed by the generic RZ/N1
> > string.
> > > +   Therefore it must be one of:
> > > +   "renesas,uart-r9a06g032", "renesas,uart-rzn1"
> > 
> > "renesas,r9a06g032-uart", "renesas,rzn1-uart"
> > 
> > > +   "renesas,uart-r9a06g033", "renesas,uart-rzn1"
> > 
> > "renesas,r9a06g033-uart", "renesas,rzn1-uart"
> I followed the renesas convention of renesas,peripheral-device that is used for
> most R-Car drivers, but happy to change.

Please do. The "Renesas convention" is a hold over from early work on
DT bindings. The format Geert describes is now preferred.

> > I assume you plan to describe the DMA-related properties later?
> Yes, it will take a while to sort out.
