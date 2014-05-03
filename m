From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 3/3] ARM: sunxi: Add IR controller
 support in DT on A20
Date: Sat, 3 May 2014 11:00:49 -0700
Message-ID: <20140503180049.GD15342@lukather>
References: <1398871010-30681-1-git-send-email-bay@hackerdom.ru>
 <1398871010-30681-4-git-send-email-bay@hackerdom.ru>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBXPUSSNQKGQE2NS72AY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398871010-30681-4-git-send-email-bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, david-0WFrdVpeebksCylrc8G9yg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org, wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2014 at 09:16:50PM +0600, Alexander Bersenev wrote:
> This patch adds IR controller in A20 Device-Tree:
> - Two IR devices found in A20 user manual
> - Pins for two devices
> - One IR device physically found on Cubieboard 2
> - One IR device physically found on Cubietruck
>=20
> Signed-off-by: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
> Signed-off-by: Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-cubieboard2.dts |  6 ++++++
>  arch/arm/boot/dts/sun7i-a20-cubietruck.dts  |  6 ++++++
>  arch/arm/boot/dts/sun7i-a20.dtsi            | 31 +++++++++++++++++++++++=
++++++
>  3 files changed, 43 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts b/arch/arm/boot/=
dts/sun7i-a20-cubieboard2.dts
> index feeff64..2564e8c 100644
> --- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
> @@ -164,6 +164,12 @@
>  				reg =3D <1>;
>  			};
>  		};
> +
> +		ir0: ir@01c21800 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&ir0_pins_a>;
> +			status =3D "okay";
> +		};
>  	};
> =20
>  	leds {
> diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/d=
ts/sun7i-a20-cubietruck.dts
> index e288562..e375e89 100644
> --- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> @@ -232,6 +232,12 @@
>  				reg =3D <1>;
>  			};
>  		};
> +
> +		ir0: ir@01c21800 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&ir0_pins_a>;
> +			status =3D "okay";
> +		};
>  	};
> =20
>  	leds {
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a=
20.dtsi
> index 0ae2b77..bb655a5 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -724,6 +724,19 @@
>  				allwinner,drive =3D <2>;
>  				allwinner,pull =3D <0>;
>  			};
> +
> +			ir0_pins_a: ir0@0 {
> +				    allwinner,pins =3D "PB3","PB4";
> +				    allwinner,function =3D "ir0";
> +				    allwinner,drive =3D <0>;
> +				    allwinner,pull =3D <0>;
> +			};
> +			ir1_pins_a: ir1@0 {
> +				    allwinner,pins =3D "PB22","PB23";
> +				    allwinner,function =3D "ir1";
> +				    allwinner,drive =3D <0>;
> +				    allwinner,pull =3D <0>;
> +			};
>  		};
> =20
>  		timer@01c20c00 {
> @@ -937,5 +950,23 @@
>  			#interrupt-cells =3D <3>;
>  			interrupts =3D <1 9 0xf04>;
>  		};
> +
> +       		ir0: ir@01c21800 {

This line...

> +	     		compatible =3D "allwinner,sun7i-a20-ir";
> +			clocks =3D <&apb0_gates 6>, <&ir0_clk>;
> +			clock-names =3D "apb", "ir";
> +			interrupts =3D <0 5 4>;
> +			reg =3D <0x01c21800 0x40>;
> +			status =3D "disabled";
> +		};
> +
> +       		ir1: ir@01c21c00 {

=2E.. and this one are indented a tab too far.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTZS7RAAoJEBx+YmzsjxAguBUP/R4YhizsM2BOcvNCLqXUqcdr
tZzhQzHC9/Lrq55oq6jie35tZAKS9ZVaa7nuihmnLUm68XR4LOQHQy2lSYKDZcX1
IPWjloMwab+5yQ/dbOL0M08zZh+Oz7s99mTMJR3TKu7D7vfMUbn1s/fUtXOUuKWk
TacUirouo3sGjtjFX2uQEIUIThOQLN5sbJhdIc3bZBMitoLtBHkmothVkuypRpon
/FDu6k4HPGMyVVE6emncCX2uzVZAaNkHIvz4rLeExpEnFJpbaN5mWFwrfb7mjNdE
HYrFQoNKSgjaYWz+yLucOn4tPxFnVoTX3FlmBGCoXNcx95BwOF+sx5udhBjyaHu+
pv9F/eBP5ttvEt8cWA7IS3ulMEAZ+Wswl/PtaTwq3YUO5RhModf+eKYTfXrKrP/z
hYn/MnirFnMc21gG5Nas78wsA7CjEmSvA4+h5nQP+0mrRqmBOEH/vyfvuOCWlRJx
up6Frbol57uGKhWIQslc/yEI/yvdzBly6a4VGVnGnJ+6NwRJzygWllsfsVnVqbwY
aFM5IVOw1oEkp87LJhqH7AfGB636rdnL3GonadxWfXVAM+8aExA+RwdeG3ZWsQP9
bL3Ud+rWIiPai3Z/41DKZtuwnymiswiioMrcOQXnbJsZaQiynporAO/P8LQtKu6b
GONEqcp4bfzQyPlPjvzd
=hN4V
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--
