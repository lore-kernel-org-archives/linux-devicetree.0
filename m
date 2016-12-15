From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH v3 1/4] pinctrl: aspeed: Read and write bits in LPC and
 GFX controllers
Date: Thu, 15 Dec 2016 10:30:43 +1030
Message-ID: <1481760043.3112.60.camel@aj.id.au>
References: <20161206031152.3004-1-andrew@aj.id.au>
         <20161206031152.3004-2-andrew@aj.id.au>
         <20161212162712.u2uypxkqhh6cinsp@rob-hp-laptop>
         <1481609543.3112.34.camel@aj.id.au>
         <CAL_JsqJvhxDSVqpAFCberferxCjvLPRTFXcgTafaPf1DwOa2Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-vaNGXmR19JSZRtUNO7V3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJvhxDSVqpAFCberferxCjvLPRTFXcgTafaPf1DwOa2Xw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-vaNGXmR19JSZRtUNO7V3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-12-14 at 10:46 -0600, Rob Herring wrote:
> >> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "aspeed,g5-pinctr=
l";
> >>
> >> There's no register range for pinctrl?
> >
> > This may be a mistake on my part; when I wrote this I had no experience
> > with writing devicetree bindings (and still don't have a lot).
> >
> > The SCU does have register regions for pinctrl but on reflection I feel
> > neither the mfd nor syscon bindings describe how children's resources
> > should be treated in general. The example in the mfd bindings is for
> > hardware that is register-bit-led,compatible, whose bindings use the
> > 'offset' property rather than 'reg', which still describes where, but
> > not using the reg property. Given my uncertainty with reg in an mfd
> > child, I wrote the pinctrl/pinmux driver using offsets from the base of
> > the SCU's syscon rather than describing the exact region(s) of the
> > syscon that should be used.
> >
> > The issue you raise here occurred to me when writing the LPC Host
> > Controller bindings, but there I wasn't convinced using the ranges
> > property to give offsets was the right thing to do either.
> >
> > Regardless, whilst there are two dedicated regions of pinmux registers,
> > the mux state also depends on bits in SCU registers outside of these
> > regions. Assuming we define an appropriate ranges property for the SCU
> > syscon the pinctrl reg property would look like:
> >
> >=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x2c 0x1>, <0x3c 0x1>, <0x48 0x1>, <0x=
70 0x1>, <0x7c 0x1>, <0x80 0x18>, <0xa0 0x10>, <0xd0 0x1>;
> >
> > This is the list of registers affecting the mux taken from the pinctrl-
> > aspeed.h.
>=20
> With other registers in the holes, right?=20

Yes.

> If it is sparse like that,
> then yes you probably just want to have reg in the parent for the
> whole block.

Alright, we will leave it as-is.

>=20
> > What action do you recommend here? The pinctrl dts patches for the
> > Aspeed SoCs are yet to be applied, so changing the bindings to require
> > a reg property can't break any existing in-tree users as there are
> > none. The pinctrl driver can be patched to respect the reg property
> > after the fact, though actually using the region descriptions might be
> > interesting.
> >
> >>
> >> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aspeed,external-nodes =3D <&gfx,=
 &lpchc>;
> >
> > Did you have feedback on this approach? I queried you about it in the
> > previous revision, but never received a reply:
>=20
> It seems okay. At least, I don't have a better suggestion.

Thanks.

Andrew
--=-vaNGXmR19JSZRtUNO7V3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYUd0rAAoJEJ0dnzgO5LT5sYMP/Ah3bgthVkeJdw21tTdy6V07
v3Fdj6C7nIzom4CqbdvbwC7snwUuuxi5cjSWpsEjEY6Zblsg4Bn06C+KMSggD2Yb
N+8xGFVRVmgBqaXtpIv9mEL1BF15yYJMf2QVpOac2rRt2mYKZicuR7A6ErrSD87w
uDlwrTv3rAnDezqT5hIFLsHagOM4IDrgLa4jTvZDk8RLaqGC40gyvVNVSBhd2SEj
pTWtRhJUcKm84LwyJG8rJiptamx+ykK5gA3do0ZenvoQisaMpqJRM8cKdUzpkxeA
VMIY/We4j6cjOjDOf8j/sc5i4weIZ5DhklbkYUaQs7GgbJUeIViMfagjZmLLMig5
fCKulaN7/bEvJ+A0R8kQU05dS8DKSZn+EApuymdoEAwmtM385pjAyXitQPPW0wR4
6FuiSeT+lPxhnX0PUH18TIVzac/nEuxKaKbhtFy0qbt8gWg4GoSak1Cw7lBmuTTJ
nbVuvKocA3oPePMLvsaWIs5sFnE24Q2rcE17XKL6cWpVPriyML5H6PWf/L1V9bON
dWnIqYODU1rzJSCM5n+tunOiiOCyG3KGnesXz3RSlIY2N+ghCBHJjk/pDeGD52fW
LKjNiyFGE5eWC7EQd3W+7onFXBdrNCnpSsvbNL3+gnvNfeuq1soIFDZP49PG6N1Q
xXzdmFBs7AHhlwoeX6kt
=UzIO
-----END PGP SIGNATURE-----

--=-vaNGXmR19JSZRtUNO7V3--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
