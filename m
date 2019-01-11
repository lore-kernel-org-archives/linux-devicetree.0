From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert fixed-clock binding to json-schema
Date: Fri, 11 Jan 2019 09:44:10 -0800
Message-ID: <154722865051.169631.16957443589975628047@swboyd.mtv.corp.google.com>
References: <20190110221903.3990-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110221903.3990-4-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2019-01-10 14:19:01)
> Convert the fixed-clock binding to DT schema format using json-schema.
>=20

Any pointer to the full schema?

> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
[...]
> diff --git a/Documentation/devicetree/bindings/clock/fixed-clock.yaml b/D=
ocumentation/devicetree/bindings/clock/fixed-clock.yaml
> new file mode 100644
> index 000000000000..8b5628463b90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/fixed-clock.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binding for simple fixed-rate clock sources.

Why does title have a full stop?

> +
> +maintainers:
> +  - Michael Turquette <mturquette@baylibre.com>
> +  - Stephen Boyd <sboyd@kernel.org>
> +
> +properties:
> +  compatible:
> +    const: fixed-clock
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clock-frequency: true

Why doesn't this need the $ref: /schemas/types.yaml#/... thing?

> +  clock-accuracy:
> +    description: accuracy of clock in ppb (parts per billion).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  clock-output-names:
> +    maxItems: 1

Is there a schema for strings?

> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clock-frequency
> +
> +additionalProperties: false

Does this always have to be specified even if it's false?

> +
> +examples:
> +  - |
> +    clock {
> +      compatible =3D "fixed-clock";
> +      #clock-cells =3D <0>;
> +      clock-frequency =3D <1000000000>;
> +      clock-accuracy =3D <100>;
> +    };
> +...
>=20

Is the triple dot part of the schema?
