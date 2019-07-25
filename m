From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: crypto: Add DT bindings documentation
 for amlogic-crypto
Date: Thu, 25 Jul 2019 16:55:30 -0600
Message-ID: <CAL_JsqLbYwRpNWHGkYbomWLMpum_DXW4OjNNRrwTRM=w86dONw@mail.gmail.com>
References: <1564083776-20540-1-git-send-email-clabbe@baylibre.com> <1564083776-20540-2-git-send-email-clabbe@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564083776-20540-2-git-send-email-clabbe@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe@baylibre.com>
Cc: David Miller <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Kevin Hilman <khilman@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, baylibre-upstreaming@groups.io
List-Id: devicetree@vger.kernel.org

On Thu, Jul 25, 2019 at 1:43 PM Corentin Labbe <clabbe@baylibre.com> wrote:
>
> This patch adds documentation for Device-Tree bindings for the
> Amlogic GXL cryptographic offloader driver.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  .../bindings/crypto/amlogic-gxl-crypto.yaml   | 45 +++++++++++++++++++

Follow the compatible string for the filename: amlogic,gxl-crypto.yaml

>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/amlogic-gxl-crypto.yaml
>
> diff --git a/Documentation/devicetree/bindings/crypto/amlogic-gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic-gxl-crypto.yaml
> new file mode 100644
> index 000000000000..41265e57c00b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/amlogic-gxl-crypto.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual (GPL-2.0 OR BSD-2-Clause) is preferred for new bindings. Not a
requirement though.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/amlogic-gxl-crypto.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic GXL Cryptographic Offloader
> +
> +maintainers:
> +  - Corentin Labbe <clabbe@baylibre.com>
> +
> +properties:
> +  compatible:
> +    oneOf:

Don't need 'oneOf' when there is only 1.

> +      - const: amlogic,gxl-crypto
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: blkmv
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    crypto: crypto@c883e000 {
> +        compatible = "amlogic,gxl-crypto";
> +        reg = <0x0 0xc883e000 0x0 0x36>;

This should throw errors because the default size on examples are 1
cell. But validating the examples with the schema only just landed in
5.3-rc1.

> +        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
> +            <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;

This doesn't match the schema.

> +        clocks = <&clkc CLKID_BLKMV>;
> +        clock-names = "blkmv";
> +    };
> --
> 2.21.0
>
