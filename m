From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH RFC] dt-bindings: regulator: define a mux regulator
Date: Tue, 20 Aug 2019 11:39:27 -0500
Message-ID: <CAL_JsqLg19883syn66P6zUkLPpQ8FYpeFj2QYvSp1UsWOhVKyQ@mail.gmail.com>
References: <20190820152511.15307-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820152511.15307-1-u.kleine-koenig@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 10:25 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> A mux regulator is used to provide current on one of several outputs. It
> might look as follows:
>
>       ,------------.
>     --<OUT0     A0 <--
>     --<OUT1     A1 <--
>     --<OUT2     A2 <--
>     --<OUT3        |
>     --<OUT4     EN <--
>     --<OUT5        |
>     --<OUT6     IN <--
>     --<OUT7        |
>       `------------'
>
> Depending on which address is encoded on the three address inputs A0, A1
> and A2 the current provided on IN is provided on one of the eight
> outputs.
>
> What is new here is that the binding makes use of a #regulator-cells
> property. This uses the approach known from other bindings (e.g. gpio)
> to allow referencing all eight outputs with phandle arguments. This
> requires an extention in of_get_regulator to use a new variant of
> of_parse_phandle_with_args that has a cell_count_default parameter that
> is used in absence of a $cell_name property. Even if we'd choose to
> update all regulator-bindings to add #regulator-cells =3D <0>; we still
> needed something to implement compatibility to the currently defined
> bindings.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> the obvious alternative is to add (here) eight subnodes to represent the
> eight outputs. This is IMHO less pretty, but wouldn't need to introduce
> #regulator-cells.

I'm okay with #regulator-cells approach.

>
> Apart from reg =3D <..> and a phandle there is (I think) nothing that
> needs to be specified in the subnodes because all properties of an
> output (apart from the address) apply to all outputs.
>
> What do you think?
>
> Best regards
> Uwe
>
>  .../bindings/regulator/mux-regulator.yaml     | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mux-regul=
ator.yaml
>
> diff --git a/Documentation/devicetree/bindings/regulator/mux-regulator.ya=
ml b/Documentation/devicetree/bindings/regulator/mux-regulator.yaml
> new file mode 100644
> index 000000000000..f06dbb969090
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mux-regulator.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: GPL-2.0

(GPL-2.0-only OR BSD-2-Clause) is preferred.


> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mux-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MUX regulators
> +
> +properties:
> +  compatible:
> +    const: XXX,adb708

? I assume you will split this into a common and specific schemas. I
suppose there could be differing ways to control the mux just like all
other muxes.

> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  address-gpios:
> +    description: Array of typically three GPIO pins used to select the
> +      regulator's output. The least significant address GPIO must be lis=
ted
> +      first. The others follow in order of significance.
> +    minItems: 1
> +
> +  "#regulator-cells":

How is this not required?

> +    const: 1
> +
> +  regulator-name:
> +    description: A string used to construct the sub regulator's names
> +    $ref: "/schemas/types.yaml#/definitions/string"
> +
> +  supply:
> +    description: input supply
> +
> +required:
> +  - compatible
> +  - regulator-name
> +  - supply
> +
> +
> +examples:
> +  - |
> +    mux-regulator {
> +      compatible =3D "regulator-mux";
> +
> +      regulator-name =3D "blafasel";
> +
> +      supply =3D <&muxin_regulator>;
> +
> +      enable-gpios =3D <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +      address-gpios =3D <&gpio2 2 GPIO_ACTIVE_HIGH>,
> +                        <&gpio2 3 GPIO_ACTIVE_HIGH>,
> +                        <&gpio2 4 GPIO_ACTIVE_HIGH>,
> +    };
> +...
> --
> 2.20.1
>
