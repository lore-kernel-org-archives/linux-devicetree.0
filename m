From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 6/8] pinctrl: aspeed-g4: Capture SuperIO pinmux
 dependency
Date: Mon, 24 Oct 2016 11:00:41 +1030
Message-ID: <1477269041.6373.41.camel@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
         <b5f67ba76018314d08e240f95951751896687d37.1474986045.git-series.andrew@aj.id.au>
         <CACRpkdYLDesENtq2cQBrWQeL6NH+mO_N5Z=e9=gsoZSCE85Jag@mail.gmail.com>
         <1477010011.8917.20.camel@aj.id.au>
         <CACRpkdYZPcjGuRKVL6qwof1p7ZXT4EvwzAuz59oTgp9Z5Dzixw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-t1RqGp4nYOPvSh0eD+WI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYZPcjGuRKVL6qwof1p7ZXT4EvwzAuz59oTgp9Z5Dzixw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-t1RqGp4nYOPvSh0eD+WI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-10-24 at 00:09 +0200, Linus Walleij wrote:
> On Fri, Oct 21, 2016 at 2:33 AM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:
>=20
> >=20
> > >=20
> > > Patch applied for v4.10.
> > > (Tell me if I'm applying patches in wrong order or something, and
> > > I hope this doesn't clash with the fixes.)
> > Both this patch and 8/8 functionally depend on 5/8. I fetched the
> > pinctrl tree to poke around but this patch didn't appear in any of the
> > updated branches, so I'm not sure whether we have the right ordering.
> > Without it we should hit build failures from missing macro definitions.
> >=20
> > Have you had a chance to look over patch 5/8? Joel wasn't keen on its
> > current form, so I would appreciate your input.
> Oops backed this patch out.
>=20
> Will look at 5/8.
>=20
> Appreciate if you repost the remaining patches in the series based on
> v4.9-rc2 once it's out, and I'll rebase the pinctrl tree onto that.
>=20

Will do!

Andrew
--=-t1RqGp4nYOPvSh0eD+WI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYDVYyAAoJEJ0dnzgO5LT59k4P/3NGHk9ZZhq7eNziiG3ruKdm
eeYbv+jXfX+RBYdv4Gtw4Z23eCEMgIXnuf0SwZeejDkF+uFwUXMYb295/3dEAtp+
Qea0RZt0jCGhJms/kgHzOh7mtBJrcA0MirZYXBlURE8elOCnFpcOuyJ1WctJjoxw
3+ChmKGLVFpBSTEto3P4Ux5VffVVYcv1J2A/PBPWNfNQX4SjhmJPS61PxHgInTAp
VmRgLJQnqVxZY6dN2P8FQBLRvLWwpTTdWfPdokp61mWd8J14xmY33pqzMz41mB27
LCtR4IKyA4kr2kZ772Xb5N23T0sVRsmX3IGIT051HUTn5l1yQdfA6NZCXByDMYhf
+uD1X6CfnJ2Tm5vqYK2Rmfs+D3ipGFpjuEPpyfW4wrgoTbrW9GyknXu7Rx4xFRPD
RckU4EN0u82q4Fqua5rjqDZ7EMq+iZBw9yWbcnnCwP5+061IrZwKi7VqvjoijFno
wRDs/NoZxtghTg5dEzOn8oNvnCyNIyw6cOTn+AJqEmblnI/qsL/rpNDKoT2y5k7e
lagWgHH3L/qt3cvjSmicDeyepCaHCICyEZZ5lSh02n1e28ir6fACbQQbrEGTpX8t
U2TbHls/YDVv+Xknv9IOOX1t4KGh+0xNec5rgF4Grq2LJiAab1qmy35Vw4DGR62P
gtAc25Oopt1QJ87U+cOI
=Bf72
-----END PGP SIGNATURE-----

--=-t1RqGp4nYOPvSh0eD+WI--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
