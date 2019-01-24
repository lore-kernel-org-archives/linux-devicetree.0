From: Ben Whitten <benwhitten@gmail.com>
Subject: Re: [PATCH v3 lora-next 1/4] dt-bindings: lora: sx130x: add basic documentation
Date: Thu, 24 Jan 2019 15:03:24 +0000
Message-ID: <CAF3==itV0RbEcUGM4b1hQYOOg5hddh9x+=SUiWaPuxYQPsgtQw@mail.gmail.com>
References: <20190124145309.21698-1-ben.whitten@lairdtech.com> <20190124145309.21698-2-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124145309.21698-2-ben.whitten@lairdtech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, linux-lpwan@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Missed linux-lpwan
On Thu, 24 Jan 2019 at 14:53, Ben Whitten <ben.whitten@gmail.com> wrote:
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
> v2 -> v3:
> * Corrected fallback notation
> * Limited radio node names from anything to 'radio@'
> v1 -> v2:
> * Dropped reset-gpios, radio-spi from required.
> * Dropped spi-max-frequency from binding.
> * Changed compatible to allow fallback from SX1308 to SX1301.
> * Wording changes in commit and descriptions.
> * Dual licence
> * Incorperate Robs comments on child node and spi wrapper
> ---
>  .../bindings/net/lora/semtech,sx130x.yaml     | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx=
130x.yaml
>
> diff --git a/Documentation/devicetree/bindings/net/lora/semtech,sx130x.ya=
ml b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
> new file mode 100644
> index 000000000000..24fad1218735
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
> @@ -0,0 +1,101 @@
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
> +    oneOf:
> +      - items:
> +        - enum:
> +          - semtech,sx1308
> +        - const: semtech,sx1301
> +      - items:
> +        - const: semtech,sx1301
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
> +      "^radio@[0-1]$":
> +        type: object
> +        properties:
> +          reg:
> +            maxItems: 1
> +            minimum: 0
> +            maximum: 1
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
> +          radio0: radio@0 {
> +            compatible =3D "semtech,sx1257";
> +            reg =3D <0>;
> +          };
> +
> +          radio1: radio@1 {
> +            compatible =3D "semtech,sx1257";
> +            reg =3D <1>;
> +          };
> +        };
> +      };
> +    };
> --
> 2.17.1
>
