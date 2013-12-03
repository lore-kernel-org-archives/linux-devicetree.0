From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: lis302 DT binding for Nokia N900
Date: Tue, 3 Dec 2013 13:21:01 +0100
Message-ID: <20131203122059.GB4653@earth.universe>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

The lis302 has already a DT binding described in [0],
which descibes misc. hardware properties. The problem
is, that the Nokia N900 needs negative values for some
of the properties, which seem to be unsupported by DT.
The following values would be needed for the N900 (taken
=66rom board code):

st,axis-x =3D <1>;  /* LIS3_DEV_X */
st,axis-y =3D <-2>; /* LIS3_INV_DEV_Y */
st,axis-z =3D <-3>; /* LIS3_INV_DEV_Z */

st,min-limit-x =3D <-32>;
st,min-limit-y =3D <3>;
st,min-limit-z =3D <3>;

st,max-limit-x =3D <-3>;
st,max-limit-y =3D <32>;
st,max-limit-z =3D <32>;

Can you please tell me how to setup the properties correctly?

[0] Documentation/devicetree/bindings/misc/lis302.txt

-- Sebastian

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBCAAGBQJSncyqAAoJENju1/PIO/qabTwP/2HPTAsPYKEKZpgwmM9qxebP
r+yTenzdygSzy9gLXD8SrE7P60VjJnNp5hFFibGb4wWvVmaexyhZuAj7H1bV6zAs
ESxliIww4Pi04+R4uBMvaZC3nwKI3nz6IaS4GX3lBFKDk4yXEBtNgaRSe0iXdWXK
Lc5/o4dqDr8UPQMGHXqFPAQWVgFCTd71uvJbqYw/hjVdh6JM7TOuI/J3aoW4479x
NNgWHVVnM5yiIVrJ4Qol0BjmZQCVILxhx9PcF86TmUqz3gl8bsFJyGB3nljg6is5
JCuW8opTiSat0Il3/jMvK/tOqc/EUHO8L5+L1J7ZshvBEUUpuWP1Dwz7Sp8efT0f
zBs/fSG+ZV9RjwGr+kuVwcWxA7zz2zdaU5otCJoEZ+o1yTRIVxp5ZcHFDuJ21JFl
n8pmuvKUcKQYy28ZX3FJu6HkzrQG8C6cuutljFGRx7mKkdKSZKig2OClFry5hX4J
xqAcQPF71sRsyzmMO/CMu9HY0dybILeuaVvxWzyZFWq9a34oaSuLxbz/pQY3o5TV
nRU+Xqq0Ic5euRkqvFunhL2gFiDvcGCs7qsE/EZOxJ9IjafQQnMiBHPv6F2yzGTC
GDaghz39nUKozOg6cfa1ECiD5/2Qhyn1zT1+RqCuiY6bgwV+TgkHUBYokoCsVIcQ
pQJB4GfHtf8EW0A1Eq9e
=yg9d
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
