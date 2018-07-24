From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: allwinner: h5: Add SID for H5
Date: Tue, 24 Jul 2018 15:00:04 +0200
Message-ID: <20180724130004.ynaiabshexrrbvo4@flea>
References: <20180724101522.68165-1-manu@freebsd.org>
 <20180724101522.68165-5-manu@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n7andq7ge7wxicoh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180724101522.68165-5-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@freebsd.org>
Cc: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--n7andq7ge7wxicoh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2018 at 12:15:22PM +0200, Emmanuel Vadot wrote:
> The SID controller on H5 look the same as the one present in the A64.
> But in case we find some difference one day at a compatible string
> of it's own and a fallback to the A64 one.
>=20
> Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h5.dtsi
> index 62d646baac3c..28183bf77164 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> @@ -129,3 +129,8 @@
>  		     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>  	compatible =3D "allwinner,sun50i-h5-pinctrl";
>  };
> +
> +&sid {
> +	compatible =3D "allwinner,sun50i-h5-sid",
> +		     "allwinner,sun50i-a64-sid";
> +};

This is still a bit pointless, please remove the common node.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--n7andq7ge7wxicoh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltXItMACgkQ0rTAlCFN
r3RA6Q/9FZ93P4fpJVgHH8WVXDIc5wZmYnnNi3RYavhpwuFfDym2AKSSlLBqxaUv
HLnoC9zXL8e2B1GoUUv9R5ijXBF0DbPHA+lPJd190l3RmK5v6lcLEpxz0Qtx8BM1
a4uBVvyt5e4mn3uOyYGCpDAmy1HhOX/bq+/ZnS910FgIC8pnKX+IA5ICVQven1ly
ANOdXwy50XU3wxufO3VgRVcGFndzjjJRJ9b0a/cG8nfNQw3KkrWm6oljhW2x2VZe
5sg3vaovyfOum0u4mML1n3iaYa/oEqrZKKEfAdyD3cGRgZ7W8Ts3pEBgL4bReZYx
S8dF4yQXqwpY+6QskP7NTujnU2trRikW3VNfNPyc1FSk6RmX4b/GOzbX7TEynQR/
AxOquX///1icF95MFfOo2CADAXWp+b52lfuWtXMFspeY2tblKDEp0fa5whwiFjQ5
R0KAFlW9g296Hv0o+qOage08UwzIGSVxlmcjVtvS6IX10MR5V0BABB23Q1l5z6f0
psACGCFQD0qGXL4icTwVibPTgZ/m7aRmuQAXcbsHKkcaTuLuSNYM4qi7X2+mn/Lv
1jtJY634eHpSdOV8N/p9d1qmbXjg46vGtp9J77KUNuwV/YwtRPwS8PGgm4Wl9CfU
i4Lwb+1vVEvqxjRTQ72XKEJR5hH1xhZT4kTkoWjrnBHaFcQh+rs=
=nrHG
-----END PGP SIGNATURE-----

--n7andq7ge7wxicoh--
