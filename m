From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: gpio: add raspberry pi GPIO expander
 binding
Date: Thu, 4 Jan 2018 21:35:35 +0200
Message-ID: <20180104193535.63jmkxjvo3mynzpc@tarshish>
References: <cover.1514898134.git.baruch@tkos.co.il>
 <4ca1795c6e09eb89f481cdec55180b4f1165bbfd.1514898134.git.baruch@tkos.co.il>
 <860502005.181510.1514917560724@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <860502005.181510.1514917560724-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Stevenson <dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On Tue, Jan 02, 2018 at 07:26:00PM +0100, Stefan Wahren wrote: 
> > Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> hat am 2. Januar 2018 um 14:19 geschrieben:
> > 
> > 
> > The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware over
> > I2C. The firmware mailbox interface allows the ARM core to control the
> > GPIO lines.
> > 
> > Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> > ---
> >  .../bindings/gpio/brcm,bcm2835-expgpio.txt         | 24 ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm2835-expgpio.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm2835-expgpio.txt b/Documentation/devicetree/bindings/gpio/brcm,bcm2835-expgpio.txt
> > new file mode 100644
> > index 000000000000..55257f31a9be
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm2835-expgpio.txt
> > @@ -0,0 +1,24 @@
> > +Raspberry Pi GPIO expander
> > +
> > +The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware. The
> > +firmware exposes a mailbox interface that allows the ARM core to control the
> > +GPIO lines on the expander.
> > +
> > +Required properties:
> > +
> > +- compatible : Should be "brcm,bcm2835-expgpio"
> 
> from my understand this driver is specific to the Raspberry Pi and it's 
> vendor is the Raspberry Pi Foundation. So i prefer Eric's suggestion of 
> "raspberrypi,firmware-gpio", which also applies to the filename.

That was my inclination as well. But I thought that keeping DT compatibility 
with downstream is desirable.

I'll change compatible/file/driver names to raspberry something.

baruch

> > +- gpio-controller : Marks the device node as a gpio controller
> > +- #gpio-cells : Should be two.  The first cell is the pin number, and
> > +  the second cell is used to specify the gpio polarity:
> > +  0 = active high
> > +  1 = active low
> > +- firmware : Reference to the RPi firmware device node
> > +
> > +Example:
> > +
> > +expgpio: expgpio {
> > +	compatible = "brcm,bcm2835-expgpio";
> > +	gpio-controller;
> > +	#gpio-cells = <2>;
> > +	firmware = <&firmware>;
> > +};

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.52.368.4656, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
