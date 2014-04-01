From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/2] NFC: pn544_i2c: Add DTS Documentation
Date: Tue, 1 Apr 2014 17:05:36 +0100
Message-ID: <20140401160536.GK16420@e106331-lin.cambridge.arm.com>
References: <6ec915ed416745248c5ed4aa22dfe0e6@AMXPR04MB136.eurprd04.prod.outlook.com>
 <20140331152550.GA15064@e106331-lin.cambridge.arm.com>
 <ab2e5666063c4ea1937636a911dfca02@AMXPR04MB136.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ab2e5666063c4ea1937636a911dfca02-fjMGVQzTDdguRZvghep3ngfhPeD8jYilXA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Clement Perrochaud <clement.perrochaud-3arQi8VN3Tc@public.gmane.org>
Cc: "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-y27Ovi1pjclAfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 01, 2014 at 02:45:10PM +0100, Clement Perrochaud wrote:
> Mark Rutland wrote: 
> > s/_/-/ in compatible strings and property names, please. 
> >  [...]
> > As this is an interrupt from the point of view of the device, I would
> > prefer this described as an interrupt (using the standard interrupts
> > property), with the GPIO controller described as an interrupt
> > controller. 
> >  [...]
> > enable-gpios? 
> >  [...]
> > firmware-gpios? 
> 
> Hi Mark,
> 
> Thank you for your help.
> 
> Where can I find documentation describing these naming conventions?

Documentation/devicetree/bindings/gpio/gpio.txt:

	GPIO properties should be named "[<name>-]gpios".

In general, following existing style is preferred, and "enable-gpios" is
already relatively common.

We admittedly have short names like "cs-gpios", but personally I would
prefer "firmware-gpios" to "fw-gpios" for clarity.

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
