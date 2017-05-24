From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] Re: [RFC PATCH 10/11] ARM: sun8i: h3: add display
 engine pipeline for TVE
Date: Wed, 24 May 2017 10:19:28 +0200
Message-ID: <20170524081928.xcbepxdt7txnadki@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170517164354.16399-11-icenowy@aosc.io>
 <20170519180616.vzrlu2avuucsjkiu@flea.home>
 <B72028D8-B055-4F53-A4EA-7E93A28DB8FF@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0990041870=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <B72028D8-B055-4F53-A4EA-7E93A28DB8FF@aosc.io>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0990041870==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gn2k2r4rgqlpirho"
Content-Disposition: inline


--gn2k2r4rgqlpirho
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 20, 2017 at 02:10:35AM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
2:06:16, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >On Thu, May 18, 2017 at 12:43:53AM +0800, Icenowy Zheng wrote:
> >> As we have already the support for the TV encoder on Allwinner H3,
> >add
> >> the display engine pipeline device tree nodes to its DTSI file.
> >>=20
> >> The H5 pipeline has some differences and will be enabled later.
> >>=20
> >> The currently-unused mixer0 and tcon0 are also needed, for the
> >> completement of the pipeline.
> >>=20
> >> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >> ---
> >>  arch/arm/boot/dts/sun8i-h3.dtsi | 189
> >++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 189 insertions(+)
> >>=20
> >> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi
> >b/arch/arm/boot/dts/sun8i-h3.dtsi
> >> index b36f9f423c39..20172ef92415 100644
> >> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> >> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> >> @@ -41,6 +41,8 @@
> >>   */
> >> =20
> >>  #include "sunxi-h3-h5.dtsi"
> >> +#include <dt-bindings/clock/sun8i-de2.h>
> >> +#include <dt-bindings/reset/sun8i-de2.h>
> >> =20
> >>  / {
> >>  	cpus {
> >> @@ -72,6 +74,193 @@
> >>  		};
> >>  	};
> >> =20
> >> +	de: display-engine {
> >> +		compatible =3D "allwinner,sun8i-h3-display-engine";
> >> +		allwinner,pipelines =3D <&mixer0>,
> >> +				      <&mixer1>;
> >> +		status =3D "disabled";
> >> +	};
> >> +
> >> +	soc {
> >> +		display_clocks: clock@1000000 {
> >> +			compatible =3D "allwinner,sun8i-a83t-de2-clk";
> >> +			reg =3D <0x01000000 0x100000>;
> >> +			clocks =3D <&ccu CLK_BUS_DE>,
> >> +				 <&ccu CLK_DE>;
> >> +			clock-names =3D "bus",
> >> +				      "mod";
> >> +			resets =3D <&ccu RST_BUS_DE>;
> >> +			#clock-cells =3D <1>;
> >> +			#reset-cells =3D <1>;
> >> +			assigned-clocks =3D <&ccu CLK_DE>;
> >> +			assigned-clock-parents =3D <&ccu CLK_PLL_DE>;
> >> +			assigned-clock-rates =3D <432000000>;
> >
> >This shouldn't be set in the DT, but evaluated at runtime when calling
> >clk_set_rate.
>=20
> Nope, DE2 clock doesn't need evalution, as the clock is decoupled with
> DE2 mixers' output signal. (Although it seems that SoCs with larger
> plane size will use higher clock.)

So it's the display engine that needs that clock to operate properly?
This is the wrong DT node to set that value then. It should be in the
mixer node, or even better in the mixers' driver.

> And setting it to 432MHz is also needed for properly 216MHz clock to
> TVE.

Just like the parenthood, this can and should be evaluated at runtime.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gn2k2r4rgqlpirho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZJUIQAAoJEBx+YmzsjxAgVxcP/iTUzfmy3TIryWWV0qe9yyY9
gJGYSrF7nzJZ4GHEb5Rq7n+M8kVBjD8UTjLo/p7lXnol6xm/dgMPNzIQ8PWrpEqj
dGmSX5qD0wqK+FeWsfBeU9pmsHgOmNkgi9LIaa1uh++M/LPdrHcWaiZBireQCX8L
t3Imq+zMgxUWYM4fFnzcZVoMKfOVYI5u8/yisoGOcLnfvltuwT3AuhWvDa4NCRWO
l1MHy2S4BuywiNf1C837c7i5KF4xqK5wr6zkPM/2ML9Eqq0KUcnY/2YezyuSREFR
DfV+DVmMKPJewVg2AdWfS1DZCMspdF9MAu4lSrA+hCumSck2ltyJ40KuOIrLZRPW
Jswz0APX45ZXryV35FliUsCOofkC4r2Lq+kRsfiGw2DF6p5ghvJMofVpgOcfWswK
+Dycm6CQZknSsmHki48HNtsY7kk593IbHA4CKM4BPtNJY8qyaKq2lQgauE9jo9Dw
7OVf3uYKvbrnwDWgxbI2A2sRNWxPq1NOTnexGUhwhU7nl4SiOx8i6dXJogaTESK7
+McdnSdKVbTQebYrWArZfHTaMGdfhkxAjqFYUqgZv3Q+vSMN3C4O2IbquTF6KkgH
r3uYho8wANY7eMmoBpm2zidUw7u130gf5YINLcxckvT2TXDcj5ekCb28tq8ZCEBd
sRI8RqAxXTgE19O2nEya
=aMy1
-----END PGP SIGNATURE-----

--gn2k2r4rgqlpirho--

--===============0990041870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0990041870==--
