From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH 5/5] arm64: allwinner: a64: Add DAI nodes
Date: Wed, 24 Jan 2018 12:02:22 +0100
Message-ID: <20180124110222.cdglyg5m7644xiem@flea.lan>
References: <20180124103943.2062-1-codekipper@gmail.com>
 <20180124103943.2062-6-codekipper@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ou23arkdjxs4kloz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180124103943.2062-6-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ou23arkdjxs4kloz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 24, 2018 at 11:39:43AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Add the DAI blocks to the device tree. I2S0 and I2S1 are for
> connecting to an external codec.
>=20
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 26 +++++++++++++++++++++=
+++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index f060a58f374c..f3354f8c2026 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -419,6 +419,32 @@
>  			status =3D "disabled";
>  		};
> =20
> +		i2s0: i2s@1c22000 {
> +			#sound-dai-cells =3D <0>;
> +			compatible =3D "allwinner,sun8i-h3-i2s";

Same remark than for the spdif, please add a soc-specific compatible.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ou23arkdjxs4kloz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpoZ70ACgkQ0rTAlCFN
r3TwKQ//eHIeVLqD4+Kcjc44NdTPv6wwbvrjhPJ0uAbQx/DpchgvUP9O8JkBLVvq
U15hf7pqbiHFmopO02/9iX7YMLutmTvkGSPrcfaK21xQmU17Kmu+uUdwyGiJhceq
7d3CeUdBRWkOAzSCB6Vo9NDqqfIisUCa9BrM/HWBDuz4loiX4jxAe6b1cKkNe0+Z
KnvZ1HQh20k/sIJ618Bh1JOm8Bu3uJpn0qEh76etzLfqjS9Z+sFxYgC0K4mjnYuu
Ses7X7NUzv7kcK5DnnJGyz6RCJy+LSeyiCMuq9eeDiDAREnrqk+qVkGWGXavDnwu
z9hUDJxY2AU4PDGV4F6X2kzSa1diVSLLywrS/zHc2+0jCPCxAaatY6P5RAbPY1Ba
5NJJ5xv4mTtuitcNRxq6U/SMrEoIRNyqfcpdYzFeKW8EuyLlHXCU8qIStW18Zw9r
OHu0mAYHmQOC+9hktLFUXVuoNMxnjQtrGIXuDjekvbD3IrkGrERUNswE5bk9/FpB
wcgvwj0mBZuTWlyNBqq0HDl/Q8D7qz7cFYzFUV8/FgFpzVoTLYGF+h2/saASY6Jt
yJnBgzDxZk8yATWKX8BTo5vvy7GLd+PrwRs+fk5bUYw26YnxjZYg8ULZnt1Tk/hv
i8YY6FaGzYpxojTQB/cWm+vhdl/mz+lmEm+KI26FxhXSgnplaYc=
=oAon
-----END PGP SIGNATURE-----

--ou23arkdjxs4kloz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
