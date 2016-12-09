From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sun8i-q8-common: enable bluetooth on SDIO Wi-Fi
Date: Fri, 9 Dec 2016 09:07:53 +0100
Message-ID: <20161209080753.jmtbt6or2zylxtza@lukather>
References: <20161206080838.7523-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3792954766245028836=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161206080838.7523-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============3792954766245028836==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="djh6rojrpzlf554w"
Content-Disposition: inline


--djh6rojrpzlf554w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2016 at 04:08:38PM +0800, Icenowy Zheng wrote:
> Some SDIO Wi-Fi chips (such as RTL8703AS) have a UART bluetooth, which
> has a dedicated enable pin (PL8 in the reference design).
>=20
> Enable the pin in the same way as the WLAN enable pins.
>=20
> Tested on an A33 Q8 tablet with RTL8703AS.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>=20
> This patch should be coupled with the uart1 node patch I send before:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2016-December/47199=
7.html
>=20
> For RTL8703AS, the rtl8723bs bluetooth code is used, which can be retriev=
e from:
> https://github.com/lwfinger/rtl8723bs_bt
>=20
>  arch/arm/boot/dts/sun8i-q8-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-q8-common.dtsi b/arch/arm/boot/dts/s=
un8i-q8-common.dtsi
> index c676940..4aeb5bb 100644
> --- a/arch/arm/boot/dts/sun8i-q8-common.dtsi
> +++ b/arch/arm/boot/dts/sun8i-q8-common.dtsi
> @@ -88,7 +88,7 @@
> =20
>  &r_pio {
>  	wifi_pwrseq_pin_q8: wifi_pwrseq_pin@0 {
> -		pins =3D "PL6", "PL7", "PL11";
> +		pins =3D "PL6", "PL7", "PL8", "PL11";
>  		function =3D "gpio_in";
>  		bias-pull-up;
>  	};

There's several things wrong here. The first one is that you rely
solely on the pinctrl state to maintain a reset line. This is very
fragile (especially since the GPIO pinctrl state are likely to go away
at some point), but it also means that if your driver wants to recover
=66rom that situation at some point, it won't work.

The other one is that the bluetooth and wifi chips are two devices in
linux, and you assign that pin to the wrong device (wifi).

rfkill-gpio is made just for that, so please use it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--djh6rojrpzlf554w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYSmZVAAoJEBx+YmzsjxAgjBIP/0B1Vz86EgCCxTQgpDQE0DF8
KpMdRvWGvIUd8IJ0s7ZvJ6CgcitKdMJReQd70uGlGlYTeM0LNZqhqN08mf7RdaRx
bU72NMpwD/ZULrHZIvucpePTM7PMkbnlm7bG0fLtHnbqS7x3gWHDhXmaiJUPvEVH
+vNNURbXcUo3SkYgiSoGVudpQFjV0NJuBjx7tmAvMbw0Bvxe/MQRcqud5Q61U405
9LOX9Y86DXMgF9gKL5uBVBUErrBFZhMeJJRIuzH3aHnBPRTqW10t1+JVTR1o2sxz
ZHhiz21fo3t0XowWGIE0QrkHCqBthwzIkvypq/xW9uiylU17hU1dKolLEAzYbd+t
H8zQ6M6ylf5Edl+BXuxndyJhDFEM6ZyFH+mKpPu8TtgSMWP6vVij8OX1b/zQb9I6
fyPcz7QwMGKKKi56yPJxCrCrAZBKbDu43IhcsJuF2zKx+lMAjIGGLrOyaBsX+lBa
4RnB4EBCVEiXNrLGcDfd7NJLw6eSpn7UtC904lo+IDHkhAjsyvd3ABohmVQuF9nw
n3UOdoTqZHdidWWoZEWsGwmkUFSrmXFoB1nq3tfJsDIrNpvHAqpAwa0MBSO/tzNA
VR/SGmcNv03JZarErDSUbJATGY+hk9mNnxcxkeMd1YpRuDAQ+OWC5hZl+r7nIyU3
NU+aQyeiDUN7Ktp7U+du
=suCv
-----END PGP SIGNATURE-----

--djh6rojrpzlf554w--


--===============3792954766245028836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3792954766245028836==--
