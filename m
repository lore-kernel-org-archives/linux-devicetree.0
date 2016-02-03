From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] regulator: act8945a: add regulator driver for
 ACT8945A
Date: Wed, 3 Feb 2016 17:47:53 +0000
Message-ID: <20160203174753.GJ4455@sirena.org.uk>
References: <1453863463-30515-1-git-send-email-wenyou.yang@atmel.com>
 <1453863463-30515-2-git-send-email-wenyou.yang@atmel.com>
 <20160129001603.GM4130@sirena.org.uk>
 <B256D81BAE5131468A838E5D7A243641D63FBF8B@penmbx01>
 <20160129113518.GQ4130@sirena.org.uk>
 <CABxcv=kNKmgRytxB5ppawrAvC-GDRhV4T_UUGvpHgKp9+BsUmQ@mail.gmail.com>
 <B256D81BAE5131468A838E5D7A243641D63FE2C7@penmbx01>
 <CABxcv=nJsWEv9KW-5iPpUnyN8ZVpx6CV07gBRaLNWqd644YOqQ@mail.gmail.com>
 <B256D81BAE5131468A838E5D7A243641D64026CB@penmbx01>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KCBbHYs95wY/7dOt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <B256D81BAE5131468A838E5D7A243641D64026CB@penmbx01>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Korsgaard <jacmet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--KCBbHYs95wY/7dOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 03, 2016 at 02:33:11AM +0000, Yang, Wenyou wrote:

> > I would just remove the "active-semi,act8945a-regulator" node and make "active-
> > semi,vsel-high" a property of the "active-semi,act8945a" node.
> > That way you can remove the mfd cell .of_compatible and OF table in the
> > regulator driver and read the "active-semi,vsel-high" using the platform device's
> > parent of_node.

> > But it's better if you wait for Mark's opinions before re-spining your patches.

> Hi Mark, what is your opinions?

Like Javier says you should make your DT binding look like the DT
bindings for other MFDs and not use of_compatible.

--KCBbHYs95wY/7dOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWsj1IAAoJECTWi3JdVIfQMdQH/j0NYzOJ2v9+G9LjVcvUoJXq
d0QDzmlrwO/J9DCqEsx6Opb4/d5os+vpU0QefBIpyYjCEw/MPxtmvatQ6H/Aruh5
uC6ZW6lt+N4VuHs0dDzWsUzj0yDTM4kDyYvdpMKuZULOghvRzgfskDTd2O9XE0tm
BhDBHQ7DgYG04GWvrWYgNOEn7osIYbi2trIn6OvK21J/vtg7Wfke3hY48LSBStAX
yQd0AS878BVfsnvecCLDMPwddaezVigKYok8zM5f2OkStI5NfyeSxY8Ty2oM5S6b
xavNbzxx/595JXBraKwW0NxJ6IfTEh0wZZRjrr51U37uDcYgfsx6UsBLCJHICF4=
=5o0o
-----END PGP SIGNATURE-----

--KCBbHYs95wY/7dOt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
