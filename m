From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: power: syscon-reboot: Convert bindings
 to json-schema
Date: Tue, 3 Sep 2019 08:14:43 +0100
Message-ID: <CAL_JsqK_O+7zQDGxAhAHDW=AkMy+RtyijTXUuRStOgu8CYXe0g@mail.gmail.com>
References: <20190902150336.3600-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190902150336.3600-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:THERMAL" <linux-pm@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 2, 2019 at 4:03 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Convert the Syscon reboot bindings to DT schema format using
> json-schema.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/power/reset/syscon-reboot.txt    | 30 --------
>  .../bindings/power/reset/syscon-reboot.yaml   | 68 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
>  create mode 100644 Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml

> diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> new file mode 100644
> index 000000000000..a583f3dc8ef4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/reset/syscon-reboot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic SYSCON mapped register reset driver
> +
> +maintainers:
> +  - Sebastian Reichel <sre@kernel.org>
> +
> +description: |+
> +  This is a generic reset driver using syscon to map the reset register.
> +  The reset is generally performed with a write to the reset register
> +  defined by the register map pointed by syscon reference plus the offset
> +  with the value and mask defined in the reboot node.
> +  Default will be little endian mode, 32 bit access only.
> +
> +properties:
> +  compatible:
> +    const: syscon-reboot
> +
> +  mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Update only the register bits defined by the mask (32 bit).
> +    maxItems: 1

Drop this as that is already defined for uint32.

It also doesn't actually work. The $ref has to be under an 'allOf' if
you have additional schemas. A quirk of json-schema...

> +
> +  offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Offset in the register map for the reboot register (in bytes).
> +    maxItems: 1
> +
> +  regmap:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the register map node.
> +    maxItems: 1
> +
> +  value:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The reset value written to the reboot register (32 bit access).
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - regmap
> +  - offset
> +
> +allOf:
> +  - if:
> +      properties:
> +        value:
> +          not:
> +            type: array

I think you could make this a bit more readable with:

if:
  not:
    required:
      - value

However, if the tree is free of legacy usage, then you could just drop all this.

Rob
