From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Update simplfb nodes so
 that u-boot can find them
Date: Mon, 17 Nov 2014 16:59:25 +0100
Message-ID: <20141117155925.GV6414@lukather>
References: <1416238816-29627-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O0IT7rLmWuveAsNR"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBBFXVCRQKGQEXDVIIIQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416238816-29627-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--O0IT7rLmWuveAsNR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 17, 2014 at 04:40:16PM +0100, Hans de Goede wrote:
> Review of the u-boot sunxi simplefb patches has led to the decision that
> u-boot should not use a specific path to find the nodes as this goes cont=
rary
> to how devicetree usually works.
>=20
> Instead a platform specific compatible + properties should be used for th=
is.
>=20
> The simplefb bindings have already been updated to reflect this, this pat=
ch
> brings the sunxi devicetree files in line with the new binding, and the
> actual u-boot implementation as it is going upstream.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun4i-a10.dtsi  | 5 +++--
>  arch/arm/boot/dts/sun5i-a10s.dtsi | 5 +++--
>  arch/arm/boot/dts/sun6i-a31.dtsi  | 5 +++--
>  arch/arm/boot/dts/sun7i-a20.dtsi  | 5 +++--
>  4 files changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a=
10.dtsi
> index 92d8aa6..bbc366f 100644
> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
> @@ -32,8 +32,9 @@
>  		#size-cells =3D <1>;
>  		ranges;
> =20
> -		framebuffer0-hdmi {
> -			compatible =3D "simple-framebuffer";
> +		framebuffer@0 {
> +			compatible =3D "sunxi,framebuffer", "simple-framebuffer";

This compatible isn't following the
standard. allwinner,sunxi-framebuffer would be more appropriate.

I must say I'm also a bit concerned that this whole binding thing is
not stabilizing while we are quite close from the end of the ARM merge
window.

I wouldn't be very pleased to merge any more patch modifying again
this binding.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--O0IT7rLmWuveAsNR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUahtdAAoJEBx+YmzsjxAgVN0QAI27AXqF4avndo5mNIVwqWIm
EnbuOnW8ttyZqIWCdFjg5ptyl3Y0AkKc/1dEhUHbSKjGoabrRKnbwkIUpS4ZdpOn
9tFHw1OlSLqHbowqupr4vAwDy0gQIdA7qreeGSOvYb9gKBacli0qFiVKIHwTtHef
KG9Kl+R0tN4US23b2pVlqHB5+8pLhop2J4+aSQikO511U0QuSNncLQBUyMJbzC9a
o4f40Vl2HFAVKDmBjybGlndns0NsLdTICj2zrPR3cNyvwl7+O+XEbb08ath5rSNP
749cTzPRgEe5arAz6PhVkmNVJsfUnABVknikDQH8EcNV4DJg9WZ2/MPB9HKiUTJJ
U19GWeiKZ+sUN+gI8YmuSIsjZPY3xo9t0uiaCVn38gMEubLCim68ebOEimdS00X6
+E7AxUi0LXiUyanCzZnHcceOYPtk/wM3KDL2xFxAk6H5dZucwsjDUc91wEE9JlGY
gD8XrC2jS0q2bk+SFQO+2VWkCQlNNjmACUZsij4Aj4d6LZp9kE2M6j5jgrX18Lt0
MiKl+UbaP9GN1VAl8ojPZtjzZm1iqXnpLvbXVutX126GVE4m1pZDYR/BwNsL7Qzg
BKQxDrYKzAHO99W10aboZ3HYtbDPHuuimLOt+Sm/cZ8x9Dj3/0cgjL7jHXf2i53r
nKk9X3XKJpdlFbfKD9O2
=dGIT
-----END PGP SIGNATURE-----

--O0IT7rLmWuveAsNR--
