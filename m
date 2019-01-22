From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 lora-next 1/4] dt-bindings: lora: sx130x: add basic documentation
Date: Tue, 22 Jan 2019 14:04:10 -0600
Message-ID: <CAL_JsqJK_UN1pqce-VxJ=gog9OMoz9nUZ6XeQD9jJf+3aLBaUA@mail.gmail.com>
References: <20190122180729.1834-1-ben.whitten@lairdtech.com> <20190122180729.1834-2-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190122180729.1834-2-ben.whitten@lairdtech.com>
Sender: netdev-owner@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, netdev <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-lpwan@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 22, 2019 at 12:07 PM Ben Whitten <ben.whitten@gmail.com> wrote:
>
> From: Ben Whitten <ben.whitten@gmail.com>
>
> Add basic documentation in YAML format for the SX130x series concentrator=
s
> from Semtech.
> Required is; the location on the SPI bus and the compatible string.
>
> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
> v1 -> v2:
> * Dropped reset-gpios, radio-spi from required.
> * Dropped spi-max-frequency from binding.
> * Changed compatible to allow fallback from SX1308 to SX1301.
> * Wording changes in commit and descriptions.
> * Dual licence
> * Incorperate Robs comments on child node and spi wrapper
> ---
>  .../bindings/net/lora/semtech,sx130x.yaml     | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx=
130x.yaml
>
> diff --git a/Documentation/devicetree/bindings/net/lora/semtech,sx130x.ya=
ml b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
> new file mode 100644
> index 000000000000..41919fb67ec4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/lora/semtech,sx130x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Semtech LoRa concentrator
> +
> +maintainers:
> +  - Andreas F=C3=A4rber <afaerber@suse.de>
> +  - Ben Whitten <ben.whitten@gmail.com>
> +
> +description: |
> +  Semtech LoRa concentrator SX130x digital baseband chip is capable of
> +  demodulating LoRa signals on 8 channels simultaneously.
> +
> +  It is typically paired with two SX125x IQ radios controlled over an
> +  SPI directly from the concentrator.
> +
> +  The concentrator itself is controlled over SPI.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - semtech,sx1308
> +      - enum:
> +        - semtech,sx1301

I think you want:

oneOf:
  - items:
      - enum:
          - semtech,sx1308
      - const: semtech,sx1301
  - items:
      - const: semtech,sx1301

That covers these 2 cases:
"semtech,sx1308", "semtech,sx1301"
"semtech,sx1301"

> +
> +  reg:
> +    maxItems: 1
> +    description: The chip select on the SPI bus.
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: A connection of the reset gpio line.
> +
> +  radio-spi:
> +    type: object
> +    description: The concentrator can have two radios connected which ar=
e
> +      contained within the following node.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^[a-zA-Z0-9]@[0-1]$":

Is any node name allowed? We like to have generic names. 'lora' is
fine for me, but I'm don't know if other devices could be attached?

I thought up to 8 concentrators was supported? Or channels and radios
aren't 1-1?

This too should have 'type: object' since it is a node name.

> +        properties:
> +          reg:
> +            maxItems: 1

You can add:
minimum: 0
maximum: 1 (or 7?)

> +        required:
> +          - reg
> +
> +    required:
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      concentrator0: lora@0 {
> +        compatible =3D "semtech,sx1301";
> +        reg =3D <0>;
> +        reset-gpios =3D <&pioB 27 GPIO_ACTIVE_HIGH>;
> +        spi-max-frequency =3D <8000000>;
> +
> +        radio-spi {
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          radio0: lora@0 {
> +            compatible =3D "semtech,sx1257";
> +            reg =3D <0>;
> +          };
> +
> +          radio1: lora@1 {
> +            compatible =3D "semtech,sx1257";
> +            reg =3D <1>;
> +          };
> +        };
> +      };
> +    };
> --
> 2.17.1
>
