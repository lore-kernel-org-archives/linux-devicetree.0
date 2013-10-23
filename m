From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 09:57:58 +0200
Message-ID: <20131023075758.GA7404@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131021085420.GA21518@ulmo.nvidia.com>
 <52658C49.80400@wwwdotorg.org>
 <5265AFED.1040503@roeck-us.net>
 <52665314.2040904@imgtec.com>
 <232aa6e4-19fe-4460-8101-8bf1d639ff3c@email.android.com>
 <20131022164922.GA29852@roeck-us.net>
 <20131022203546.GC8037@mithrandir>
 <20131022211000.GA30394@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131022211000.GA30394-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2013 at 02:10:00PM -0700, Guenter Roeck wrote:
[...]
> Thinking about it, much of a hardware description can be seen as "use
> case", at least when it comes to gpio pins or adc channels.

There are many more examples where this is the case. Regulators are one
example. A regulator is pretty much useless until you connect it up to
some other device.

The same goes for things like a backlight. Sure we can expose backlights
via sysfs and tell people to use that interface to control the backlight
but that just doesn't always work. Furthermore, backlights don't always
need to be associated with display panels. They can be used together
with keyboards too...

In order to effectively make use of these basic building blocks we need
some way to interconnect them, because they cannot be correlated to each
other without some form of meta data.

> > But on the other hand we do the same with other "resources". GPIOs for
> > example are rather useless if you don't associate them with specific
> > functionality. And we actually do that quite often. They are used in
> > properties such as:
> >=20
> > 	foo {
> > 		...
> > 		enable-gpios =3D <&gpio 42 0>;
> > 		...
> > 	};
> >=20
> > I don't see how that is different to the ADC/sensor example above.
> > Perhaps there's no real physical device that is the sensor, but if we
> > can't even represent simple yet essential things like that in DT, then
> > we definitely need something better.
> >=20
> I don't think the issue is "can". After all, the restriction that DT shal=
l only
> describe HW and not its use is purely arbitrary.

That's what I was trying to say. "can" in the sense of "not able because
we're arbitrarily restricting what we can express with DT".

Now, I can even understand why it's a good idea to keep Linux-specifics
out of the DT and not encode software policy within it, but all these
examples aren't software policy nor Linux-specifics. In my opinion they
describe hardware. They may not restrict themselves to the bare minimum,
but they give meaning to the hardware so that an operating system can
use it.

If we cannot describe these things in DT but have to come up with some
alternative method to describe it, then any other operating system would
either need to copy that alternative method (in which case there's no
point at all in keeping it separate from DT) or invent yet something
different to describe those relationships.

I've said above that I understand why it can be good to keep DT hardware
specific, but I also think that if that's what we end up deciding, we'll
still need to supplement it with something that can describe software
policy. With our concept of DT right now we're regressing with respect
to board files because some things can no longer be described.

> > We do pretty much the same thing with regulators. We can have fixed
> > regulators that control a GPIO, yet there's no physical device that one
> > could associate with such regulators either.
> >=20
> > > Another example is my recent attempt to add dt support to gpio based =
connectors.
> > > Even though a connector is as much hardware as it can get (or at leas=
t one
> > > should think so), that was rejected because it isn't generic enough a=
nd,
> > > after all, it describes the _use_ of gpio pins which apparently is al=
ready
> > > borderline. So now I have my own out of tree driver (where I can add =
as many
> > > bindings and as much functionality as I want and see fit, so I am not=
 too
> > > unhappy about that).
> >=20
> > That's odd. This sounds exactly like a variant of the above. Would you
> > mind posting the binding (or a usage example here)? I'd be interested to
> > understand why it would be inappropriate.
> >=20
>=20
> Patch 4 and 5 of https://lkml.org/lkml/2013/8/30/23.
>=20
> The bindings I currently use are actually a bit more complex.
> Here is an example.
>=20
>         pic1 {
>             compatible =3D "jnpr,pic-connector";
>             presence-detect-gpios =3D <&gpio20 36 0x10013>;
>             request-button-gpios =3D <&gpio20 38 0x10013>;
>             power-enable-gpios =3D <&gpio20 42 0x0>;
>             power-status-gpios =3D <&gpio20 39 0x3>;
>             reset-gpios =3D <&gpio20 41 0x10000>;
>             power-enable-timeout =3D <2000>;
>             debounce-interval =3D <1>;
>             led-green =3D <&pic1_green>;
>             led-red =3D <&pic1_red>;
>=20
>             i2c-bus {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>=20
>                 i2c-parent =3D <&pic1i2c>;
>=20
>                 eeprom@55 {
>                     compatible =3D "atmel,24c02";
>                     reg =3D <0x55>;
>                     ideeprom;
>                 };
>             };
>         };
>=20
> [ Note this is preliminary, and I expect some of the bindings to change.
>   Also, I have no plan to even try to get this code upstream ;) ]

This is rather complex, but then, describing relationships within one
board is already difficult, so I'm not surprised that describing
connections between boards is even more difficult. I suspect that the
above could more traditionally be written as:

	pic1i2c: i2c-controller {
		...

		eeprom@55 {
			/* insert all other properties here */
		};
	};

But that breaks down once you start needing to represent more than just
a single EEPROM behind the connector.

> > > not the very least because DT isn't supported on x86 and I have to de=
al with
> > > that situation as well (and, no, ACPI doesn't solve my problems there=
 either).
> >=20
> > Actually DT is supported very well on x86. There's at least one platform
> > in mainline that uses it (arch/x86/platform/ce4100/falconfalls.dts) and
> > I've ported a platform that I worked on in the past to use DT on x86 as
> > well.
> >=20
> But presumably that was DT only, or was it a system that needs to use
> DT on top of ACPI ? If so, I would be very interested in that experience,
> especially if you had any issues to get it working.

I'm not quite sure I understand what you mean by "on top of ACPI". The
device certainly did support ACPI, but I was using DT more as a
supplement to describe what ACPI and PCI couldn't.

To be somewhat more specific, the platform used an FPGA connected to the
chipset using PCIe. That itself was excellent because all of a sudden
devices were actually discoverable. So it was easy to just implement a
GPIO, SPI or I2C controller and whatnot within that FPGA, but once a
device behind SPI or I2C needed to be hooked up, you loose all benefits
=66rom having something like PCI and you're back to square one.

One example where this became essential was that the touchscreen on the
device was controlled by an I2C chip, and the touchscreen controller's
interrupt pin was connected to the GPIO controller on the PCI bus. So
what we ended up with looked roughly something like this:

	pci@3fc {
		[...bunch of nodes to describe PCI hierarchy...]

		pci@2,0 {
			/* GPIO expander */
			gpio: pci@0,0 {
				...
				interrupt-controller;
				...
			};
		};

		[...more nodes...]

		pci@8,0 {
			/* I2C controller */
			pci@0,0 {
				touchscreen@48 {
					...
					interrupt-parent =3D <&gpio>;
					interrupts =3D <1 0x8>;
					...
				};
			};
		};
	};

That's a *very* simplified form. The complete device tree is much more
complex because it requires the exact hierarchy of PCI to be represented
in order for the right device nodes to end up attached to the right PCI
devices.

But perhaps that doesn't help you at all with the problems that you've
encountered?

Thierry

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZ4GGAAoJEN0jrNd/PrOhPe4P/23/28CcMjuFYztZdgQb41av
8vpsxSAQkxalhTZFy+k6tO5qpADkHwawbKGQxuN2lxAs9F4ZrygGOjzECniR7k2C
2SO5MUFrjat1XvUa2pHyfQfYEWvRfKfkh5CCpuSIweIEQw0Y1aHvbIWcBkSscb6Q
PABQkEUPucEUX3+/Onbh6ras48VakrRDVKDjUTMKsrcW/hGbjca78I5XlGnnNUrC
vX0kfTwXW5oz3UnjHo6zYKRMRChh8Ac5EKlZl2yFq19jl/s2xyTXBPfMJRpLVUcD
cBi9ZkXJfbGeWxRLIZS09b+r2Bqi9pJfO9EsZBBiFwryQop2MRDkkYKUX3IlPfFL
jm3nWsz3v9Frgy0dCEez04z3Ke2mEijT8w686DfbZDsft14AWt6g7n0CaNbHB3PA
ux/qQglz/vvVlQuM2aFH4BytSpK7hkdnPAw3CyTMbegQn6yRj4uOmfCh+XTnYbb3
L4Oa0eGNdloDJCIaVsfo73s4HTkJYpkDScmPDct5bbPY+1DDT2/wRqv0U94oaRMR
CBiKyLDrzr0p1Zi7sJGVv8XAwiuygcEklpaoYVyn9bJYFkjtdm9juOJApt3qaBZI
xA09s+TYsKs3c3ZocaK4jq514P9ZZRoXwF2qm0eL7t9dZ2vnw4WVsfFG96uJGoh7
s+mKOISVP6sRJu+dLBc/
=sY2H
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
