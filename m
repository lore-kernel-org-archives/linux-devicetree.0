From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Tue, 24 Apr 2018 22:13:19 +0200
Message-ID: <20180424201318.GA14390@amd>
References: <20180424163458.11947-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180424163458.11947-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This series adds a new subsystem for GNSS receivers (e.g. GPS
> receivers).

Actually... I'd just call it GPS subsystem. Yes, GPS is a bit
misleading, but so is GNSS. We'd like Loran to use similar interface,
right? We'd like to QZSS to use similar interface, too...

https://www.pcworld.com/article/205325/japan_launches_its_first_gps_satelli=
te.html
=2E QZSS is not _global_ positioning system. Still they call it GPS. I'd
call it GPS too.

(Alternatively, we could have drivers/position and /dev/pos0...)

Looking closer... I'm not sure if it makes sense to push different
protocols (SiRF, NMEA, ...) through one device. Userland should know
what protocol to expect... Yes, there will be common code between
/dev/nmea0 and /dev/sirf0...

I don't know. I'd really like to see '/dev/input/event0'-like layer,
so that userland would not need to know about different protocols. But
your work solves some problems we have now...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlrfj94ACgkQMOfwapXb+vID3wCfaYeCgIwFkq8aiao6DhY5zrPh
2+QAoL9evS+5bkUhFLJOsItcsQ2fpDAh
=x62g
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
