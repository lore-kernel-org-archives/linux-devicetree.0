From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v7 14/14] usb: chipidea: add imx platform driver
Date: Wed, 27 Jun 2012 14:20:06 +0800
Message-ID: <20120627062005.GB21750@b20223-02.ap.freescale.net>
References: <1340607391-16380-1-git-send-email-richard.zhao@freescale.com>
 <1340607391-16380-15-git-send-email-richard.zhao@freescale.com>
 <4FE83E96.5090004@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FE83E96.5090004-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 25, 2012 at 12:33:58PM +0200, Marc Kleine-Budde wrote:
> On 06/25/2012 08:56 AM, Richard Zhao wrote:
> > This patch supports only the host-mode functionality so far.
> > 
> > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> > Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> > Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> > Tested-by: Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/usb/ci13xxx-imx.txt        |   20 ++
> >  drivers/usb/chipidea/Makefile                      |    3 +
> >  drivers/usb/chipidea/ci13xxx_imx.c                 |  197 ++++++++++++++++++++
> >  3 files changed, 220 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
> >  create mode 100644 drivers/usb/chipidea/ci13xxx_imx.c
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
> > new file mode 100644
> > index 0000000..8bcd071
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
> > @@ -0,0 +1,20 @@
> > +* Freescale i.MX ci13xxx usb controllers
> > +
> > +Required properties:
> > +- compatible: Should be "fsl,imx27-usb"
> > +- reg: Should contain registers location and length
> > +- interrupts: Should contain controller interrupt
> > +
> > +Optional properties:
> > +- fsl,usbphy: phandler of usb phy that connects to the only one port
> 
> > +- fsl,hub-reset-gpios: gpio used to reset on-board usb hub
> > +- fsl,vbus-power-gpios: gpio used to set vbus power of the only one port
> 
> These two properties are not implemented, are they?
> vbus is handled via a fixed regulator.
I forgot to update the doc.
> 
> Further I'm looking into the phy and otg implementation. I think the
> handling of the regulator should go into mxs-phy.c, not into the
> ci13xxx_imx.c
Normally, we don't put it in phy driver. For example, most host driver
don't call phy drivers.

Thanks
Richard
> 
> Marc
> -- 
> Pengutronix e.K.                  | Marc Kleine-Budde           |
> Industrial Linux Solutions        | Phone: +49-231-2826-924     |
> Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
> Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |
> 
> 
> 



--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
