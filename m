From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: regulator: add regulator-fixed-clock binding
Date: Tue, 17 Sep 2019 15:13:39 -0500
Message-ID: <CAL_JsqLyawEariYuaHJ+Lyt1DhJe9fdAE88ANrhHAokWJhUOdw@mail.gmail.com>
References: <20190910062103.39641-1-philippe.schenker@toradex.com> <20190910062103.39641-4-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910062103.39641-4-philippe.schenker@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Max Krummenacher <max.krummenacher@toradex.com>, Stefan Agner <stefan.agner@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>, Luka Pivk <luka.pivk@toradex.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 1:21 AM Philippe Schenker
<philippe.schenker@toradex.com> wrote:
>
> This adds the documentation to the compatible regulator-fixed-clock.
> This binding is a special binding of regulator-fixed and adds the
> ability to add a clock to regulator-fixed, so the regulator can be
> enabled and disabled with that clock. If the special compatible
> regulator-fixed-clock is used it is mandatory to supply a clock.
>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
>
> ---
>
> Changes in v2:
> - Change select: to if:
> - Change items: to enum:
> - Defined how many clocks should be given
>
>  .../bindings/regulator/fixed-regulator.yaml   | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> index a650b457085d..a78150c47aa2 100644
> --- a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> @@ -19,9 +19,19 @@ description:
>  allOf:
>    - $ref: "regulator.yaml#"
>
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: regulator-fixed-clock
> +  required:
> +    - clocks
> +
>  properties:
>    compatible:
> -    const: regulator-fixed
> +    enum:
> +      - const: regulator-fixed
> +      - const: regulator-fixed-clock

'make dt_binding_check' is failing. You need to drop 'const: '. Please
send a patch to fix this.

Rob
