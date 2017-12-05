From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Convert to CCU index macros for HDMI
 controller
Date: Tue, 5 Dec 2017 09:27:21 +0100
Message-ID: <20171205082721.imghrej2lt5tured@flea.lan>
References: <20171204084401.2646-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qd5jz6tch3fexrvv"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171204084401.2646-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--qd5jz6tch3fexrvv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 04, 2017 at 04:44:01PM +0800, Chen-Yu Tsai wrote:
> When the HDMI controller device node was added, the needed PLL clock
> macros were not exported. A separate patch addresses that, but it is
> merged through a different tree.
>=20
> Now that both patches are in mainline proper, we can convert the raw
> numbers to proper macros.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qd5jz6tch3fexrvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlomWGUACgkQ0rTAlCFN
r3Q3NA/9E6WoJZTs2KXNJgkhitMthWF+FpRHSN1e2P6DNTqxEy8eSwlLscNc9Eho
DCSsQ1v8pne/fUV19qb6/cVsr5F1OvAShoteHI8YKYCI11fCLBe7yAZkDFJCj61o
ZKRC14WG2XuzPrO09CoDOQw4VsVlJf5dK1Omfw0OiuVE5ephHGDWv/DSZ+2Rj0Um
SOpcgv1tzzBR3z6w/2gk0h9Fos8pkKyxARm9qhPj1VDITqldcasD/ucvfjPaO9JN
Hq9CExJU0p6E18v+Jo+SnQkDDy9V8b0lmcLNrCUlh3tBU3dhYUgu2HI7/hGFUmiY
HRYuEeEFWas2xh3IaJP5KbLY37fvpYH38dRuIMxUqbasRu94EU/eoxIDV65mSirV
uNdKOg3+I4C3OVDXp2U1hwkTiqWnaem1M9Z+zykpIrV7H1x9oMWnQ7BVSkDjKi2F
+WS/SPUZ/Ei7rTfB848xeR77km4kYM/DM9EeW6wcLNTS2A9EUel2THWacBaA0G3F
ShcIKkO1usbrcf5M1CzgC9ZAnII34I5D6WNaAiJqYHN4dA6leP+3r9Q1O83rL9sL
QXeMAsSm3SXWZr5lfXDQVOgC43bGUd6JKMnwNjhRmoPy5b52iz55uk6kZxyIPEdf
FmZm+OeqLpQlZX+2637HGQwTsH6YqWo2wKN5sPikqLtNYEo6QoE=
=HExg
-----END PGP SIGNATURE-----

--qd5jz6tch3fexrvv--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
