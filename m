From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/7] Documentation: bindings: add documentation for
 ir-spi device driver
Date: Mon, 12 Sep 2016 08:27:02 -0500
Message-ID: <20160912132702.GA20044@rob-hp-laptop>
References: <20160901171629.15422-1-andi.shyti@samsung.com>
 <20160901171629.15422-7-andi.shyti@samsung.com>
 <CGME20160901214120epcas1p3c4e212a695d1575acaf0d3bd8525560d@epcas1p3.samsung.com>
 <CAL_JsqL_AG0m_BctOBV+QOGJcUEup_6ovS6shjo+BrJ974jpaA@mail.gmail.com>
 <20160902053320.wqe5hklklnyvcc5m@samsunx.samsung>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160902053320.wqe5hklklnyvcc5m-4M0o0xkwKdT35fTxX1Dczw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Sean Young <sean-hENCXIMQXOg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andi Shyti <andi-ahk0KpmfxKRAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 02, 2016 at 02:33:20PM +0900, Andi Shyti wrote:
> Hi Rob,
> 
> > > Document the ir-spi driver's binding which is a IR led driven
> > > through the SPI line.
> > >
> > > Signed-off-by: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/media/spi-ir.txt | 26 ++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/spi-ir.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/spi-ir.txt b/Documentation/devicetree/bindings/media/spi-ir.txt
> > > new file mode 100644
> > > index 0000000..85cb21b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/spi-ir.txt
> > 
> > Move this to bindings/leds, and CC the leds maintainers.
> 
> More than an LED this is the driver of a remote controller, the
> driver itself is under drivers/media/rc/.

The hardware is just an LED though and bindings describe h/w. What you 
are using it for doesn't really matter. You only need to know it's an IR 
led.
 
> Besides all the transmitters have an LED but still they are media
> devices. This is a bit special because it's so simple that the
> only hardware left is the LED itself, but still it's a media remote
> controller.
> 
> > > @@ -0,0 +1,26 @@
> > > +Device tree bindings for IR LED connected through SPI bus which is used as
> > > +remote controller.
> > > +
> > > +The IR LED switch is connected to the MOSI line of the SPI device and the data
> > > +are delivered thourgh that.
> > > +
> > > +Required properties:
> > > +       - compatible: should be "ir-spi".
> > 
> > Really this is just an LED connected to a SPI, so maybe this should
> > just be "spi-led". If being more specific is helpful, then I'm all for
> > that, but perhaps spi-ir-led. (Trying to be consistent in naming with
> > gpio-leds).
> 
> As I mentioned above, all transmitters have an LED, but they do
> not have the 'led' name. "ir-spi" is coherent with the device
> driver name and the driver name is coherent with the media/rc
> driver's naming.

The driver name is irrelevant to the binding. 

[...]

> If it's OK for you, I would keep the name and documentation path
> and fix the rest. Please let me know if I'm missing something :)

It's not OK for me.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
