From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2] ls2080a/dts: Add little endian property for GPIO IP
 block
Date: Mon, 16 Nov 2015 13:12:05 -0600
Message-ID: <1447701125.2262.356.camel@freescale.com>
References: <1446549552-40675-1-git-send-email-Gang.Liu@freescale.com>
	 <CACRpkdbf4X=dcZhtNrcJp7Zp_hnVDGH1gpKML-e=qcAgEzb0Nw@mail.gmail.com>
	 <CADRPPNROHmnOHfpAtaii5Hr3hzUmn4BL5OpQ4Q4hr9BGLq8s0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADRPPNROHmnOHfpAtaii5Hr3hzUmn4BL5OpQ4Q4hr9BGLq8s0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Liu Gang <Gang.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Wood Scott-B07421 <b07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Yang-R58472 <R58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-11-16 at 12:56 -0600, Li Yang wrote:
> On Mon, Nov 16, 2015 at 9:11 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> wrote:
> > On Tue, Nov 3, 2015 at 12:19 PM, Liu Gang <Gang.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > 
> > > The GPIO block for ls2080a platform has little endian registers,
> > > the GPIO driver needs this property to read/write registers by
> > > right interface.
> > > 
> > > Signed-off-by: Liu Gang <Gang.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
> > > b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
> > > index f2455c5..c836dab 100644
> > > --- a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
> > > +++ b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
> > > @@ -10,6 +10,9 @@ Required properties:
> > >    the second cell is used to specify the gpio polarity:
> > >        0 = active high
> > >        1 = active low
> > > +- little-endian : Should be set if the GPIO has little endian
> > > +                 registers. No the property means the GPIO
> > > +                 registers are big endian mode.
> > 
> > That is a very generic binding and I would like the devicetree
> > maintainers to say something about this.
> > 
> > I would be OK if this is specified for *all* gpiochips in
> > Documentation/devicetree/bindings/gpio/gpio.txt
> > or even higher up in the desriptions.
> > 
> > Just for Freescale seems a bit too local.
> 
> There is already a generic definition at
> Documentation/devicetree/bindings/common-properties.txt.  But it will
> be special for Freescale controller to say that the default is
> big-endian for backward compatibility.

Also, common-properties.txt says "if a binding supports these properties" so
this patch serves to indicate that this binding does support the little-endian
property.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
