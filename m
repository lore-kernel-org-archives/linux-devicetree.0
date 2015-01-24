From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun4i: Add initial dts for Gemei G9 tablet
Date: Sat, 24 Jan 2015 17:53:41 +0200
Message-ID: <1422114821.3851.25.camel@plaes.org>
References: <1422045409-1251-1-git-send-email-plaes@plaes.org>
	 <20150123212203.GB8470@lukather> <1422050375.1799.9.camel@plaes.org>
	 <20150124143945.GD8470@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150124143945.GD8470@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Sat, 2015-01-24 at 15:39 +0100, Maxime Ripard wrote:
> Hi,
>=20
> On Fri, Jan 23, 2015 at 11:59:35PM +0200, Priit Laes wrote:
> >=20
> > On Fri, 2015-01-23 at 22:22 +0100, Maxime Ripard wrote:
> > > On Fri, Jan 23, 2015 at 10:36:49PM +0200, Priit Laes wrote:
> > > > Gemei G9 is an A10 based tablet, with 1G RAM, 16G NAND,=20
> > > > 1024x768 IPS LCD display, stereo speakers, 1.3MP front camera=20
> > > > and 5 MP
> > > > rear camera, 8000mAh battery, GT901 2+1 touchscreen, Bosch=20
> > > > BMA250 accelerometer and RTL8188CUS USB wifi. It also has=20
> > > > MicroSD slot, miniHDMI, 1 x MicroUSB OTG port and 1 x MicroUSB=20
> > > > host port and 3.5mm headphone jack.
> > > > More details are available at: http://linux-sunxi.org/Gemei_G9
> > > >=20
> > [..]
> > > >=20
> > > > +/ {
> > > > +    model =3D "Gemei G9 Tablet";
> > > > +    compatible =3D "gemei,g9", "allwinner,sun4i-a10";
> > > > +};
> > > > +
> > > > +/*
> > > > + * http://linux-sunxi.org/Gemei_G9
> > >=20
> > > Please don't put URL in the DT. This is very likely to change in=20
> > > the future, and won't be valid anymore.
> >=20
> > OK! The URL in commit message is ok to stay?
>=20
> Yeah, I'm not that fond of it, but it's not that important either.
>=20
> > > > +&i2c1 {
> > > > +    pinctrl-names =3D "default";
> > > > +    pinctrl-0 =3D <&i2c1_pins_a>;
> > > > +    status =3D "okay";
> > > > +
> > > > +    /* Accelerometer */
> > > > +    bma250@18 {
> > > > +        compatible =3D "bosch,bma250";
> > > > +        reg =3D <0x18>;
> > >=20
> > > Is there a driver for this? It looks weird that it doesn't need=20
> > > more properties than that.
> >=20
> > Yes, it's supported by drivers/iio/accel/bma180.c though I have to=20
> > admit that this name is a bit misleading. (bosch-bma.c would
> > better, I guess).
> >=20
> > And I was a bit surprised that it worked out of the box too, but=20
> > the device was present under /sys and I was able to read x, y, z=20
> > and temperature values.
>=20
> Cool :)
>=20
> There's no interrupt wired to it then?

Well, FEX file contained this:

[gsensor_para]
gsensor_used =3D 1
gsensor_name =3D "bma250"
gsensor_twi_addr =3D 0x18
gsensor_twi_id =3D 1
gsensor_int1 =3D port:PH00<6><1><default><default>
gsensor_int2 =3D port:PI10<6><1><default><default>

And according to the datasheet, this chip (bma250) has two interrupt=20
pins.

Now, the bma180/250 driver works without IRQ-s, but it currently only=20
supports single interrupt pin. Therefore I should at least add a=20
comment about these pins and revisit this issue later.

/* TODO: check whether following interrupt pins are connected:
 *   - int1 - PH00
 *   - int2 - PI10
 */


P=C3=A4ikest,
Priit Laes :)



--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
