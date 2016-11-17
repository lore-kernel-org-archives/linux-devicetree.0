From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH] mfd: dt: Add Aspeed LPC binding
Date: Fri, 18 Nov 2016 10:11:41 +1030
Message-ID: <1479426101.5215.13.camel@aj.id.au>
References: <20161117060633.3837-1-andrew@aj.id.au>
         <CACRpkdazPEbU2gmDyke=GTYtjVp8aeauS+PVkp-zuiVoVz7kbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-ZRMEcVri4dE1vHummK7t"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdazPEbU2gmDyke=GTYtjVp8aeauS+PVkp-zuiVoVz7kbw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee.jones@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--=-ZRMEcVri4dE1vHummK7t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-11-17 at 10:30 +0100, Linus Walleij wrote:
> > On Thu, Nov 17, 2016 at 7:06 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
>=20
> > +* Device tree bindings for the Aspeed LPC Controller
>=20
> We are going overboard with the lingo sometimes, to the point that we do =
not
> understand how terse things become.

Sorry for that, it is a bit terse. Sometimes I struggle to gauge how
much context I should provide.

Joel's reply covers the details of your queries below, but I'll make
sure to add the information to the bindings as well.

>=20
> LPC =3D Low Pin Count, right?
> Explain that right here: it is a slow external bus, right?

> > +The Aspeed LPC controller contains registers for a variety of function=
s. Not
> > +all registers for a function are contiguous, and some registers are re=
ferenced
> > +by functions outside the LPC controller.
> > +
> > +Note that this is separate from the H8S/2168 compatible register set o=
ccupying
> > +the start of the LPC controller address space.
> > +
> > +Some significant functions in the LPC controller:
> > +
> > +* LPC Host Controller
> > +* Host Interface Controller
>=20
> Host interface to what?
>=20
> > +* iBT Controller
>=20
> What is iBT?
>=20
> > +* SuperIO Scratch registers
>=20
> Again more context please.
>=20
> With standards documents, either explain everything or provide
> pointers for the information.

ACK!

Andrew
--=-ZRMEcVri4dE1vHummK7t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYLkA1AAoJEJ0dnzgO5LT5MmMQAI/h4v22+5QF/yK75NyupeCi
B8hHw1vApkk3f8EfBvDZzC31E7mPljqg6eOdddJHRcAELbQMOzXUFTAYyt/Oo8Ki
CxzN5Cykp6d4IpYQl6ysYWvt8D/XIMOXiMpQH1IDcvxIHJ/X2VRp7yiNcuRW/R1v
lF2KZhBe01ui+5htBsEAJ1wmGFRJftQL+K7riP800nwDg8F9DU8/lxo3xfuzgs9S
RyGF4psT2UupOhxGGAGRBTzVroREDOX/3fZarKFKJJyleE9OkfUxFU2OzsmSHxBr
IqlBwrCC4dj/6dg1VNOKvng3/JmgTyV86zvt+IFM32ri3r1ZOmfWw8Awo7W5SfVk
np0TwXficFJInN36UmPJIQJCFqprEhDq8+vo6GxaBqypxFnt9KDEdvoTQvOuWpwz
XNgD+FyBaolK8BVmVy1DLc7L3Bo9LYUPixGqXQZR1pASozN5I95cpHO3HwOo3TCd
BFZzBhpvycHwB7RwGd+TWeniwbH4LvEWiQcXA9/Cvf2b3cShW7ONPD8n+uOFyDV2
UA3z28fFgxK3fsHfbDwovdVTQmH5+XCCzmTpDMeotQbGClfSwmB0lt0DXV9KzkfU
+8rsSRnZ6D3Bxo5+hyJFcnELsXdqWpCAYlMBuk66XXiif1UxAwxIlqnOisQMxI5q
T/qnhIpfuPpfz670Oqgv
=XZ8Q
-----END PGP SIGNATURE-----

--=-ZRMEcVri4dE1vHummK7t--
