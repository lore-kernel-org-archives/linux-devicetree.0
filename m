From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] dt-bindings: Add YAML description for Allwinner boards
Date: Fri, 15 Mar 2019 19:37:41 +0800
Message-ID: <CAGb2v66gXDU=Bt204dr_6yvUWCg_e0qZ0X+oDTwNjgjTsD2kyQ@mail.gmail.com>
References: <20190315093651.24978-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315093651.24978-1-maxime.ripard@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 15, 2019 at 5:37 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> We've never had a board compatibles documentation for the Allwinner boards
> so far.
>
> Let's create a json-schema for them.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../devicetree/bindings/arm/sunxi.yaml        | 792 ++++++++++++++++++
>  1 file changed, 792 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/sunxi.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> new file mode 100644
> index 000000000000..b34d9c5b7fd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -0,0 +1,792 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR X11)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/sunxi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner platforms device tree bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +

[...]

> +      - description: Sinovoip BananaPi M1 Plus
> +        items:
> +          - const: sinovoip,bpi-m1-plus
> +          - const: allwinner,sun7i-a20
> +
> +      - description: Sinovoip BananaPi M2
> +        items:
> +          - const: sinovoip,bpi-m2
> +          - const: allwinner,sun6i-a31s
> +
> +      - description: Sinovoip BananaPi M2 Berry
> +        items:
> +          - const: sinovoip,bpi-m2-berry
> +          - const: allwinner,sun8i-r40
> +
> +      - description: Sinovoip BananaPi M2 Plus
> +        items:
> +          - const: sinovoip,bpi-m2-plus
> +          - const: allwinner,sun8i-h3
> +
> +      - description: Sinovoip BananaPi M2 Plus
> +        items:
> +          - const: sinovoip,bpi-m2-plus
> +          - const: allwinner,sun50i-h5
> +
> +      - description: Sinovoip BananaPi M2 Plus v1.2
> +        items:
> +          - const: bananapi,bpi-m2-plus-v1.2
> +          - const: allwinner,sun8i-h3
> +
> +      - description: Sinovoip BananaPi M2 Plus v1.2
> +        items:
> +          - const: bananapi,bpi-m2-plus-v1.2
> +          - const: allwinner,sun50i-h5
> +
> +      - description: Sinovoip BananaPi M2 Magic
> +        items:
> +          - const: sinovoip,bananapi-m2m
> +          - const: allwinner,sun8i-a33
> +
> +      - description: Sinovoip BananaPi M2 Ultra
> +        items:
> +          - const: sinovoip,bpi-m2-ultra
> +          - const: allwinner,sun8i-r40
> +
> +      - description: Sinovoip BananaPi M2 Zero
> +        items:
> +          - const: sinovoip,bpi-m2-zero
> +          - const: allwinner,sun8i-h2-plus
> +
> +      - description: Sinovoip BananaPi M3
> +        items:
> +          - const: sinovoip,bpi-m3
> +          - const: allwinner,sun8i-a83t
> +
> +      - description: Sinovoip BananaPi M64
> +        items:
> +          - const: sinovoip,bananapi-m64
> +          - const: allwinner,sun50i-a64

Any chance we could rename and list them as just BananaPi xxx?

When the BananaPi-R2 was mainlined, I asked the submitter to ask them
whether the vendor was Sinovoip or Bananapi, and they (Bananapi team)
said it was Bananapi.

We managed to convert a few (the BPI-M2+), but most still carry the
Sinovoip name.

ChenYu
