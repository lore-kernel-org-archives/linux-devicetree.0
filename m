From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] mfd: max14577: Add max14577 MFD driver core
Date: Thu, 14 Nov 2013 10:24:19 +0000
Message-ID: <20131114102419.GE26614@sirena.org.uk>
References: <1384328457-5147-1-git-send-email-k.kozlowski@samsung.com>
 <1384328457-5147-2-git-send-email-k.kozlowski@samsung.com>
 <20131113131328.GF878@sirena.org.uk>
 <CAH9JG2U9VDnRW9JZ7j7OyRmVhSXWJ5Yp_gNqUPK=xCST7SY=xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EgVrEAR5UttbsTXg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAH9JG2U9VDnRW9JZ7j7OyRmVhSXWJ5Yp_gNqUPK=xCST7SY=xg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyungmin Park <kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--EgVrEAR5UttbsTXg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 14, 2013 at 10:33:22AM +0900, Kyungmin Park wrote:
> On Wed, Nov 13, 2013 at 10:13 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > Are you *positive* this is a falling triggered IRQ?  All the code to do
> > with spinning reading the GPIO state during handling makes it look like
> > this is in fact an active low interrupt and a lot of the code in here is
> > working around trying to handle that as the wrong kind of IRQ.

> It's not work with level triggering. as wm8994, it requires edge
> triggering. previous time I send RFC patch to handle edge triggering
> at regmap.

No, wm8994 is level triggered only - the edge triggering stuff there is
to work around some SoCs that could only support edge triggering and not
level triggering.  Is this a similar issue or is there something else
going on, what's the differeence with a level triggered scheme?

> >> +static int __init max14577_i2c_init(void)
> >> +{
> >> +     return i2c_add_driver(&max14577_i2c_driver);
> >> +}
> >> +subsys_initcall(max14577_i2c_init);

> > Why not module_i2c_driver?

> there's ordering issue, it should provide regulator which is used
> others before USB probe. if not, it failed to use USB.
> Other PMICs use also subsys_initcall for this reason.

Modern systems should be able to use deferred probing to resolve these
dependencies, subsys_initcall() is mostly there for legacy reasons and
new systems ought to be able to move away from it.

--EgVrEAR5UttbsTXg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJShKTQAAoJELSic+t+oim9sXwP/3Ciaj6wWtzmt1TEQMOaI4iV
XkCLNoGLC4+sr+75gTI/BwP4K3l0c1D+r4awlcrV3UTDul7EXhPm1IGtm7dVH2LJ
cBH+VS8NgkDhJjT/SKHv+Yjd/yBY9SGxMf4bkE/FbZdA+znHpI5tS/Pirv9ftnvi
IZCnC2lygoiqJxjLWLO7l/nqkDUiBIYv6OaY0iNbghg2QUFE4M+uA+I+lqfVSvEO
6pYCzVxe2akjly3Yxb0lFmTncTATSWQ+pHBmHc0yHAetMzqohWS27/4kzMEgtbkM
Qd2mkN5t9wudu0X1/WIqhXCFNvkgJzFJuG2Le+AXTgzN1NPuPzBTpoIT9oUXWVd4
CSbZ9Sn2eHG5KrGMIULt6XoG+jOlHC/6LiBYB9isSCfzzj+7BH5VjtbyBUX85bI8
Cfy2o2Gpiolhrn1pEFUHDoKHRiLOno2I1zlr236BdLQ3SKBNdm5TpKlprJvh0yy2
dg0JMw9HkA67l3oU4m7MG2ZTUUnaptQd3TEp8gJy5rHlNUGRB/dLKc7xS9abagy2
ObkM2Q05ss+2pfAEx/uKVt6iLTuG63E90atA5mqQNwMr5kyP1az6dC1yviUjMbec
e/gBYqjlcHD5NS4ez9RrmQybNbN43txvJZfAvrsSy6JhQpRruh4BcduEvaERL9BJ
9fs58/uLl5R4bn/BxBeb
=dgL7
-----END PGP SIGNATURE-----

--EgVrEAR5UttbsTXg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
