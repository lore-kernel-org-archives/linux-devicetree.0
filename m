From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun6i: hummingbird: Add aliases for rtc
 devices
Date: Thu, 1 Oct 2015 14:56:43 +0200
Message-ID: <20151001125643.GI7104@lukather>
References: <1443703709-24835-1-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PoUpPrJlcBv0qM6G"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443703709-24835-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--PoUpPrJlcBv0qM6G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2015 at 08:48:29PM +0800, Chen-Yu Tsai wrote:
> The hummingbird A31 has 2 rtc devices available: one in the SoC,
> and a pcf8563 external rtc on i2c2.
>=20
> For some unknown reason, the onboard backup battery alone can not
> supply enough power to the internal rtc. When external power is
> removed, the internal rtc would reset. Hence we want to use the
> external one by default.
>=20
> Add aliases for the rtc devices with the external one as rtc0.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Ordered the aliases alphabetically, and applied. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--PoUpPrJlcBv0qM6G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDS2LAAoJEBx+YmzsjxAg/CQP/2P8d/oAYEgDPrvmALBx49T9
ojEJAZvee7cQ9RATu6MZuuXrQ0M+nRgpxUNf5UefxTco0iSnkvTfvdL0rJoarSyr
lttwvor2d0XtuuDsoAIQwKgN6A3Pza1lrFmmrX9QiJUumAuwwMD9+nE1Msw043qq
ODrVI0Hin6Hufm2cxzeNS15ZTNJ8FetdJ4tQ7MTAwBXh3e9jkFOz0J42vhFKAyZM
BUEbRx+Frxm+O6nJNy8B/1dfankftL0Zidwn2TQClMPSETnLIZyRgRzpN+iJFYgv
NCz8xfJr5lu0SnvFljsk///+OMJ6QzKPyySPj2E0SG31Rq0lseNQ4TGBH0wqDczE
4rNPWtyjcMwtlerdRTPucbVVj+Ax2m0szOEaJXd1DoweTJkkULo5BHjDLxcIgTD5
WT0MLU8ERw5FEiM7xlIaoH/FKlq1dZqv7TwRRyqkK+1a6kvBuhy3KmmNz/KoypY/
c1FlY0znK2mQN6kLRll+lyZouPMPvLydnXA/m0oagSihD2oFOSjAOPu39d8n3irn
R2FSg1QbXHMDdWBKzYo3EeTiJmuwXV9pUm6abzIb74bp7xmrZrp2RjRsUGBoMNA6
zWnYjpMXkqw2yYRQYWjAWU0Ss5JKEoYHOSuLHrFJBZR/V8ZR3sg9Hai3PkSR3KqW
tw3QmnRjrklodjcii0tz
=7zzu
-----END PGP SIGNATURE-----

--PoUpPrJlcBv0qM6G--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
