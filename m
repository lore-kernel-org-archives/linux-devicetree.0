From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH lora-next 1/4] dt-bindings: lora: sx130x: add basic
 documentation
Date: Sat, 12 Jan 2019 04:37:08 +0100
Message-ID: <3a998d80-1ebd-3105-6517-69e78a04f1bf@suse.de>
References: <20190108084132.10214-1-ben.whitten@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108084132.10214-1-ben.whitten@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>
Cc: linux-lpwan@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Ben,

Am 08.01.19 um 09:41 schrieb Ben Whitten:
> Add basic documentation in YAML format for the sx130x series concentrators
> from Semtech.
> Required is; the location on the SPI bus, the reset gpio and the node for
> downstream IQ radios, typically sx125x.
> 
> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
>  .../bindings/lora/semtech,sx130x.yaml         | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/lora/semtech,sx130x.yaml

Patch 3/4 moves this to net/lora/, which I think is more appropriate.

> 
> diff --git a/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml b/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml
> new file mode 100644
> index 000000000000..ad263bc4e60d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/lora/semtech,sx130x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Semtech LoRa concentrator
> +
> +maintainers:
> +  - Andreas Färber <afaerber@suse.de>
> +  - Ben Whitten <ben.whitten@gmail.com>
> +
> +description: |
> +  Semtech LoRa concentrator sx130x digital baseband chip is capable of

SX130x or SX1301/SX1308, to distinguish from driver name sx130x and to
avoid ambiguities of which x is a wildcard.

> +  demodulating LoRa signals on 8 channels simultaneously.
> +
> +  It is typically paired with two sx125x IQ radios controlled over an

Ditto, SX125x

> +  SPI directly from the concentrator.
> +
> +  The concentrator itself it controlled over SPI.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - semtech,sx1301
> +        - semtech,sx1308

We should only list both if we expect differences between the two
models. Otherwise SX1308 can reuse the SX1301 compatible. If we want to
mark it up just in case then rearranging the above to be a sequence of
"semtech,sx1308", "semtech,sx1301" would be an alternative.

> +
> +  reg:
> +    maxItems: 1
> +    description: The chip select on the SPI bus.

Is this mandatory now or not with maxItems?

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: A connection of the reset gpio line.

This needs to be optional, which I think the maxItems syntax says unlike
the commit message?
On an mPCIe card you won't have such a GPIO, for instance. We do a Soft
Reset, so it's not functionally mandatory.

> +
> +  spi-max-frequency:
> +    maximum: 10000000
> +    default: 8000000
> +    description: The frequency of the SPI communication to the concentrator,
> +      in Hz. Maximum SPI frequency is 10MHz although 8MHz is typically used
> +      on a number of cards.

Do we really need to describe this here? It should be covered in the
common SPI bindings, and only applies to SPI bus, not USB picoGW.

> +
> +  radio-spi:
> +    description: The concentrator has two radios connected which are contained
> +      within the following node.

"can have"

> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    required:
> +      - '#address-cells'
> +      - '#size-cells'

I'm pretty sure that Rob would like to have a compatible here, even if
unneeded in our Linux driver?

BTW if someone has better naming suggestions than "radio-spi"... I just
wanted to avoid having it in the main node directly, in case we need
other sub-nodes, too.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios

Must be optional.

> +  - radio-spi

Should be optional. (Driver needs it today, but that's another problem.)

> +
> +examples:
> +  - |
> +    concentrator0: lora@0 {
> +      compatible = "semtech,sx1301";
> +      reg = <0>;
> +      reset-gpios = <&pioB 27 GPIO_ACTIVE_HIGH>;
> +      spi-max-frequency = <8000000>;
> +
> +      radio-spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        radio0: lora@0 {
> +          compatible = "semtech,sx1257";
> +          reg = <0>;
> +        };
> +
> +        radio1: lora@1 {
> +          compatible = "semtech,sx1257";
> +          reg = <1>;
> +        };
> +      };
> +    };

Thanks for looking into this,

Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
