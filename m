From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 12/12] ARM: dtsi: axp81x: set pinmux for
 GPIO0/1 when used as LDOs
Date: Tue, 3 Oct 2017 16:47:37 +0200
Message-ID: <20171003144737.rhgtp3uwckhvoqdw@flea>
References: <20171002120854.5212-1-quentin.schulz@free-electrons.com>
 <20171002120854.5212-13-quentin.schulz@free-electrons.com>
 <CACRpkdZYcSuhvn0b0qa0k1PQHoyXjNyjoyhR2sPme_t1pF12Dg@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7j55ewpdbwxu4oy3"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBC6GZ3HAKGQEPJ54ZCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CACRpkdZYcSuhvn0b0qa0k1PQHoyXjNyjoyhR2sPme_t1pF12Dg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7j55ewpdbwxu4oy3
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi Linus,

On Tue, Oct 03, 2017 at 09:27:17AM +0000, Linus Walleij wrote:
> On Mon, Oct 2, 2017 at 2:08 PM, Quentin Schulz
> <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> > On AXP813/818, GPIO0 and GPIO1 can be used as LDO as (respectively)
> > ldo_io0 and ldo_io1.
> (...)
> > +               gpio0_ldo: gpio0_ldo {
> > +                       pins = "GPIO0";
> > +                       function = "ldo";
> > +               };
> (...)
> > +                       pinctrl-names = "default";
> > +                       pinctrl-0 = <&gpio0_ldo>;
> >                         /* Disable by default to avoid conflicts with GPIO */
> >                         status = "disabled";
> 
> So this is still by default disabled, but you make the default
> mode something called "ldo".
> 
> And I think that is to be understood as a low-dropout regulator?
> 
> So is the idea that this should be represented as a regulator
> in the end?
> 
> Then I think the state name should not be "default" rather
> something like "regulator" and "default" should be the GPIO
> mode, as I guess something like that exists.
> 
> Activating a regulator using pin control "default" mode is
> not very pretty. It would probably be unintuitive and end
> up wasting power because people will get confused about
> what is going on.

That's not really it. The PMIC has pins that can be muxed either to
(regular) GPIOs, an ADC or to an LDO regulator.

This is just muxing, the regulator will be enabled and disabled
separately through another register. If it wasn't the case, it would
indeed be very messy.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--7j55ewpdbwxu4oy3--
