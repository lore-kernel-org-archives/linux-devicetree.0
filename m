From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/3] ARM: sunxi: add support for H2+ SoC
Date: Wed, 23 Nov 2016 08:54:40 +0100
Message-ID: <20161123075440.jyubhodklpaueupw@lukather>
References: <20161121162421.800-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m6di2pz3asjbl7wt"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161121162421.800-1-icenowy@aosc.xyz>
Sender: linux-doc-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Jonathan Corbet <corbet@lwn.net>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Andre Przywara <andre.przywara@arm.com>, Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--m6di2pz3asjbl7wt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 22, 2016 at 12:24:19AM +0800, Icenowy Zheng wrote:
> Allwinner H2+ is a quad-core Cortex-A7 SoC.
>=20
> It is very like H3, that they share the same SoC ID (0x1680), and H3
> memory maps as well as drivers works well on the SoC.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  Documentation/arm/sunxi/README                  | 4 ++++
>  Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
>  arch/arm/mach-sunxi/sunxi.c                     | 1 +
>  3 files changed, 6 insertions(+)
>=20
> diff --git a/Documentation/arm/sunxi/README b/Documentation/arm/sunxi/REA=
DME
> index cd02433..1fe4d99c 100644
> --- a/Documentation/arm/sunxi/README
> +++ b/Documentation/arm/sunxi/README
> @@ -63,6 +63,10 @@ SunXi family
>          + User Manual
>            http://dl.linux-sunxi.org/A33/A33%20user%20manual%20release%20=
1.1.pdf
> =20
> +      - Allwinner H2+ (sun8i)
> +        + No document available now, but is known to be working properly=
 with
> +          H3 drivers and memory map.
> +

I'm not sure the phrasing is right here. I would prefer something like:

"No document publicly available now, but looks very similar to the H3"=20

>        - Allwinner H3 (sun8i)
>          + Datasheet
>            http://dl.linux-sunxi.org/H3/Allwinner_H3_Datasheet_V1.0.pdf
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentat=
ion/devicetree/bindings/arm/sunxi.txt
> index 4d6467c..26b35a7 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.txt
> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
> @@ -13,6 +13,7 @@ using one of the following compatible strings:
>    allwinner,sun8i-a33
>    allwinner,sun8i-a83t
>    allwinner,sun8i-h3
> +  allwinner,sun8i-h2plus

h2-plus please.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--m6di2pz3asjbl7wt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNUs9AAoJEBx+YmzsjxAgP0QQAIUc6g0Mevf4k5yAp+6f49mW
o9K3kZhpG0P3eKN3xMxxeqThN675r4AkdcNmyvPqD6c3HWfovToBe2h2VA9rOBh1
39cbXKzxYeNboHiPzHakea8X/dfBlRqJdSaC+Zf4h+Hk88Hxxqahp43rSx9aCuUZ
OkMW/WLnjg6mKrCJw009TvqA9Ty3rpwCwZvVLwgCkYA8/omzqYrSDpGcmwk2Idkl
qfd5CVXKfx6In4n8B4axAxOG9nnW4Ps7+Sq1r2djn0ulJRjwH9K0JBQ70Bylnh93
aeKH7LEMcu+mO6jmEoKpwFOV59OVI1XvbGHIQQH4wNu4/zZPcGZ44J8uBPZ0JpJQ
+lztZ+xml31zL5WT0/OabC9OnRD+FrTIw3SONwKsJrGcI3lvN9wkOpfI3oLMoK8+
5QNdpuEHa10vEXR/xuO8pWnLXvGZmSFygjsRgnsfceg5xWhRiqWoW1v8gyYDKnS9
Q9SLbpggv3iMawKVIxxTvkxsSDsRIjQabafrYwTdXsnyWsVTzpXCaGam/2bzK7oo
5E8MU41JHGRJNU6fOiurlL5chaS1N7xoBkLxTAZjP+TTj1f4UJpge2VPUZyOeXY2
17A56FIklu00lyy8FWyaO4NzTbQAQV3gFJTWMP3c7E4gJbdmdgcIonMrH51NnSSS
X0BoyZiQ6q5j9t3b1xdW
=i5iq
-----END PGP SIGNATURE-----

--m6di2pz3asjbl7wt--
