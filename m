From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Sat, 5 May 2018 19:28:47 +0200
Message-ID: <20180505172847.qqpqkrfspak53sc6@earth.universe>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180504132741.brn5jqv5ufjhp7ky@earth.universe>
 <20180504200315.GA22519@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ts2uoe7ucxqgk6a5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180504200315.GA22519@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ts2uoe7ucxqgk6a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 04, 2018 at 10:03:15PM +0200, Pavel Machek wrote:
> > > Finally, note that documentation (including kerneldoc) remains to be
> > > written, but hopefully this will not hinder review given that the
> > > current interfaces are fairly self-describing.
> >=20
> > Great work. I like your design decisions. I have quite a few devices
> > with have non-serial based GPS peripherals using binary protocols (*).
> > As far as I can see it should be possible to add support for those.
> >=20
> > I have one concern, though. While providing raw data by
> > default is fine generally, it is a problem with device
> > auto-discovery. I think there should be some IOCTL from
> > the start, that can be used to inform userspace about
> > the raw protocol being used (i.e. "NMEA"). I fear, that
> > userspace may start to just assume raw =3D NMEA without
> > having this (especially since all initial drivers provide
> > NMEA).
>=20
> Yep, that would be nice.
>=20
> > (*) I have those in mind:
> >=20
> > Nokia N900: The phone has GPS integrated into the modem and uses
> > ISI encapsulated data. The protocol has been reverse engineered
> > and it should be possible to write a kernel driver for handling
> > the GPS packets and dumping the raw data to /dev/gnss0. I don't
> > think this is particularly useful without a non-raw interface,
> > though. It would still require a custom userspace implementation.
>=20
> Actually... in this case it would be nice to do the protocol
> processing in kernel and just present reasonable interface to
> userland... or maybe NMEA.

Converting a binary protocol to NMEA, which needs to be string
parsed is not very nice. I think first step would be to write a
simple driver, which exposes the binary location protocol without
ISI header. Then in a second step we can think about a reasonable
interface, that should be supported by all GNSS devices.

> > Droid 4: GPS is similar to N900, but different protocol and QMI
> > encapsulated. This one also has known protocol with userspace
> > implementation. I did not yet have a detailed look, if its possible
> > to (un)wrap this in the kernel.
>=20
> So, this is actually NMEA over QMI. I do have patches libqmi that
> provides NMEA on stdout.

Ok. So raw data is NMEA for this one. Should be reasonably easy to
write a driver exposing this via /dev/gnss device.

> But there seems to be another possibile interface (yes, that modem is
> crazy, and you can talk to it over few different interfaces), and
> that's NMEA over GSM07.10. That one should be feasible to decode in
> kernel and just provide NMEA to userland.

I think both should be feasible. I suggest to wait a bit more
until you and Tony figured out some more details. You've got
the libqmi patch as workaround for now and we want a stable API
later.

-- Sebastian

--ts2uoe7ucxqgk6a5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlrt6cgACgkQ2O7X88g7
+po/xxAAjXWthR4LgPwNVOs7jNQYrC7h4Rq8gERycjd3oVL6v5/S4WRgcHX5qUGZ
uwANDkqzJjb9boIjASHtp/mDzzDl3mbQzVv9CP17S/4utdhzZAvFtmSfqdX8tawz
Yabd0W4sE+nBr1TNAfnasXFfJk9L4VEfpxA6Nl0ujC+Nib6J2Nrud9YxvHMDHT1e
FC8YMPQYiL1a9NJJMTYsoRpRl9QDiE9SXBj0GOASu5nCrvfoTDBh6AoJaIxcZMuQ
gk9o0LrNsAm/bg0QcOdOoq/cnLNlBnl2UgOAmZg7Aie0oGRiVc9ZspCfoVtILVjB
Vvwjl16irKnmddmObb2+6RWI5vXiE71GkUXf5DM8CKDzYY6MtrlMWbQ942LoumBm
2+jLTk14lpE0I+GLPg6CKum94TKwiuxxgXis3cCd7JdYAImrGaIkM+7I/JAKLGe5
9BSP+rnbWZDCmZnUNAiwfMMRL9eOJy1L8Riofc/d0OFa4P7qzUzuQWM6JAdJGTE+
/ouF4ajGVHGosytGgla4avymaq+WxuezIkuzfl3ukOQ3vghq43TW1qnnG7ARPuKx
F8cy+dtJr+CCkbJnf0APkDFf9MtG44jOEhLv5Zn4mOm46w/dbalyjyNJUMOoDp+c
vGOO1M2My2iDvBOfMMk+QUiBEPB4F0kq4hc2Hq406xeeI1/bI/A=
=1zS9
-----END PGP SIGNATURE-----

--ts2uoe7ucxqgk6a5--
