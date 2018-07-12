From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH 1/2] ARM: sun8i: h3: enable HDMI output
 on Banana Pi M2 Zero
Date: Thu, 12 Jul 2018 08:46:01 +0200
Message-ID: <20180712064601.m3bdd46wzac5fpgh@flea>
References: <20180711132233.42301-1-icenowy@aosc.io>
 <20180711132233.42301-2-icenowy@aosc.io>
 <20180711150532.6gzm7krouriddreh@flea>
 <8F6CDF5C-2AC1-43EC-858A-5C6345CF279A@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ywglc47lk2k7kfw"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBK7STPNAKGQEHHO63SA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <8F6CDF5C-2AC1-43EC-858A-5C6345CF279A-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--6ywglc47lk2k7kfw
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2018 at 11:15:50PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2018=E5=B9=B47=E6=9C=8811=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
11:05:32, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
> >Hi,
> >
> >On Wed, Jul 11, 2018 at 09:22:32PM +0800, Icenowy Zheng wrote:
> >> Banana Pi M2 Zero board has a miniHDMI port connected to the HDMI
> >> controller of Allwinner H3 SoC.
> >>=20
> >> Enable the HDMI output in Banana Pi M2 Zero device tree.
> >>=20
> >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >> ---
> >>  .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 25
> >+++++++++++++++++++
> >>  1 file changed, 25 insertions(+)
> >>=20
> >> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> >b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> >> index 7d01f9322658..eb61dcf32797 100644
> >> --- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> >> +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> >> @@ -26,6 +26,17 @@
> >>  		stdout-path =3D "serial0:115200n8";
> >>  	};
> >> =20
> >> +	hdmi-connector {
> >> +		compatible =3D "hdmi-connector";
> >> +		type =3D "c";
> >
> >This is not one of the connector type declared in DRM, how is it
> >exposed to the userspace?
>=20
> So just use "A" here (because of single link)?

If the connector type is C, it should be C, and DRM / driver adjusted
to handle it.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--6ywglc47lk2k7kfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltG+Q8ACgkQ0rTAlCFN
r3Q8uQ/+KS0QCSYZWHgdFs7viTA31QUgJIrf4GF1FF6w6rVq9kR2eNFu6jdfTveB
4Jv7jN8Ow2bNezNapbf/JsVB/23wF0vQwfp+kKGz9xYzLYAIWFIMhdM/mSO0BQk0
km0CR1LzJQL1lXnVJNhzLKIqkhKHaGT5W9qCaqCFYy/zUlhoDMXvR8zCUOhxU3GX
KZxZV9j/GsqbSvbri+JRA9Gs34MG5XZJeFPSme+A6oII3Y1AhXXpEFA4Bm8Jqu1o
fogdDffYo/xpNBrgeCy3E2zrnePt4F86yoZazk0bOShi5Mkk/SWrsSEKRl94k2jw
M0Ytk3f0AabFfCtwJ2ps67Uj1SfJGqSOzglAHUYlwZEPtP1D+/mr5Vy+zbI1K7Ff
UUmsEeuwvRGxyMPT0oQBlHSwVgS8VuYhcYkhskfB85Sp/QsUIAEeeHGS18xdGZeP
AXRBvxTcUVkoy4kkvMzqlOmMsLAiKhp9zsNB42ezHfM5KUv+V55sUuJJwFBM8BUt
GiVqxpQd6Qn+3v/EmFicYM4+6Ki+l9AEA6s3ioaFgjF3BC3GmKri8T2UCDmSqpul
O1ROrdTg+l88VlKBczSLcuMQq9AuKmWdARESSuH0AAHIOiI4Khb+pqdZ7NLx2XlW
uTMMp+hdQfgvyL6XGocOtRUzcxx7yQ+BBOuranlP3KtcxFNtovU=
=pHv5
-----END PGP SIGNATURE-----

--6ywglc47lk2k7kfw--
