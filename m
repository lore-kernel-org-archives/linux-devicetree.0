MIME-Version: 1.0
Date: Wed, 3 Jul 2019 07:53:43 -0600
References: <20190703095513.12340-1-maxime.ripard@bootlin.com>
	<20190703095513.12340-3-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095513.12340-3-maxime.ripard@bootlin.com>
Message-ID: <CAL_JsqKgBXxbg_9ZKfmj6y0s_5Z5QZw3RmdJfSHEpjh84m9brg@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: net: mdio: Add child nodes
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 3, 2019 at 3:55 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The child nodes of a mdio bus are supposed to be ethernet PHYs, with a reg
> property. Make sure that's validated as well.

I don't think this is always true. I seem to recall there's some
timestamping devices connected via mdio.

In any case, it's not a long list of names, so we can probably just
enumerate them as needed. Does this generate any warnings?

>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/mdio.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/mdio.yaml b/Documentation/devicetree/bindings/net/mdio.yaml
> index 24d67074d494..5d08d2ffd4eb 100644
> --- a/Documentation/devicetree/bindings/net/mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/mdio.yaml
> @@ -39,6 +39,20 @@ properties:
>        and must therefore be appropriately determined based on all PHY
>        requirements (maximum value of all per-PHY RESET pulse widths).
>
> +patternProperties:
> +  "^ethernet-phy@[0-9a-f]+$":
> +    type: object
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 31
> +        description:
> +          The ID number for the PHY.
> +
> +    required:
> +      - reg
> +
>  examples:
>    - |
>      davinci_mdio: mdio@5c030000 {
> --
> 2.21.0
>
