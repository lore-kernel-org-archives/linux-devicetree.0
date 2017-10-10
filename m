From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] Re: [PATCH 3/6] ARM: sun8i: r40: add 5V regulator
 for Banana Pi M2 Ultra
Date: Tue, 10 Oct 2017 11:39:29 +0200
Message-ID: <20171010093929.owvrowlpvicw663e@flea.home>
References: <20171008042906.46779-1-icenowy@aosc.io>
 <20171008042906.46779-4-icenowy@aosc.io>
 <20171009210407.ueharyifho3s6xvu@flea.home>
 <61E002C8-4046-44E4-8E1A-43C8AF74257C@aosc.io>
 <CAGb2v66r2UyR1NWrtjdoKLEi_2NdXkhr_c5D6or9_9amNnh6PQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ok5hx56nfaqgryaq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66r2UyR1NWrtjdoKLEi_2NdXkhr_c5D6or9_9amNnh6PQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Icenowy Zheng <icenowy@aosc.io>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org


--ok5hx56nfaqgryaq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 02:25:35AM +0000, Chen-Yu Tsai wrote:
> On Tue, Oct 10, 2017 at 7:25 AM, Icenowy Zheng <icenowy@aosc.io> wrote:
> >
> >
> > =E4=BA=8E 2017=E5=B9=B410=E6=9C=8810=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=885:04:07, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=
=88=B0:
> >>On Sun, Oct 08, 2017 at 04:29:03AM +0000, Icenowy Zheng wrote:
> >>> On newer revisions of the Banana Pi M2 Ultra boards, the 5V power
> >>output
> >>> (used by HDMI, SATA and USB) is controller via a GPIO.
> >>>
> >>> Add the regulator node for it.
> >>>
> >>> Older revisions just have the 5V power output always on, and the GPIO
> >>is
> >>> reserved on these boards. So it won't affect the older revisions.
> >>>
> >>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >>> ---
> >>>  arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 9 +++++++++
> >>>  1 file changed, 9 insertions(+)
> >>>
> >>> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> >>b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> >>> index 7b52608cebe6..035599d870b9 100644
> >>> --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> >>> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> >>> @@ -78,6 +78,15 @@
> >>>              };
> >>>      };
> >>>
> >>> +    reg_vcc5v0: vcc5v0 {
> >>> +            compatible =3D "regulator-fixed";
> >>> +            regulator-name =3D "vcc5v0";
> >>> +            regulator-min-microvolt =3D <5000000>;
> >>> +            regulator-max-microvolt =3D <5000000>;
> >>> +            gpio =3D <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
> >>> +            enable-active-high;
> >>
> >>This is redundant with the GPIO flag
> >
> > I remember someone suggested me to add this
> > property (maybe wens). It's said that the driver may not
> > process the GPIO_ACTIVE_HIGH correctly.
>=20
> I believe it was me. The fixed regulator driver has not migrated to
> the GPIO descriptor API, and it doesn't look like it cares about the
> GPIO flags.

Maybe we should just migrate it then?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ok5hx56nfaqgryaq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ3JVRAAoJEBx+YmzsjxAgCD4P/jcwMfBQmmaHo3awSuSYgcLq
SbW1G05obMPJaRsVpiZiqSnzdKpp9A9koKGUNWgY8Lzp579TmiMZ53S54hGdwrI8
kqdqvn+VJMjyxcu3OWzxekIvS9vGYRSJBciwjCfi0u+x9kWyGJ6TKjUz7ltHRqGO
YkbhdaiYAppXgsbF7JhK+3+9wy94FxhXbJ9oE4nNynd6Ppht5bDKx/htVB0IP9Td
BM6NEB14qILUGCKotN6D6Zv7lfCnSjgYOLTwjDmzMZH2+OMxYHA466SRY3zV0uhv
NCodlaQvNY9x9GEp0rUqaL9nd5uzk1BVbZsc6+xPS1Pf5leh7TXieWVvjppnoRXi
hjw/K1U8PpvGfh4ojlz0GZ8zVRH11mHdMDVRYRDxBm6p+SgEtZt1ZB/ENzPPXFBv
NLK2qE1+MhpozxBEIuTN4C6XkBZFqpuj6dG9OlFEs8tJcemtfpyV1TuUB6yNBLIy
l2Q8yF7fjfnB/t3Rc6oEcVLknSA3Vn3Qk69jOHjgPqukAGhJtoaZNZfKdA4SkD80
ojZ2fv7F9Hphr0BFPgk6D1B+VInCcNRlBHS8MkiLjBjNcNzg12M6BCmxw5z9VY3f
wdL9ZfQUMt803Ze9+1cx7WujG4Ptuh8l5R0Ht08S52ZqSJIwMMnry9V70bjOwDy6
g+zRQThzyqrqZdB5QYyu
=qzuj
-----END PGP SIGNATURE-----

--ok5hx56nfaqgryaq--
