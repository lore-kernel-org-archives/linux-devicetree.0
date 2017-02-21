From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 5/5] ARM: dts: sun9i: Initial support for the Sunchip
 CX-A99 board
Date: Tue, 21 Feb 2017 15:27:22 -0800
Message-ID: <20170221232722.vo6prnnfebl2g2y5@lukather>
References: <cover.1486592470.git.rask@formelder.dk>
 <d4211c5d57f80b0281d7d332edc7d69e66202d3d.1486592471.git.rask@formelder.dk>
 <20170210085920.7l7gswm6yjuqgdfx@lukather>
 <20170216061753.sd7zjs5jzdingufp@localhost>
 <20170216182957.zypkvmg7xhwu6geq@lukather>
 <20170219201232.uvja5jvqhmltobra@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vtwvt3fevlh4e5g7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170219201232.uvja5jvqhmltobra@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vtwvt3fevlh4e5g7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 19, 2017 at 09:12:32PM +0100, Rask Ingemann Lambertsen wrote:
> On Thu, Feb 16, 2017 at 07:29:57PM +0100, Maxime Ripard wrote:
> > On Thu, Feb 16, 2017 at 07:17:54AM +0100, Rask Ingemann Lambertsen wrot=
e:
> > > > > Supported features (+ means tested):
> [...]
> > > > > + SATA port on on-board SATA-to-USB bridge *
> [...]
> > > > > * Only shows up when a SATA device is connected. Also, if a power=
 source
> > > > >   is connected to the USB 3.0 connector across power cycles (e.g.=
 FEL
> > > > >   boot), the bridge may not properly reset and not show up on the=
 USB bus.
> > > > >   The vendor U-Boot performs some unknown magic which resets the =
bridge.
> > > >=20
> > > > Is that magic at the USB level, or specific to the bridge itself?
> > >=20
> > > I don't know, but since the other USB port connected to the hub comes=
 up
> > > fine, I'm assuming it's something to do with the SATA-to-USB bridge.
> >=20
> > But where is that magic written to then? the USB controller registers,
> > or is it an USB packet?
>=20
> I don't know. Like I said, unknown magic. I haven't found the source code=
 to
> the U-Boot version that the board uses.

Then how do you know there's a magic in the first place?

> For all I know, it could be a bug in the Linux USB stack. I've always had
> to unplug and replug my USB keyboards after Linux has booted, otherwise
> they are not detected. If the keyboard was connected to a hub, Linux does=
n't
> detect that port on the hub, so the hub must be unplugged and replugged.
> If it's an internal hub, tough luck.

I have a laptop that certainly doesn't show that behaviour, so a bug
in the USB stack seems weird.

> > > > > +	reg_usb0_vbus: regulator-usb0-vbus {
> > > > > +		compatible =3D "regulator-fixed";
> > > > > +		regulator-name =3D "usb0-vbus";
> > > > > +		regulator-min-microvolt =3D <5000000>;
> > > > > +		regulator-max-microvolt =3D <5000000>;
> > > > > +		gpio =3D <&pio 7 15 GPIO_ACTIVE_HIGH>;	/* PH15 */
> > > > > +		enable-active-high;
> > > >=20
> > > > This is redundant with the GPIO flag
>=20
> The GPIO flag is overridden by the regulator core, which makes it mislead=
ing.
> I will remove the GPIO flag and add a comment there that GPIO flags are n=
ot
> supported. This is to prevent someone from thinking that
>=20
> gpio =3D <... GPIO_ACTIVE_HIGH>;
> enable-active-high;
>=20
> and
>=20
> gpio =3D <... GPIO_ACTIVE_LOW>;
>=20
> are equivalent. It would be an easy mistake to make, because in mmc nodes,
>=20
> cd-gpios =3D <...  GPIO_ACTIVE_HIGH>;
>=20
> and
>=20
> cd-gpios =3D <...  GPIO_ACTIVE_LOW>;
> cd-inverted;
>=20
> _are_ equivalent.

And your point is? The gpio flags are now properly passed through to
their respective consumers, which was not the case before. Everything
works, without the workaround that we had to use before. Why would you
want to use anything else than the property that just works without
any modification and with the minimal amount of "code" ?

>=20
> > > No. I have now tested without "enable-active-high" and then Vbus stay=
s off.
> > > This is also in line with the binding documentation:
> > >=20
> > > "- enable-active-high: Polarity of GPIO is Active high
> > >  If this property is missing, the default assumed is Active low."
> > >
> > > It also seems to me that the way this is implemented in Linux, the GP=
IO
> > > polarity flag is ignored.
> >=20
> > It works just fine if the driver uses the gpiod API. If that driver
> > doesn't, then that driver needs some fixing :)
>=20
> Take it up with the maintainer of the regulator core, then. :)

Or you can also submit a patch fixing it.

> From of_get_fixed_voltage_config() in drivers/regulator/fixed.c:
> [...]
> 	config->gpio =3D of_get_named_gpio(np, "gpio", 0);
> [...]
> 	config->enable_high =3D of_property_read_bool(np, "enable-active-high");
> 	config->gpio_is_open_drain =3D of_property_read_bool(np,
> 							   "gpio-open-drain");
> [...]
>=20
> From reg_fixed_voltage_probe() in drivers/regulator/fixed.c:
> [...]
> 		config =3D of_get_fixed_voltage_config(&pdev->dev,
> 						     &drvdata->desc);
> [...]
> 	if (gpio_is_valid(config->gpio)) {
> 		cfg.ena_gpio =3D config->gpio;
> 		if (pdev->dev.of_node)
> 			cfg.ena_gpio_initialized =3D true;
> 	}
> 	cfg.ena_gpio_invert =3D !config->enable_high;
> 	if (config->enabled_at_boot) {
> 		if (config->enable_high)
> 			cfg.ena_gpio_flags |=3D GPIOF_OUT_INIT_HIGH;
> 		else
> 			cfg.ena_gpio_flags |=3D GPIOF_OUT_INIT_LOW;
> 	} else {
> 		if (config->enable_high)
> 			cfg.ena_gpio_flags |=3D GPIOF_OUT_INIT_LOW;
> 		else
> 			cfg.ena_gpio_flags |=3D GPIOF_OUT_INIT_HIGH;
> 	}
> 	if (config->gpio_is_open_drain)
> 		cfg.ena_gpio_flags |=3D GPIOF_OPEN_DRAIN;
> [...]
>=20
> From regulator_ena_gpio_request() in drivers/regulator/core.c:
> [...]
> 	gpiod =3D gpio_to_desc(config->ena_gpio);
> [...]
> 	ret =3D gpio_request_one(config->ena_gpio,
> 				GPIOF_DIR_OUT | config->ena_gpio_flags,
> 				rdev_get_name(rdev));
> [...]
> 	pin->gpiod =3D gpiod;
> 	pin->ena_gpio_invert =3D config->ena_gpio_invert;
>=20
> And finally, gpio_request_one() in drivers/gpio/gpiolib-legacy.c:
>=20
> int gpio_request_one(unsigned gpio, unsigned long flags, const char *labe=
l)
> {
> 	struct gpio_desc *desc;
> 	int err;
>=20
> 	desc =3D gpio_to_desc(gpio);
> [...]
> 	if (flags & GPIOF_OPEN_DRAIN)
> 		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
>=20
> 	if (flags & GPIOF_OPEN_SOURCE)
> 		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
>=20
> 	if (flags & GPIOF_ACTIVE_LOW)
> 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
>=20
> 	if (flags & GPIOF_DIR_IN)
> 		err =3D gpiod_direction_input(desc);
> 	else
> 		err =3D gpiod_direction_output_raw(desc,
> 				(flags & GPIOF_INIT_HIGH) ? 1 : 0);
> [...]
>=20
> > > > > +		regulator-always-on;
> > > >=20
> > > > And it shouldn't be always on. The USB driver will enable it if nee=
ds
> > > > be.
> > >=20
> > > Yes, we just don't have a driver for the A80 USB 3.0 port yet.
> >=20
> > Aaah, so that's what you meant. Leave it out of the DT then.
>=20
> OK.
>=20
> > > > You're listing a minimum state of 750mv, yet your minimum voltage is
> > > > 800mV.
> > >=20
> > > Yes. The regulator is capable of outputting the listed voltages in the
> > > 750 mV to 1200 mV range, but the permissible range of the consumer is=
 only
> > > 800 mV to 1100 mV according to the A80 data sheet. Likewise, the AXP8=
06
> > > regulators support a larger voltage range than that of the connected
> > > consumers.
> >=20
> > Adding a comment stating that would be nice then.
>=20
> OK.
>=20
> > > > > +	pmic@745 {
> > > > > +		compatible =3D "x-powers,axp808", "x-powers,axp806";
> > > > > +		reg =3D <0x745>;
> > > > > +		interrupt-parent =3D <&nmi_intc>;
> > > > > +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> > > > > +		interrupt-controller;
> > > > > +		#interrupt-cells =3D <1>;
> > > > > +
> > > > > +		swin-supply =3D <&reg_dcdce>;
> > > >=20
> > > > Please use an incude for that PMIC.
> > >=20
> > > I don't understand. What would that include file contain? Very few li=
nes
> > > would be shared between .dts files. You could save < 8 lines total if=
 you
> > > #include the 5 lines that are common between the Cubieboard4, the Opt=
imus
> > > and this board.
> >=20
> > You also have to take into account that the PMIC is barely supported
> > at the moment, you'll also need to define the GPIO controllers, the
> > various power supplies, adc, etc. nodes that are going (hopefully to
> > be added) in the future.
> >=20
> > If the include is shared, once it is enabled, every one benefits from
> > it. Otherwise, you have to duplicate that change across all DTs. This
> > is much likely to error, harder to maintain, and you end up in a
> > situation where none of the boards really support the same feature set
> > while being based on the same SoC / PMIC combination.
>=20
> Fair enough, I'll add an include file the next time around. Like you
> mentioned youself, though, we will only really know how compatible the two
> PMICs are when we have the code to support the other features (or a data
> sheet/user's manual is found). I'm hopeful based on what has been found so
> far.

Adding a new compatible early on is cheap. Dealing with a device that
was supposed to be fully compatible but turned out not to be is really
painful, so yeah, it's better to just add a new compatible from the
very beginning, even if we'll always behave in the exact same way.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vtwvt3fevlh4e5g7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYrMzXAAoJEBx+YmzsjxAgrAUP/ipJn8I4HCIz236DTNCxXCj0
7+SbAP+JV/8HdXtGjDTqhctbMRuUYP2HAB0XWci3JxjLNOEiO5zUFY0iwiCyK3GD
VAwAn55AGSjyusBX/+B7JO/WzwfiWm4hY3TpiUG9HdWCB7kMgueA6cZlGfUp+Uxp
1CKfBZGX2eeoBcwgda9dCY7PUTnyYxmYGQPs/yMawoaGK5Y/BHOEgA9qio5Zd+Uj
+DGQaNZ+8gsYAWhkT4HTZHXEjcKHvt6RW1xVfQZGM6Q8iYxcQWgQnV10zEUAQKK1
OUSJA3Navd6+Ncb80Y+hIswnc1TQKtlltnwDVUnE2wDT4HrtCr33Lw6TSbFfABuw
baC1d3o+1QIUe8PDRbvwp8TDSHpJ5GucTQQbujrOyXlL8CEJxhO3I7BUkLGnRH2J
sar6ORIpyB91XAKsSQ2LFVJPe3G9xTfWbbny5kXUy90Gi9E8ojUfz3m3T19dr/8M
ZSo4NhVgTikj27VUZ9f5CYCwBMQsIFqIqiSr06vHex72QnGn0TmRCHEpp0fjHTSx
Njj8vKT2+7GHo3LlwxHFdpWUm6FGiVkbn4iMcUTGWSBQwIc9hUWUaIukI5wNzC1o
2Aw9cKzACnj3R3YNyWmlB1NHgElkkSl19n2oqzb7dVOs1cftVXN79XgzVwj+aN7f
teiXO/Np6woC3dKTqv8r
=RBz+
-----END PGP SIGNATURE-----

--vtwvt3fevlh4e5g7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
