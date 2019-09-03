From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: regulator: add regulator-fixed-clock binding
Date: Tue, 3 Sep 2019 09:45:13 +0100
Message-ID: <CAL_JsqLnqZ80soGVMvZjAMZvu+K=ebDUz2bM_ZodPp7YRvUnDw@mail.gmail.com>
References: <20190903080336.32288-1-philippe.schenker@toradex.com> <20190903080336.32288-4-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903080336.32288-4-philippe.schenker@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Max Krummenacher <max.krummenacher@toradex.com>, Stefan Agner <stefan.agner@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>, Luka Pivk <luka.pivk@toradex.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 3, 2019 at 9:03 AM Philippe Schenker
<philippe.schenker@toradex.com> wrote:
>
> This adds the documentation to the compatible regulator-fixed-clock

Please explain what that is in this patch.

>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
>
> ---
>
>  .../bindings/regulator/fixed-regulator.yaml    | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> index a650b457085d..5fd081e80b43 100644
> --- a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> @@ -19,9 +19,19 @@ description:
>  allOf:
>    - $ref: "regulator.yaml#"
>
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: regulator-fixed-clock
> +  required:
> +    - clocks

You don't need this.

If you add a new compatible, then this should probably be a new schema
doc. Is the 'gpio' property valid in this case as if a clock is the
enable, can you also have a gpio enable? That said, it seems like the
new compatible is only for validating the DT in the driver. You could
just use a clock if present and default to current behavior if not.
It's not the kernel's job to validate DTs.

>
>  properties:
>    compatible:
> -    const: regulator-fixed
> +    items:
> +      - const: regulator-fixed
> +      - const: regulator-fixed-clock

This says you must have 'compatible = "regulator-fixed",
"regulator-fixed-clock";'.

What you want is:

enum:
  - regulator-fixed
  - regulator-fixed-clock

>    regulator-name: true
>
> @@ -29,6 +39,12 @@ properties:
>      description: gpio to use for enable control
>      maxItems: 1
>
> +  clocks:
> +    description:
> +      clock to use for enable control. This binding is only available if
> +      the compatible is chosen to regulator-fixed-clock. The clock binding
> +      is mandatory if compatible is chosen to regulator-fixed-clock.

Need to define how many clocks (maxItems: 1).

> +
>    startup-delay-us:
>      description: startup time in microseconds
>      $ref: /schemas/types.yaml#/definitions/uint32
> --
> 2.23.0
>
