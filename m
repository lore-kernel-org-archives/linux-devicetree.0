From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: sun7i: Add support for the
 Ainol AW1 tablet
Date: Thu, 12 Apr 2018 16:51:36 +0200
Message-ID: <20180412145136.zp2i7u76oinphiiz@flea>
References: <20180410213129.24049-1-contact@paulk.fr>
 <20180410213129.24049-3-contact@paulk.fr>
 <20180411070657.kw6uckqtmwb7p5hf@flea>
 <7f6d6a6a5a0cc2d37ebba046509d4f25d3bfa600.camel@paulk.fr>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kzof2any5a4z6n2z"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBBHFXXLAKGQEGGBMDBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <7f6d6a6a5a0cc2d37ebba046509d4f25d3bfa600.camel-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--kzof2any5a4z6n2z
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Apr 12, 2018 at 01:08:51AM +0200, Paul Kocialkowski wrote:
> > > +	backlight: backlight {
> > > +		compatible = "pwm-backlight";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&backlight_enable_pin>;
> > 
> > You don't need any of the pinctrl nodes for the GPIOs
> 
> I tried without the pinctrl nodes and got issues on various controllers
> (e.g. i2c for the touchscreen) because of the missing pinctrl nodes on
> 4.16. Maybe I'm missing some patches here?

You don't need any patches. What was the error exactly?

> > > +&cpu0 {
> > > +	cpu-supply = <&reg_dcdc2>;
> > > +};
> > 
> > How was CPUfreq tested?
> 
> In fact, I haven't tried it at all, but I can definitely do that with
> e.g. ssvb's stress test for various cpufreq functioning points.

That would be great yes.

> > > +&i2c2 {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&i2c2_pins_a>;
> > > +	status = "okay";
> > > +	clock-frequency = <400000>; /* 400 KHz required for
> > > GSL1680. */
> > 
> > I'm not sure that comment is worth it. The only device there is the
> > touchscreen, so it's kind of obvious that it's the device that needs
> > that frequency.
> 
> Well, I found a similar comment in the other dts using the same
> touchscreen controller. Since the information was rather valuable (it
> made it clear that I needed the same clock frequency for that specific
> touchscreen),

You can have the same kind of comment for pretty much all DT
lines. you could for example have on the pinctrl property just above
the comment that the I2C2 on that boards are tied to those pins. But
that's just redundant, and the SNR would be pretty bad if we were to
do it everywhere.

> it might help others in the future (even if only when grepping for
> gsl1680).
> 
> > > +
> > > +	gsl1680: touchscreen@40 {
> > > +		compatible = "silead,gsl1680";

You have the gsl1680 two times here, so grep would find it either way.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--kzof2any5a4z6n2z--
