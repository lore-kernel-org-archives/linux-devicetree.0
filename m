From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 3/9] dt-bindings: crypto: Add DT bindings documentation
 for sun8i-ce Crypto Engine
Date: Sat, 7 Sep 2019 07:01:16 +0300
Message-ID: <20190907040116.lib532o2eqt4qnvv@flea>
References: <20190906184551.17858-1-clabbe.montjoie@gmail.com>
 <20190906184551.17858-4-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190906184551.17858-4-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 06, 2019 at 08:45:45PM +0200, Corentin Labbe wrote:
> This patch adds documentation for Device-Tree bindings for the
> Crypto Engine cryptographic accelerator driver.
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
>  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
>
> diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
> new file mode 100644
> index 000000000000..bd8ccedd6059
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml

So, usually we're using the first compatible supported here as the
name.

> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/allwinner,sun8i-ce.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner Crypto Engine driver
> +
> +maintainers:
> +  - Corentin Labbe <clabbe@baylibre.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun8i-h3-crypto
> +      - const: allwinner,sun8i-r40-crypto
> +      - const: allwinner,sun50i-a64-crypto
> +      - const: allwinner,sun50i-h5-crypto
> +      - const: allwinner,sun50i-h6-crypto

An enum would be better here, it provides a more obvious error
message.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: allwinner,sun50i-h6-crypto
> +then:
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: Module clock
> +      - description: MBus clock
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: mod
> +      - const: mbus

It looks like there's a reset line on the H6 as well for that
controller (register 0x68c of the CCU, "CE_BGR_REG").

> +else:
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: Module clock
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: mod
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: ahb

This prevents the usage of the additionalProperties property, which
you should really use.

What you can do instead is moving the clocks and clock-names
description under properties, with a minItems of 2 and a maxItems of
3. Then you can restrict the length of that property to either 2 or 3
depending on the case here.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
