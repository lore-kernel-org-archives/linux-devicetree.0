From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH 1/5] gpio: gpiolib: Add core support for maintaining
 GPIO values on reset
Date: Fri, 20 Oct 2017 18:54:15 +1030
Message-ID: <1508487855.24322.49.camel@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
         <20171020033727.21557-2-andrew@aj.id.au>
         <CACRpkda-7-uM5x4kbNXkx3F7F4VTZtTvXfys5VPFb1YiVDo1+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-d48CUOoV9VuoK6rPhecQ"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkda-7-uM5x4kbNXkx3F7F4VTZtTvXfys5VPFb1YiVDo1+g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-d48CUOoV9VuoK6rPhecQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-20 at 09:17 +0200, Linus Walleij wrote:
> > On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
>=C2=A0
> > GPIO state reset tolerance is implemented in gpiolib through the
> > addition of a new pinconf parameter. With that, some renaming of helper=
s
> > is done to clarify the scope of the already existing
> > gpiochip_line_is_persistent(), as it's now ambiguous as to whether that
> > means on suspend, reset or both.
>=C2=A0
> Isn't it most reasonable to say persistance covers both cases, reset
> and/or sleep? This seems a bit like overdefined.

I definitely had some internal debate about that. I erred on the side of
avoiding potential change in expectations for the arizona. If you consider =
that
overdefined then I'm happy to go the other way.

>=C2=A0
> So can we say that is this flag is set, the hardware and driver should
> do its best to preserve the value across any system disruptions.
>=C2=A0
> We can change the wording of course, patches welcome for that.

Yep.

>=C2=A0
> But do we really need to distinguish the cases of disruption and
> whether we cover up for them or not?
>=C2=A0
> I would say we can deal with that the day we have a system with
> two register bits (or similar) where you can select to preserve across
> sleep, reset, one or the other, AND there is also a usecase such that
> a user wants to preserve the value across reset but not suspend or
> vice versa.
>=C2=A0
> I suspect that will not happen.

A very reasonable approach.

Cheers for the feedback.

Andrew
--=-d48CUOoV9VuoK6rPhecQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6bKvAAoJEJ0dnzgO5LT5xb0P/3hJ2tqH7oYshUwTVEJjSLd2
xjGVSS5Vqrmn7FwEwmk1lYUlNSERaM1NtKwGKCVSM6Xvf+3MJ5TuXvxJRCHiSAxC
qNerc80lrTZKuVNOwlfv3YCPZj5MHiNwynWaUoPuSIc0Y7iIWoYQl3oI5IhVVjQM
f+v+QHSEa26NYwT8LJIpOmfKgwzypl1g6oTELB3g+Bt3Ff49Smr5VzCvborOFBNs
W/qBybuf1qaKs/dv2hGLKpEULhVP+Y2L6zEL2zMd3URGlAvtCxBv3OsJMfHyQLDh
cac0ciSAepA+SxsDu1fXHzrQ2X0A/62MpCsgVY97fjaU7yXGLjZ4hgbIrN6HAPAg
s4c/PYjJZxkD1a1KhEumify8dpLXbVFLDv678/v6kc2MdeuETq0LZWo4tJ4JY/UA
Vk3J0Q0Uf3T+P5+5ZI2ZgSAbfJL0JE9ngshPjA65eWP6UTvIuq/KmMZKxmd2nRv4
DGrfzQONzTU7sbezF7oUOF78FejXU15Qc4YEifkSph9VLgUMpLa3BpJXRRUxhy00
8a/fxb7qDjU/H4eB7fYgPVsXzxIn2l03vVzAX8VMGSxEsjerrqUn2EF3NKj669xD
XSbBDvaeqyGF0FiC3jH9sLZYREKno/Jigh5D3xyO5lLTbyLWrh4V648cnn/0dMEl
w47nA2cEGma8s58k+HHT
=8Vaa
-----END PGP SIGNATURE-----

--=-d48CUOoV9VuoK6rPhecQ--

