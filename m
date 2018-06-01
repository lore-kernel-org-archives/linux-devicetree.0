From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 0/8] gnss: add new GNSS subsystem
Date: Fri, 1 Jun 2018 11:33:11 +0200
Message-ID: <20180601093311.GA31639@amd>
References: <20180601082259.17563-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180601082259.17563-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Marcel Holtmann <marcel@holtmann.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This series adds a new subsystem for GNSS receivers (e.g. GPS
> receivers).
>=20
> While GNSS receivers are typically accessed using a UART interface they
> often also support other I/O interfaces such as I2C, SPI and USB, while
> yet other devices use iomem or even some form of remote-processor
> messaging (rpmsg).
>=20
> The new GNSS subsystem abstracts the underlying interface and provides a
> new "gnss" class type, which exposes a character-device interface (e.g.
> /dev/gnss0) to user space. This allows GNSS receivers to have a
> representation in the Linux device model, something which is important
> not least for power management purposes and which also allows for easy
> detection and identification of GNSS devices.
>=20
> Note that the character-device interface provides raw access to whatever
> protocol the receiver is (currently) using, such as NMEA 0183, UBX or
> SiRF Binary. These protocols are expected to be continued to be handled
> by user space for the time being, even if some hybrid solutions are also
> conceivable (e.g. to have kernel drivers issue management commands).

So.. while you did good work on serial power management, this is
grossly misnamed. There's nothing GNSS specific in the code, and you
are not presenting consistent interface to the userland.

This is _not_ GNSS subsystem. This is serial power management
subsystem, or something like that. GPS/GNSS subsystem will need to be
built on top of this.

This will never handle devices like Nokia N900, where GPS is connected
over netlink.

> Another possible extension is to add generic 1PPS support.

And there's nothing GNSS specific in the patches.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlsREtcACgkQMOfwapXb+vLGZQCfXV8ML69UM59a7/UJ8YKGzNBp
3C8Aniq+RbMLh3WlvmdTTjzU8spc54ps
=tkXS
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
