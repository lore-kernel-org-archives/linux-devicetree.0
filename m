From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: watchdog: Convert Allwinner watchdog to
 a schema
Date: Tue, 13 Aug 2019 15:30:52 -0600
Message-ID: <CAL_JsqJa-_x+QKkuQ2ZTt+tOtJWJ0NhywZMKomQhtShYr7WbTA@mail.gmail.com>
References: <20190813124744.32614-1-mripard@kernel.org> <20190813124744.32614-2-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813124744.32614-2-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 6:47 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The Allwinner SoCs have a watchdog supported in Linux, with a matching
> Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 50 +++++++++++++++++++
>  .../bindings/watchdog/sunxi-wdt.txt           | 22 --------
>  2 files changed, 50 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
>
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> new file mode 100644
> index 000000000000..93df27ec1664
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/allwinner,sun4i-a10-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A10 Watchdog Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun4i-a10-wdt
> +      - const: allwinner,sun6i-a31-wdt
> +      - items:
> +          - const: allwinner,sun50i-a64-wdt
> +          - const: allwinner,sun6i-a31-wdt
> +      - items:
> +          - const: allwinner,sun50i-h6-wdt
> +          - const: allwinner,sun6i-a31-wdt
> +      - items:
> +          - const: allwinner,suniv-f1c100s-wdt
> +          - const: allwinner,sun4i-a10-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  timeout-sec:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Contains the watchdog timeout in seconds.

Can you do a common watchdog schema to include with this and the node
name at least.

Rob
