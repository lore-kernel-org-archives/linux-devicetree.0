From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] [PATCH 4/6] ARM: sun8i: a83t: Add device node for
 DMA controller
Date: Mon, 22 May 2017 09:24:37 +0200
Message-ID: <20170522072437.hoekcjfxi5i3oxiu@flea.lan>
References: <20170522062552.19026-1-wens@csie.org>
 <20170522062552.19026-5-wens@csie.org>
 <CAEKpxB=daPuD0YNToTiEzcD0VAUjVen0nTDY0BhkLfQzcLFoTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ml7n7yqjecafdagz"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEKpxB=daPuD0YNToTiEzcD0VAUjVen0nTDY0BhkLfQzcLFoTw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Code Kipper <codekipper@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org


--ml7n7yqjecafdagz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Markus,

On Mon, May 22, 2017 at 09:18:49AM +0200, Code Kipper wrote:
> On 22 May 2017 at 08:25, Chen-Yu Tsai <wens@csie.org> wrote:
> > The A83T SoC has a DMA controller that supports 8 DMA channels
> > to and from various peripherals.
> >
> > Add a device node for it.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  arch/arm/boot/dts/sun8i-a83t.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8=
i-a83t.dtsi
> > index e12dd7170b8f..47196feda26b 100644
> > --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > @@ -163,6 +163,15 @@
> >                 #size-cells =3D <1>;
> >                 ranges;
> >
> > +               dma: dma-controller@1c02000 {
> > +                       compatible =3D "allwinner,sun8i-a83t-dma";
> > +                       reg =3D <0x01c02000 0x1000>;
> > +                       interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks =3D <&ccu 21>;
> > +                       resets =3D <&ccu 7>;
>
> these should be ccu defines, otherwise everything else looks great.

In general, yes. In this particular case however, this is made on
purpose, since Chen-Yu just introduced those defines that are part of
a commit that will go in a different tree.

We will switch to the defines once it reaches Linus' tree.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ml7n7yqjecafdagz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZIpI1AAoJEBx+YmzsjxAgNZ8QAKAUkUPO8bid1qe2hZzIoFnV
EXfmXdWYTNAHcuMjpBehVPypTmMlB/u3jg6/6k6VhRjwbGIVS6SCujmuJhiYHI2N
0HO/ufde0oD+hCLoko34aJ4jnJWxZmATXklx1rj/vCGJoHr6bEvWjK1kbKoi9stv
FRQpOrb8m6qlE7pj8AeOnfy6Wsi+jBXK+39sIt/zihgo1rd/Prw08JMbLJmoWtGQ
5cK/ILl2cwxtFFf1nlSqGllo1C4+P1u6G6I5+8rLKysraKGQ/qO1uEijR43/b1uE
3InxeXNp6vPefYX/OIOS/e0xhHc+1/KVe01rfh9yg43NcDvMmUfjL/R/MIJoJHSI
GvET8hNC6KjfmG12JisHsDAHWjeQROU/Hw2vgaWNdxAeFddR/5mkpGkmpw/1kegA
UUg4A730YfRqtj0qEG9kZtUB+cqDqj1b2U4uMuR+jMNaUogcxG/iFuImcbMJ/8wW
djIYSQ0qCPspW82b84Q307BiCrh6Egx5wptQHc9nypUXp7/pOBVqVTB7mkPZOzBI
HYESZzXf3EIi2ghAbmC0ypRYurFWOQZ0gaIgDHtwU55RKAgvljMhDrOIvGKxagZ3
1Rqr7to9tJpXEclPcliylQIPUGcY0JOLmSYGha1Kv4QgiifERbGiUky7I4RIBZgM
QNK1g5EHAk7fGm2dWj0c
=EdDY
-----END PGP SIGNATURE-----

--ml7n7yqjecafdagz--
