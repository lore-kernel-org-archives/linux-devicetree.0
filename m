From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Fri, 20 Mar 2015 18:14:30 +0100
Message-ID: <20150320171430.GA20086@earth>
References: <20150318055437.21025.13990.stgit@notabene.brown>
 <80D7E742-4633-4CCD-B754-221387D82922@goldelico.com>
 <20150320194307.51cb4225@notabene.brown>
 <5A83DCE5-2CB4-48FF-80E7-6E6377045188@goldelico.com>
 <20150320130838.GC7734@earth>
 <72268D51-F993-497A-B4F9-707C8DB7155C@goldelico.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <72268D51-F993-497A-B4F9-707C8DB7155C-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, List for communicating with real GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 20, 2015 at 02:57:12PM +0100, Dr. H. Nikolaus Schaller wrote:
> > On Fri, Mar 20, 2015 at 09:54:21AM +0100, Dr. H. Nikolaus Schaller wrot=
e:
> >> [...]
> >> And we do not write a driver for the w2sg0004 but the regulator inside=
 that
> >> chip.
> >=20
> > DT describes the hardware structure and not the Linux driver
> > structure.
>=20
> I am not advocating for describing the Linux driver structure in DT.
> Rather I suggest that the DT should describe hardware and there
> is a regulator inside that chip=E2=80=A6

some drivers also have embedded clocks, which are not described,
since they are only useful for the device itself. Exposing them
is not useful.

> Linux drivers can follow that or mix everything into a single
> driver if that is better.

The DT binding is completly independent of drivers.

> >> You also won=E2=80=99t expect that the omap3 driver hides everything. =
You
> >> expect that the twl4030 provides some regulators that can be enabled
> >> by subsystems inside the omap3. And if I remember correctly there are
> >> regulators inside the omap3 which have explicit regulator nodes in the=
 DT.
> >=20
> > so let's have a look at twl regulators. They can be found below
> > the twl node, so they will look similar to
> >=20
> > / -> omap3 -> i2c -> twl -> regulator
> >=20
> > So properly mapped to the w2sg0004 device this would put your
> > regulator to
> >=20
> > / -> omap3 -> serial -> w2sg0004 -> regulator
>=20
> Yes. Indeed.
>=20
> Currently it is
>=20
> omap3 -> serial -> serial-power-manager (trying to cover a multitude
> of different chips).

No. The DT is omap3 -> serial -> w2sg0004 and w2sg0004 is
handled by a generic driver. If the kernel ever gets more
specific support for UART attached gps you can simply remove
the compatible value from the generic driver and create a
specific one.

> > This will gain you nothing as far as I can tell.
>=20
> And because of that I think Neil=E2=80=99s argument isn=E2=80=99t for or =
against
> anything.
>=20
> >=20
> > Please note that subdevices under the serial node are pretty useful,
> > since then the kernel can e.g. automatically setup correct line
> > disciplines for serial attached bluetooth chips and make bluetooth
> > work out of the box.
>=20
> I don=E2=80=99t doubt that such subnodes are useful. I just object mixing
> different chips and controls into a single subnode driver.

Well the binding allows to split this into multiple drivers
in the future (if needed).

> And as soon as you want to control line disciplines from such
> a subnode, you indeed need a driver for each variant.

Obviously I do not use the generic driver, but a specific one for
this task. Very simple devices (from kernel's point of view) can
still be handled by a generic driver (as Neil does).

> So a GPS chip needing some line discipline could be
>=20
> > / -> omap3 -> serial -> w2sg0004 -> line-discipline
> > / -> omap3 -> serial -> w2sg0004 -> regulator

Actually no. The line discipline does not describe HW, but just
how linux handles the device. It should not be part of DT at all.
The kernel will see compatible string for w2sg0004 and load the
correct line discipline.

> And if omap3 -> serial can directly control a regulator, it can
> easily be the w2sg0004 -> regulator

sure.

> > I am aware, that the Linux kernel has no such thing for serial
> > attached GPS devices, but that's Linux specific and irrelevant
> > for the DT description.
> >=20
> >> The w2sg0004-regulator approach just follows this principle.
> >> Anyone willing to control the power of the w2sg0004 can use this
> >> regulator interface.
> >=20
> > From a HW perspective your regulator "hides" the information, that
> > there is a device attached to the serial port and instead claims,
> > that a regulator is needed to make the serial port work.
>=20
> Yes, without this regulator the serial port does not work. It is IMHO
> more important than stating the obvious that a serial device is
> connected to a serial port.

This is actually not correct though. The serial port does work
without the regulator. The remote side does not work without the
regulator. So the regulator should be referenced by the w2sg0004
node, so it would be

serial-port {
    w2sg0004 {
        w2sg_vdd: gpio-regulator { enable-gpio =3D <&some_gpio> };
        vdd-supply =3D <&w2sg_vdd>;
    }
}

And at this point you can simply drop the regulator stuff from DT,
since its device internal (and only adds complexity). For other
devices these kind of ressources are also not exposed in DT (e.g.
internal clocks).

> And if there is nothing to hide (the obvious serial interface
> wiring), why describe it at all?
>=20
> Anyways, in my proposal there will be a subnode of the uart, the
> one where it is specified that it should control the regulator of the
> w2sg.
>=20
> Basically, Neil=E2=80=99s proposal already covers this case. His bluetooth
> subnode just controls &vaux4 which turns on power for the w2cbw003
> chip.
>=20
> So for my view it is not really understandable why one uart subnode
> can control a regulator, and the other can=E2=80=99t or shouldn=E2=80=99t=
 and why
> this regulator function can=E2=80=99t be divided from the serial manageme=
nt
> into a regulator driver.
>
> >=20
> > Apart from that this interface is limited in its features. I'm
> > currently working on N900's bluetooth chip. This one needs to set a
> > gpio before data is sent data to the chip, has a reset gpio and
> > a gpio to wakeup the OMAP SoC from idle states to avoid data loss
> > on the UART.
>=20
> Yes, that looks equally complicated to solve if not even more than
> the w2sg chip.
>=20
> But what would you prefer:
>=20
> * extend the drivers/tty/slave/serial-power-manager.c to also cover your
>   special case

I would simply create a new slave driver, which takes care of the
gpios and setups the line discipline.

> * instantiate a drivers/misc/n900-bluetooth-regulator.c and hook it up
>   exactly like the vaux4 of the gta04 bluetooth chip? Just referencing
>   a different regulator node?

The gpios in the n900's case are definitely not regulators. They are
used for waking up a device, not for supplying them with energy.

> [...]

-- Sebastian

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVDFVzAAoJENju1/PIO/qapY8QAIZSuZPB9G+M4HcqL2VDsty3
0qZ8lTormzbCu35YE03tP/ovMc2pBqcTq+QofUr0p0nv+unpMAuDJzhQlYtszVwT
fc9JI4NwT6vbj9efpedRBIPv4kwkPnoQcXtpvEwZWXCt2YyLDcaAl6JxsnZg5toj
J/sNi4U/fKPOFG8XzR01u4zoonh5hhZ0GXn6HbX4XtgtgZaxz7vxxb9RKi9FF1oJ
BXsvBip1oBA9ljZQK4R14BPrnCzy7tRH7Aml0JrsUobmIYewq2Uck6fxPRKM4Fh0
psBtFhNwCAz/LFcoPpR1jXjpG4MgdG0IaqG79zl8uYcU8WMG+eOnVI1pV+7SZQ+0
2KHKFZJG5WREbbCftj2xgRAmyUSELIDNKpVTeX2mFQbn5r7UIQmoj+w/dStKMGzX
33Sba3Ndxhihl9SnXja+Hrprpnq9HzUa/8J9J8RgA1ThHOa50gCa9psrS55jK9vG
hFcklN0ZjsFdqGKjAWvbUo5Dv85C+4u5PvRJdwwOAyeUaPyJSJviYCf+pZIoWD3m
Ev5So0Id/T4ori225lUqLsgMuXupbe/wWa00KwX0rS4kPCr2i8gs8YE0YTnrs+ao
r6wlE7SSR2+G9zABo9ws/W/BMV2PL4WsWxmLZf48BPEH5c6s91c/AOHTJcDlJcGf
UQsWjwLHaxzl+S4BqGwm
=/rsU
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
