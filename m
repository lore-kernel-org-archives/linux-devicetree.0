From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 04/10] dmaengine: sun6i: Enable
 additional burst lengths/widths on H3
Date: Mon, 18 Sep 2017 10:09:27 +0200
Message-ID: <20170918080927.ghfahn2xwz52hmsx@flea.lan>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <20170917031956.28010-5-stefan.bruens@rwth-aachen.de>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yi6pq3fxiamd3slb"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBOH67XGQKGQEEUYSTLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170917031956.28010-5-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yi6pq3fxiamd3slb
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 17, 2017 at 05:19:50AM +0200, Stefan Br=C3=BCns wrote:
> The H3 supports bursts lengths of 1, 4, 8 and 16 transfers, each with
> a width of 1, 2, 4 or 8 bytes.
>=20
> The register value for the the width is log2-encoded, change the
> conversion function to provide the correct value for width =3D=3D 8.
>=20
> Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--yi6pq3fxiamd3slb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZv383AAoJEBx+YmzsjxAgiYEQAIUate2SUMU7+uPJtMQE+Q1x
9vDTGXMsuIT+BoOw8CTaYO5iciNfSGLvHpl+nh8hr2Fw1Cn+Pz12Ss1gwO5YeYbc
yEkNcmPArL3+pGYeFFPkWAEWRPa6gIJZ2VIxBhKo5JOt9bC7POaEypt07RUVT5M9
aIYxVA6/oncQ3KaBp5jYNntPGE9HwuBI73vgI/poOhybqPy9zZqZbzqG49e1WQ5i
jt3MBaYvFIgGj3p5bKef0ozu1GAbq9ucbPOjmShSJJxhMZj6+hRUW4oeuegNY7EG
l7hKEJh4iIIIwtAs+r0tyeNhv93xY90vfRlZzsBiq+g+ojQThAkGIONUcZ0qK5B5
0qQsWx+iN721M+KrIHe+qW+GfW8Z5bOmRmUwcTUBFqjIPNMr89u5jhYJJdjuSGs6
aZ2VcZpseIZ/Rm8MrAanIgvVMYbJvAYjrR0guAhM3Hjp6hXG6lMYFcTQVOrVnhbk
NIZ8OankKb4m+Am4CTppm9/jgrcnVWi/oYhyRM4wrtKGvdKKzJO/0Xq5UcFenRCi
Lap96eXxegI4DLbcmd6vtRJWS3IOSBDju4U6AMXb6JsmIegf9+pXrVQA0jlA0mdu
WJpaCmFItYNZat08W6jfpu3sUvD1/ub8dSIrZofvE/s1J65BcXlFhQZWycBk7Sq8
mvl8cnD4RsjeILjz3M0g
=E0Sp
-----END PGP SIGNATURE-----

--yi6pq3fxiamd3slb--
