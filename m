From: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [Gta04-owner] [PATCH 2/2] misc: add a driver to power on/off
 UART attached devices.
Date: Tue, 23 Dec 2014 14:17:12 +1100
Message-ID: <20141223141712.74941672@notabene.brown>
References: <20141219235827.13943.45713.stgit@notabene.brown>
	<20141220000920.13943.50943.stgit@notabene.brown>
	<CA+Ot1Own-g=vjYhOygzVgNPspw6FgCHZqY8wQo31=ahf62E1gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/U6bHm36iY.Aa7Lm6V=uhK9J"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+Ot1Own-g=vjYhOygzVgNPspw6FgCHZqY8wQo31=ahf62E1gA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christ van Willegen <cvwillegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: List for communicating with real GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/U6bHm36iY.Aa7Lm6V=uhK9J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 20 Dec 2014 17:02:04 +0100 Christ van Willegen <cvwillegen-Re5JQEeQqe8@public.gmane.org=
m>
wrote:

> Hi,
>=20
> One remark:
>=20
> +config SERIAL_POWER_MANAGER
> +       tristate "Power Management controller for serial-attached devices"
> +       depends on TTY && OF
> +       default n
> +       help
> +         Some devices permanently attached via a UART can benefit from
> +         being power-managed when the tty device is openned or closed.
> +         This driver can support several such devices with simple
> +         power requirements such as enabling a regulator.
> +
> +         If in doubt, say 'N'
> +
>=20
> There's a typo: openned.

Thanks - I've fix that now.

NeilBrown

--Sig_/U6bHm36iY.Aa7Lm6V=uhK9J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVJjeuDnsnt1WYoG5AQJdEw/+OyPHCqkMVZjxihrT7ftkBU5cWQINGUyE
wFFJQKwm2Bbs/UEbzmTXMyiPOQVcXoarbBWXq9i86Oad0XaNx7bmIXuMsiXkjW7m
yNTrATs7alWQyT3Q7m0Rw77LO8gAjEWNCnugLizZKzv1zIk70fahQ4mDU6XJU5UD
3Bsml62x/IahfZfWv32cxiWXJzcF6oHFefF5n8yxHqCnNdZjGaDDRyG6mGAvjzbI
4eqZ8mZSfuMlg5G6ioaFB7LYGMoT55vx0YUafgZdsdasB4KVHvAE+iihs1uMEjY+
1AbPYZfvhmXUkaxI/dON5uOHTWNKP+Mj8eZW5/4DQM8CahSErU101V548/hHMT/a
nalwX4irPfPLrWXatSA0ZgLYmmzZGvSJ7RsI5HLQp0JQ8ggbYK6HsvFH4TuSCw12
svflBNwYFt8c5Wlt2L0NMftwOU/P7Dv5e7OpIBW/1Lt08GHOIXY5HtZdW/G0Qa7h
wZwyYgH9+bazV6zbzZD4/oJJiSsTzd0gobO0+63zadnz1sY4xmoskOZEshtuUINQ
O8tneL5hGT4qOaDXXqIYb9keLMgSLx3RhurcA/pH/s2bk+UpZaJM3RTTYcJ6B2qJ
1b9/anQ68F0+6LHi4s/OHgeNTv5RN+VB/+DkMERWDtBCyR5pKF15b4u4EZk5Mprd
Fqf8d/DlfMY=
=6CCR
-----END PGP SIGNATURE-----

--Sig_/U6bHm36iY.Aa7Lm6V=uhK9J--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
