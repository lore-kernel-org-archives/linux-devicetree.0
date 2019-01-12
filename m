From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH lora-next 2/4] dt-bindings: lora: sx125x: add basic
 documentation
Date: Sat, 12 Jan 2019 04:48:44 +0100
Message-ID: <20191f9a-46b9-2ad1-d56b-7af302589f93@suse.de>
References: <20190108084132.10214-1-ben.whitten@gmail.com>
 <20190108084132.10214-2-ben.whitten@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108084132.10214-2-ben.whitten@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>
Cc: linux-lpwan@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Am 08.01.19 um 09:41 schrieb Ben Whitten:
> The sx125x family are IQ radio transceivers from Semtech configured over
> SPI, they are typically connected to an sx130x series concentrator however
> may be connected to a host directly.

"SX125x" and "SX130x"

> 
> Required properties include the radio number of the host or concentrator
> bus.
> 
> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
>  .../bindings/lora/semtech,sx125x.yaml         | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/lora/semtech,sx125x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/lora/semtech,sx125x.yaml b/Documentation/devicetree/bindings/lora/semtech,sx125x.yaml
> new file mode 100644
> index 000000000000..5eadec860b70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/lora/semtech,sx125x.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/lora/semtech,sx125x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Semtech IQ modulator/de-modulator transeiver
> +
> +maintainers:
> +  - Andreas Färber <afaerber@suse.de>
> +  - Ben Whitten <ben.whitten@gmail.com>
> +
> +description: |
> +  The sx125x family are highly integrated RF front-end to digital I and Q
> +  modulator/demodulator Multi-PHY mode transceiver capable of supporting
> +  multiple constant and non-constant envelope modulation schemes.

"SX125x"

"are ... transceivers"

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - semtech,sx1255
> +        - semtech,sx1257
> +        - semtech,sx1258

Do we need all three? Probably yes for the concentrator to make decisions?

> +
> +  reg:
> +    maxItems: 1
> +    description: The chip select on the SPI bus or radio number in concentrator.

", with radio A = 0 and radio B = 1."

> +
> +  spi-max-frequency:
> +    maximum: 10000000
> +    default: 8000000
> +    description: The frequency of the SPI communication to the radio,
> +      in Hz. Maximum SPI frequency is 10MHz.

If on the concentrator's SPI bus then this is unused. You don't mark it
required below, so maybe add a textual note?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    radio0: lora@0 {
> +      compatible = "semtech,sx1257";
> +      reg = <0>;
> +    };

If you compare my sx127x implementation, should we prepare a
"radio-frequency" (or "radio-center-frequency") property for the
antenna, to preconfigure the driver during probe? Contents would then be
<868000000>, for example.

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
