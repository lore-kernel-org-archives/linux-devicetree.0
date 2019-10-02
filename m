From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 03/11] dt-bindings: crypto: Add DT bindings
 documentation for sun8i-ce Crypto Engine
Date: Wed, 2 Oct 2019 07:54:58 +0200
Message-ID: <20191002055458.zo2vdbxodj3ch53g@gilmour>
References: <20191001184141.27956-1-clabbe.montjoie@gmail.com>
 <20191001184141.27956-4-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2fgyg66uvun6eeak"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191001184141.27956-4-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: catalin.marinas@arm.com, davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, will@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--2fgyg66uvun6eeak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2019 at 08:41:33PM +0200, Corentin Labbe wrote:
> This patch adds documentation for Device-Tree bindings for the
> Crypto Engine cryptographic accelerator driver.
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
>  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
>
> diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
> new file mode 100644
> index 000000000000..9bd26a2eff33
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/allwinner,sun8i-ce.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner Crypto Engine driver
> +
> +maintainers:
> +  - Corentin Labbe <clabbe.montjoie@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun8i-h3-crypto
> +      - allwinner,sun8i-r40-crypto
> +      - allwinner,sun50i-a64-crypto
> +      - allwinner,sun50i-h5-crypto
> +      - allwinner,sun50i-h6-crypto
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: Module clock
> +      - description: MBus clock
> +    minItems: 2
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +      - const: ram
> +    minItems: 2
> +    maxItems: 3
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: bus
> +
> +if:
> +  properties:
> +    compatible:
> +      items:
> +        const: allwinner,sun50i-h6-crypto
> +then:
> +  properties:
> +      clocks:
> +        minItems: 3
> +      clock-names:
> +        minItems: 3
> +else:
> +  properties:
> +      clocks:
> +        maxItems: 2
> +      clock-names:
> +        maxItems: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +additionalProperties: true

I guess you meant false here?

Maxime

--2fgyg66uvun6eeak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZQ7rQAKCRDj7w1vZxhR
xdFbAQCEkUlhME2ax9rLhbr3MrlsTcoOQtlq/F3s52pxJLaI3QD+OMbHPPV//HCY
MPqSdqIOu1r5jzZjtXPgjsZTo4VsqAo=
=m0Hw
-----END PGP SIGNATURE-----

--2fgyg66uvun6eeak--
