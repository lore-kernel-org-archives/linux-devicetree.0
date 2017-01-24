From: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: add DT binding for s3c2410 USB
 device controller
Date: Tue, 24 Jan 2017 16:21:30 -0200
Message-ID: <20170124182130.GA17635@sprado-desktop>
References: <1484172150-32075-1-git-send-email-sergio.prado@e-labworks.com>
 <1484172150-32075-2-git-send-email-sergio.prado@e-labworks.com>
 <20170118200845.qj4qzgav4ffcz5pa@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170118200845.qj4qzgav4ffcz5pa@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2017 at 02:08:45PM -0600, Rob Herring wrote:
> On Wed, Jan 11, 2017 at 08:02:29PM -0200, Sergio Prado wrote:
> > + - clocks: Should reference the bus and host clocks
> > + - clock-names: Should contain two strings
> > +		"uclk" for the USB bus clock
> > +		"usb-device" for the USB device clock
> 
> Perhaps just "bus" and "device".

OK, I'll rename.

> > +
> > +Optional properties:
> > + - samsung,vbus-gpio: specifies a gpio that allows to detect whether
> > +   vbus is present - USB is connected (active high, input).
> > + - samsung,pullup-gpio: If present, specifies a gpio to control the
> > +   USB D+ pullup (active high, output).
> 
> "-gpios", not "-gpio" is preferred.
> 
> These should be common property names if we're going to have them. The 
> problem with just "vbus-gpios" is does that mean an enable control or 
> status as you have. I guess in the former case, that should always be 
> modeled as a regulator.
> 
> Also, these should all be part of a connector node as these controls are 
> more related to the USB connector than the controller. And I don't mean 
> extcon here because those bindings are a mess.

There are other bindings that are doing the same thing I did, like the
property "atmel,vbus-gpio" in atmel-usb.txt and "samsung,vbus-gpio" in
exynos-usb.txt. Also, I did not find any example of a connector node doing
this. Can you point me out to an example, or should I just rename to
"-gpios" in this case?

> 
> Rob

-- 
Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
