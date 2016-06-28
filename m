From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: sun7i: Add BCM53125 switch nodes to the
 lamobo-r1 board
Date: Tue, 28 Jun 2016 23:24:36 +0200
Message-ID: <20160628212436.GH5550@lukather>
References: <1467074756-8402-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7J16OGEJ/mt06A90"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467074756-8402-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7J16OGEJ/mt06A90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 05:45:56PM -0700, Florian Fainelli wrote:
> Now that we have a proper binding for Ethernet switches hanging off
> different buses, and a driver for the BCM53125 switch, add its Device
> Tree as a child MDIO node, at MDIO address 30 (Broadcom pseudo-PHY
> address) and describe the ports layout of the Lamobo R1 board.
>=20
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--7J16OGEJ/mt06A90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcusUAAoJEBx+YmzsjxAgxukP/ifWt/PzlqDsCN7inmegMFn8
GFZPCtpSDl9eLZz4+wyQ5PMmgoxEDYfmGPVnwJ4g0nHzTMeyZrs0X/hz9pi9PVLv
yJJzhbhFZq+TDyOTwupKKAc5Nig534HM9Rh5JVhCnkoRdr1SxG1iEqtgHhYKcI/O
tEGkogifWb9bgN30cY5qSz1Q6J9MBPbtCEbLOAeLRfvdQNl7GHa4lai46Afya8Cn
uhbSkLjT404pvs8p3bs7MwhzSmLD4kIbV0tHSpsWXytPEs7OudsPF8RMDhTuVi4G
XJDYluRPlBm14RsnitBvDsBGyj3p0pNW+4XiUheUZOkS2Brtt+UVcfZjyVxseZWA
5XhqLxO2FXah8UE7GosPs1ysvuUR9P/rzvtltxZ0cHdWhO7axa0qm9brLoS1Rbsm
xbH0tSzu9DG7CzE8RNWW3MlEUvN+J+VBgQUjIwtqW2tPsbSJHbIznU5yPFUZi5iX
boC80kzBNUmOqNqobmriy28dOpyJRrC0NHxDyFenSbJnJRMkSjs6PpUwNVKiVYSR
3jvCac3Ybe7wcHwfOZM/ozd40fdzNrXzgilUEppmJfmUSazjOuSa3tuW4Of+tKDy
PgT+DgEnblSnCokB4mPJEqvXsirW4cf+zxZ14K1EV1wTNHuSSET2JnqLDNs2khuf
UmFChgqCymYouGe5UUNx
=AxCo
-----END PGP SIGNATURE-----

--7J16OGEJ/mt06A90--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
