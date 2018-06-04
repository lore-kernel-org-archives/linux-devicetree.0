From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/3] arm64: allwinner: a64: add R_I2C controller
Date: Mon, 4 Jun 2018 10:51:11 +0200
Message-ID: <20180604085111.s23qamdethe6sr6d@flea>
References: <20180601062901.8052-1-anarsoul@gmail.com>
 <20180601062901.8052-2-anarsoul@gmail.com>
 <20180601091631.wqctilk55fcmggwv@flea>
 <CA+E=qVfH3wWsSdzGn353q0Jf-PQ8cjU-i5osLOV1c4qWVGrR5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4215363019226114668=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CA+E=qVfH3wWsSdzGn353q0Jf-PQ8cjU-i5osLOV1c4qWVGrR5A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============4215363019226114668==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5wzuacnj7eo4ub2g"
Content-Disposition: inline


--5wzuacnj7eo4ub2g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 01, 2018 at 10:30:00AM -0700, Vasily Khoruzhick wrote:
> >> ---
> >>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 17 +++++++++++++++++
> >>  1 file changed, 17 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun50i-a64.dtsi
> >> index 1b2ef28c42bd..b5e903ccf0ec 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> @@ -46,6 +46,7 @@
> >>  #include <dt-bindings/clock/sun8i-r-ccu.h>
> >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>  #include <dt-bindings/reset/sun50i-a64-ccu.h>
> >> +#include <dt-bindings/reset/sun8i-r-ccu.h>
> >>
> >>  / {
> >>       interrupt-parent =3D <&gic>;
> >> @@ -655,6 +656,17 @@
> >>                       #reset-cells =3D <1>;
> >>               };
> >>
> >> +             r_i2c: i2c@1f02400 {
> >> +                     compatible =3D "allwinner,sun6i-a31-i2c";
> >
> > You should add an a64 compatible here
>=20
> We don't have it for regular i2c, why should I add it here?

We miss some of them. Adding for i2c would make sense too.

> >> +                     reg =3D <0x01f02400 0x400>;
> >> +                     interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> >> +                     clocks =3D <&r_ccu CLK_APB0_I2C>;
> >> +                     resets =3D <&r_ccu RST_APB0_I2C>;
> >> +                     status =3D "disabled";
> >> +                     #address-cells =3D <1>;
> >> +                     #size-cells =3D <0>;
> >> +             };
> >> +
> >>               r_pio: pinctrl@1f02c00 {
> >>                       compatible =3D "allwinner,sun50i-a64-r-pinctrl";
> >>                       reg =3D <0x01f02c00 0x400>;
> >> @@ -670,6 +682,11 @@
> >>                               pins =3D "PL0", "PL1";
> >>                               function =3D "s_rsb";
> >>                       };
> >> +
> >> +                     r_i2c_pins_a: i2c-a {
> >> +                             pins =3D "PL8", "PL9";
> >> +                             function =3D "s_i2c";
> >> +                     };
> >
> > This should be ordered by alphabetical order
>=20
> OK
>=20
> > If this is the only muxing option, you can also add it to the i2c DT
> > node.
>=20
> It's not the only option, but other option conflicts with rsb. Should
> I still add it to i2c DT node?

I guess you can put it there, the muxing will only be enforced if the
device is enabled, and there should be only one of RSB or I2C that
would be.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--5wzuacnj7eo4ub2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsU/X8ACgkQ0rTAlCFN
r3TeOg/6A6Ixum1kHuqd7HoJ0KciL0xF9UX9zH9ShDOATTcLuPH564mD2rt1X4Ij
LRLPzTC9tTJORWINfJ8dXsgNVS7FEErUarf0B2BNALrefflrDk5oyyCisEHN5IXf
0dLNEn8z5+SVzfSEUuSImcOBcVtg1gjL2A1V9JImKhx5A5SlC9plqLlg1bRl/Uf7
sjDtCrV1pS/EUCi3eqMtjwNFfyT1dqFy+SLoY/8+gq9yMnzuTfyMPBx0R4Atq8ee
qg+HU/Web88ve03JNZIpxJt8aIJzaUzJ2188BH1uSUWMYcRS+JCdZVfjsrX0hvV6
dMoK0CyVC3NtU5MsasVJC0IkTgbjgz1h0saTFcsp5L7KEYWs9naFjScptoxxMZyj
5PEjhtxojDK8ywEOkt7Hkw+na0MNgCNXtxIJromyDI2Q/qFTXsvBszacWEG/SuY1
ymJIC2wNyKSCUPA8Q89xMaO4ZKjRoMSjbj1Pj0rPFUK3ZZdagdQAJ8Chbuwwk3nN
zByeeg0HMmZzaBD7O9KUK5R5qYpTzZ3lXJHrhW3vATuVWCBFWIeqDMsf1yjuSeqr
a7FaZv/JBIdSU6rrvTEL1abiRmOe4i11jUc/ciAeFcXn49Wndt9jClUwvB1DSMlj
aKSsAz1XCziH35nOJAd28D4K/rTcTgK4qxCsWNWoPu6XK60dvkI=
=cTZb
-----END PGP SIGNATURE-----

--5wzuacnj7eo4ub2g--


--===============4215363019226114668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4215363019226114668==--
