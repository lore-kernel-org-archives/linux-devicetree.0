From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Wed, 25 Apr 2018 08:26:59 +0200
Message-ID: <20180425062659.GA5352@amd>
References: <20180424163458.11947-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180424163458.11947-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--k1lZvvs/B4yU6o8G
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
>    =20
> The new GNSS subsystem abstracts the underlying interface and provides a
> new "gnss" class type, which exposes a character-device interface (e.g.
> /dev/gnss0) to user space. This allows GNSS receivers to have a
> representation in the Linux device model, something which is important
> not least for power management purposes and which also allows for easy
> detection and (eventually) identification of GNSS devices.

Actually... no, what you done is not GNSS subsystem. It is generic
subsystem for a link + some controls, typically for power.

Yes, that setup is common for GPS receivers, but it is there also for
modems (droid 4: usb + gpios) and bluetooth dongles (n900: serial +
gpios).

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlrgH7MACgkQMOfwapXb+vJM3QCfaB/TsM5fW9gWR+P8iDcIFSo5
9CAAn3AWDODk1U2XVOxgTGPJ/ruOiMyv
=apkP
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
