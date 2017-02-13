From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 3/3] mfd: wm831x: Add device tree binding document
Date: Mon, 13 Feb 2017 08:58:03 +0000
Message-ID: <20170213085803.GW1754@localhost.localdomain>
References: <1486734800-10141-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1486734800-10141-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170213083158.j5l2jxkem2xlbrq7@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170213083158.j5l2jxkem2xlbrq7@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 13, 2017 at 08:31:58AM +0000, Lee Jones wrote:
> On Fri, 10 Feb 2017, Charles Keepax wrote:
> 
> > This is just a very simple initial binding, supporting only registering
> > the chip and the GPIOs. More features will be added as support for
> > device tree in the driver is expanded.
> > 
> > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/wm831x.txt | 31 ++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/wm831x.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/wm831x.txt b/Documentation/devicetree/bindings/mfd/wm831x.txt
> > new file mode 100644
> > index 0000000..9771022
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/wm831x.txt
> > @@ -0,0 +1,31 @@
> > +Cirrus Logic/Wolfson Microelectronics wm831x PMICs
> > +
> > +System PMICs with a wide range of additional features.
> > +
> > +Required properties:
> > +
> > +  - compatible : One of the following chip-specific strings:
> > +        "wlf,wm8310"
> > +        "wlf,wm8311"
> > +        "wlf,wm8312"
> > +        "wlf,wm8320"
> > +        "wlf,wm8321"
> > +        "wlf,wm8325"
> > +        "wlf,wm8326"
> > +
> > +  - reg : I2C slave address when connected using I2C, chip select number when
> > +    using SPI.
> > +
> > +  - gpio-controller : Indicates this device is a GPIO controller.
> > +  - #gpio-cells : Must be 2. The first cell is the pin number and the
> > +    second cell is used to specify optional parameters (currently unused).
> 
> Will it ever be used?
> 

Hopefully, it is used on some hardware that we supply which I am hoping to
upstream support for shortly.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
