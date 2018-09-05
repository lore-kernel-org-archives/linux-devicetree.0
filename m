From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v8 4/8] media: platform: Add Cedrus VPU
 decoder driver
Date: Wed, 05 Sep 2018 17:49:31 +0200
Message-ID: <383bf546272ac7edca5a5f502fce4cafa88a3321.camel@paulk.fr>
References: <20180828073424.30247-1-paul.kocialkowski@bootlin.com>
	 <20180828073424.30247-5-paul.kocialkowski@bootlin.com>
	 <f15e355ece0b250a252347ec22f1433dd786bb5b.camel@collabora.com>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-KFmJeFVy/fWfX39GUA0U"
Return-path: <linux-sunxi+bncBC75HK6WUAEBBHHWX7OAKGQEFAZILIA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <f15e355ece0b250a252347ec22f1433dd786bb5b.camel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-KFmJeFVy/fWfX39GUA0U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 28 ao=C3=BBt 2018 =C3=A0 22:08 -0300, Ezequiel Garcia a =C3=A9crit=
 :
> On Tue, 2018-08-28 at 09:34 +0200, Paul Kocialkowski wrote:
> > +static const struct v4l2_m2m_ops cedrus_m2m_ops =3D {
> > +	.device_run	=3D cedrus_device_run,
> > +	.job_abort	=3D cedrus_job_abort,
> > +};
> > +
>=20
> I think you can get rid of this .job_abort. It should
> simplify your .device_run quite a bit.
>=20
> .job_abort is optional now since
> 5525b8314389a0c558d15464e86f438974b94e32.

Alright, I will probably do that for the next revision, since it seems
that there is no particular downside to removing it.

Thanks,

Paul

> Regards,
> Ezequiel

--=20
Developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--=-KFmJeFVy/fWfX39GUA0U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAluP+wsACgkQhP3B6o/u
lQwr5RAAhwkjVt4DncAUciQMMQNfX7Fl3XQ0nmjsszYqQCr1FVFtXRwMuU8+hkPF
WlMFw1yVWTz3dfh/KZfP+5V568FO4L+NkDvPvCp6hkhh3RbjRnuGrzzOFcpcdNYT
VsJzUJyPOXeQnh4bpHy1PVRiw1b2jHXF9q4kLn1p1fpGABvn6aJZ7lKRtsGnyFwx
2Q4TGfFcenNrTdV9ftdw4CZg7wxThOvS5gUz8FNud4BccX6vDqns8guITvRHFHTR
6vi+8FtvB4Sq/yYnv3Mw8Q700uD5GNgjDSjfp3KzvCOfipYdZmQTcI4cNfSifZbi
R0RdwThMZmmKikZ8k1H5OJ1mOfzvA1YB21siQireV4yFTWf1R/S90yRz0Wpf9OaR
SAG1NSGpj7pQp5daZcQpGCN3SfjXG/sOlie5GptOx3g7QilEWXMyLQUdrej50oG9
7weQUjQOJsUb9aXiOA2wg4VXR3kqGlR6sVcZLaa1uat57JcedA9e3CgTdMaNaPCD
VLHPOa7vCfuvsCw8hzgNIshIfdJni6t0KoiTcy3z4FFBsVqt3zobEtNx50qulMt8
0p+TzGI50OtvrFibLWJjYG+D8Ujkg3AI7SzDk20KQhj28MLQ2/gAtDu8acK32b5e
QMqyCzfkSsGyhCS2EBMg1lxXiV1cYhAPfw3jIpH7rCEa9Ud11Q8=
=wYAK
-----END PGP SIGNATURE-----

--=-KFmJeFVy/fWfX39GUA0U--
