From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 05/11] ARM: dts: sun8i: H3: Add Crypto Engine node
Date: Wed, 2 Oct 2019 08:02:14 +0200
Message-ID: <20191002060214.bu67nkd3y6puknrb@gilmour>
References: <20191001184141.27956-1-clabbe.montjoie@gmail.com>
 <20191001184141.27956-6-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3967434727732164944=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191001184141.27956-6-clabbe.montjoie@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, herbert@gondor.apana.org.au, catalin.marinas@arm.com, linux-sunxi@googlegroups.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-crypto@vger.kernel.org, will@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3967434727732164944==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m5s3egvksjuih2k6"
Content-Disposition: inline


--m5s3egvksjuih2k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2019 at 08:41:35PM +0200, Corentin Labbe wrote:
> The Crypto Engine is a hardware cryptographic accelerator that supports
> many algorithms.
> It could be found on most Allwinner SoCs.
>
> This patch enables the Crypto Engine on the Allwinner H3 SoC Device-tree.
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
> index e37c30e811d3..778a23a794c9 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -153,6 +153,17 @@
>  			allwinner,sram = <&ve_sram 1>;
>  		};
>
> +		crypto: crypto@1c15000 {
> +			compatible = "allwinner,sun8i-h3-crypto";
> +			reg = <0x01c15000 0x1000>;
> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "ce_ns";

That's not documented in the binding (and I guess unnecessary)

> +			resets = <&ccu RST_BUS_CE>;
> +			reset-names = "bus";
> +			clocks = <&ccu CLK_BUS_CE>, <&ccu CLK_CE>;
> +			clock-names = "bus", "mod";

Nit: we put the clocks before the resets usually

Maxime

--m5s3egvksjuih2k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZQ9ZQAKCRDj7w1vZxhR
xQ12AP4v8ngYjx24mlHXpcMOKB1UPEpZ7nVs0R3Z429dTd6YiwD+I2L/8Esrt1co
O1jvbqC8meSjGLU39z/Mr3MOweUa+Q8=
=RT92
-----END PGP SIGNATURE-----

--m5s3egvksjuih2k6--


--===============3967434727732164944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3967434727732164944==--
