From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/1] ARM: dts: orange-pi-zero: add node for SPI NOR
Date: Mon, 29 May 2017 10:30:15 +0200
Message-ID: <20170529083015.64kwhnzz7wh6d36g@flea.lan>
References: <20170528103026.6396-1-geomatsi@gmail.com>
 <20170528103026.6396-2-geomatsi@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="j6fgvwf5lkez4bsz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170528103026.6396-2-geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--j6fgvwf5lkez4bsz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 28, 2017 at 01:30:26PM +0300, Sergey Matyukevich wrote:
> Add node for SPI NOR flash on orange-pi-zero board. Disable this node
> by default and leave it to users to enable it if their board has
> SPI NOR flash chip populated.
>=20
> SPI NOR flash was optional in the first production batch in Dec 2016.
> In later batches flash chip was pre-populated. However there should
> be quite a few boards around which do not have flash chip.
>=20
> Signed-off-by: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Merged, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--j6fgvwf5lkez4bsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZK9wXAAoJEBx+YmzsjxAgzEwP/1kkjG5rPv+wON0tuXR4NXs5
8t3PQP3Lc2C4E6OIoQhI31ADMjU5PpQfkALSj1GAtRNUOh0rERGmI4+kasWmPsVm
zKpHcAWC1JYxTJnkBlfadAvzqGEQvzPOCkHGoR3jLtiWLY8LzVLZb+1ehUtf50iV
xNS9RXq6r0l30dFXMrUn6GOlkkhKTihL1dKn1DtsgQILusJYbkaPPRfVO2BvMCG1
EQVvB1yoX2oAwfI2FyAbTuxZU0nSe0QN0c2jlXXWCff5cR5nNBFCnr3aqBKDTLre
2VX1yztZRMmr93+3TsWqKCti0JKbstO0f3/FvtIUWMqEb64d4WeMVB9Fa5BtGrtX
+fZ/filejS/7cXLbVdWhNMAwPphK1QMfNaj38s4fy8QyyXSLpd+5Jwzwt+/3MzgV
PvnzjWmIJln8W1yMkmD5g9syiDZFmh+aR5UMuQ+hs11sxG80UK0vmfAVUmoQ+m/x
NwMDGSlvNk1SyXXzpmUb8X2kDPrc9goGJOegDT6q4BqmCBKiwKRaJi82YliwNuL+
tDjyDZA+365eu1SGERPLz9pybEVP/YaLQJvut+9+WS/CzLkIME6hr5DTTiB99wdR
ob6gFXQdembeTFs+lPeRSNdVQP3r99cXexJZYfh+ig2J5iW7NrwC8o9QgwJcTJyg
B/zXS30gOJbxPAZCPhcz
=fkF+
-----END PGP SIGNATURE-----

--j6fgvwf5lkez4bsz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
