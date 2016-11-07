From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH v2 1/6] pinctrl-aspeed-g5: Never set SCU90[6]
Date: Tue, 08 Nov 2016 09:12:00 +1030
Message-ID: <1478558520.6206.4.camel@aj.id.au>
References: <1478097481-14895-1-git-send-email-andrew@aj.id.au>
         <1478097481-14895-2-git-send-email-andrew@aj.id.au>
         <CACPK8Xcbv5VjE9deETV6zC4cPSfeBSgP96QYqV_ebAgtB9Jwtw@mail.gmail.com>
         <CACRpkdbH8eubEHwHCsdJsmqVp3hkBW4vb5DCHvJxz+tyfFqbKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-Z/xRCEM9XY+M6QxYiCB8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbH8eubEHwHCsdJsmqVp3hkBW4vb5DCHvJxz+tyfFqbKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-Z/xRCEM9XY+M6QxYiCB8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-11-07 at 10:34 +0100, Linus Walleij wrote:
> > On Thu, Nov 3, 2016 at 11:59 PM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
>=20
> > In the future I think we should send fixes separately from the rest of
> > the series, so it's clear to Linus where we expect patches to end up.
> >=20
> > Perhaps Linus can share his preference with us?
>=20
> Just make it clear to me where the patch is headed, if it is
> a fix or a new feature.
>=20
> Also mixing stuff in big series is of course problematic because
> all the CC:in on MFD patches and whatnot that I don't apply
> makes the picture blurry, but sometimes it is anyways needed
> for context so it is a soft requirement.

Context was my concern here and I would otherwise have split the rest
of the patches along mfd/pinctrl boundaries. I felt the situation was
odd enough to warrant presenting the full picture.

Andrew

>=20
> Yours,
> Linus Walleij
--=-Z/xRCEM9XY+M6QxYiCB8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYIQM4AAoJEJ0dnzgO5LT51TMP/iYPAQbwRgS2VWuUX3ksTkjN
Y0MH2xXKidNEwyVQK8n+G+O5igGHGCTx10abTBPkoO5nfRJW2/EetcPukc+yURy7
EI4tknVbkdP/1HG/BmKOMbLkVaQC0iN4rioB/xwgpIdpGU58XwUU2GcPt6ALl29z
q5MXCKG7YN9l50QKV6ZcOoK3aT178Q02/iakSG9wvQ9QzAv2OEkFtf6aajOk6fHH
JiB3n3uG70SR9FbWwByM702ofhEjZ6bHZ6VtvRGZI+RzVWdyfZSLbh1Lif7GBqIx
1K8gLqhVn4desupPlMG/em3V5nBH6eHyw9NCxXCHnMy2hViw0TQ5lQwRYoWeSNpj
x8Z6K4X9m7NPKW42NzkAEFNFdOr7+xyKawbUU+/nPAbdj1EUkvDBMalixXfCbMII
X1PjBjonUXBwUdjt+KuZ6Pz3Ax0R8OknhqXJ+udY71/9bUEEJnCqHORGjvML+KY1
hmqg0h/oXlNZHYwi5cmG67si47vKqNemyPxVtVOk1F1mXe38lbV/FxxJCJfKK8bl
sdRKAVG2yoptkLEeMWqLv7YCluI8ODsU1U8GpDVrm7lkic266a4X9kgkJc9fw8TK
4lZNu4rxUeyja9t5QgecGGMT7pMRtC+KIMSdi5b/e3zrcrY2rWvr289o/JI8beTF
ILkp74RX1PK8o2t9/Sfo
=OccC
-----END PGP SIGNATURE-----

--=-Z/xRCEM9XY+M6QxYiCB8--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
