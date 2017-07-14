From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/9] regulator: mt6380: Add support for MT6380
Date: Fri, 14 Jul 2017 16:14:39 +0100
Message-ID: <20170714151439.qospwvlxaoo3yauc@sirena.org.uk>
References: <cover.1496425268.git.sean.wang@mediatek.com>
 <4276ab23ae0bbb6a54b1add98c4dc668f1a69c50.1496425268.git.sean.wang@mediatek.com>
 <20170606182224.sifkfod7hehadjvm@sirena.org.uk>
 <1498233365.20651.25.camel@mtkswgap22>
 <20170623161420.tbhn6sjuz7jjhaiu@sirena.org.uk>
 <1498236198.20651.32.camel@mtkswgap22>
 <1500044768.16278.37.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hp2a3qguigil3cxm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1500044768.16278.37.camel@mtkswgap22>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hp2a3qguigil3cxm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 11:06:08PM +0800, Sean Wang wrote:

> We usually want to use /sys/class/regulator/regulator.*/status to get
> actual status from hardware, but if we remove the get_status(), the
> status entry under sysfs would be gone. So could I keep the get_status
> callback in this driver ?

If the device doesn't support physical status readback it shouldn't have
a get_status() callback. =20

--hp2a3qguigil3cxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllo398ACgkQJNaLcl1U
h9Cergf/eMKkWqaydtM212fyr2PcAvhOq989RGyuQ00UtwejpIYDwvxsT7nO3ksH
EeTd2xDBJEcWYQlBTMQcDlu7xsb49PoYYKSddY5aadBWRLf5eClEj5LJVhH0Arcq
cOMjj5w/rmgoByD0QfSAVW1gzESLK1n9ubJDYwgehqApt50W3xbcPuGlVTSNV7Y2
YUYCSxDn+KpwcTG6tcvV4vyvEahtc2Cttg8ZFEycFxKusC4XQN+XpTn612XDW7SF
Lvs76KGgBQUoUTr6n60z5jE860URTmY/75h1dl/oqgAJ3O9dRvaCN3h6usFF99OJ
jXaMz2I+PaZj2FTADb1tmZJIw5ouXw==
=FWnv
-----END PGP SIGNATURE-----

--hp2a3qguigil3cxm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
