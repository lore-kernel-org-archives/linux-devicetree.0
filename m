From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 1/2] Documentation: devicetree: add epson rx6110
 binding
Date: Thu, 10 Dec 2015 11:56:59 +0100
Message-ID: <20151210105659.GC20212@pengutronix.de>
References: <1449568461-26016-1-git-send-email-s.trumtrar@pengutronix.de>
 <1449570566.3691.31.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449570566.3691.31.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

On Tue, Dec 08, 2015 at 11:29:26AM +0100, Philipp Zabel wrote:
> Am Dienstag, den 08.12.2015, 10:54 +0100 schrieb Steffen Trumtrar:
> > Add the binding documentation for the Epson RX6110 RTC.
> > 
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Reviewed-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> although I'd like a small change to be made below:
> 
> > ---
> > Changes since v2:
> > 	- removed the size field in i2c binding
> > 
> >  .../devicetree/bindings/rtc/epson,rx6110.txt       | 39 ++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx6110.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.txt b/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
> > new file mode 100644
> > index 000000000000..71353542a59d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
> > @@ -0,0 +1,39 @@
> > +Epson RX6110 Real Time Clock
> > +============================
> > +
> > +The Epson RX6110 can be used with SPI or I2C busses. The kind of
> > +bus depends on the SPISEL pin and can not be configured via software.
> > +
> > +I2C mode
> > +--------
> > +
> > +Required properties:
> > +  - compatible: should be: "epson,rx6110"
> > +  - reg : offset of the register set of the device
> 
> That should be the I2C address of the device, as in:
> 	git grep "reg.*I2C address" Documentation/
> 

Sounds reasonable. Changed.

Thanks,
Steffen Trumtrar

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
