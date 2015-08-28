From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Fri, 28 Aug 2015 19:33:46 +0100
Message-ID: <20150828183346.GV12027@sirena.org.uk>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
 <20150828101227.GD31748@leverpostej>
 <CAPiN7iV6LF6LtatzCQ5H6Nq=WivE+e4Z1OsA5cArkEZKqwPLBQ@mail.gmail.com>
 <20150828175742.GG31748@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b6rSbt24+kIAbQdu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150828175742.GG31748@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--b6rSbt24+kIAbQdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2015 at 06:57:42PM +0100, Mark Rutland wrote:

> Generally, users may have reasons to want to fiddle with GPIOs (or other
> resources) that were not intended for their use at hardware design time
> or DTB creation time, in much the same way as they might want to fiddle
> with /dev/mem. Which is one reason I believe that this is a policy
> issue.

This should hopefully be very much in the debugging category (like
/dev/mem is) though.

--b6rSbt24+kIAbQdu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV4KmJAAoJECTWi3JdVIfQMUEH+gKmWAqduQCmsNrhRtE8sDU9
Qw4RCsomO8GvdbXuHtBBViV1v5FIMLQUaV3FtBXNeuf/JdhRl8wDs/bgJ5B6A6fX
vyjdIecPdYww4lE1fR+IkG88Lj/Cf8nTEeuPgkQgKD8lQLMh/FbbjSxrxntVDpgc
9c098v9iANj9Mu7L4LBmuWS4JpjGftEe6BH/AEdUz2HHu2N8Tj8yvMxsIMSYuaPA
AqDHq5zWiHNoqHquZivRHZRIZVXEZ8X6rLsZgzbNRnWlC+VxT/HbXj1vGKAdCaSB
k+FJJ4yQ+aznWd7C95QMsPIqRyCNCP/fkvGNIbDxYsWljYglBroQPOMWFFwi0FM=
=KKeb
-----END PGP SIGNATURE-----

--b6rSbt24+kIAbQdu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
