From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Fri, 4 May 2018 22:03:15 +0200
Message-ID: <20180504200315.GA22519@amd>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180504132741.brn5jqv5ufjhp7ky@earth.universe>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180504132741.brn5jqv5ufjhp7ky@earth.universe>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Finally, note that documentation (including kerneldoc) remains to be
> > written, but hopefully this will not hinder review given that the
> > current interfaces are fairly self-describing.
>=20
> Great work. I like your design decisions. I have quite a few devices
> with have non-serial based GPS peripherals using binary protocols (*).
> As far as I can see it should be possible to add support for those.
>=20
> I have one concern, though. While providing raw data by
> default is fine generally, it is a problem with device
> auto-discovery. I think there should be some IOCTL from
> the start, that can be used to inform userspace about
> the raw protocol being used (i.e. "NMEA"). I fear, that
> userspace may start to just assume raw =3D NMEA without
> having this (especially since all initial drivers provide
> NMEA).

Yep, that would be nice.

> (*) I have those in mind:
>=20
> Nokia N900: The phone has GPS integrated into the modem and uses
> ISI encapsulated data. The protocol has been reverse engineered
> and it should be possible to write a kernel driver for handling
> the GPS packets and dumping the raw data to /dev/gnss0. I don't
> think this is particularly useful without a non-raw interface,
> though. It would still require a custom userspace implementation.

Actually... in this case it would be nice to do the protocol
processing in kernel and just present reasonable interface to
userland... or maybe NMEA.

> Droid 4: GPS is similar to N900, but different protocol and QMI
> encapsulated. This one also has known protocol with userspace
> implementation. I did not yet have a detailed look, if its possible
> to (un)wrap this in the kernel.

So, this is actually NMEA over QMI. I do have patches libqmi that
provides NMEA on stdout.

But there seems to be another possibile interface (yes, that modem is
crazy, and you can talk to it over few different interfaces), and
that's NMEA over GSM07.10. That one should be feasible to decode in
kernel and just provide NMEA to userland.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlrsvIMACgkQMOfwapXb+vKWzQCfZOPNaj3pxEakhZzPJGSdPibB
rWIAnirElFj5ptHna9t3I53DqNtFUjbQ
=P8q2
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
