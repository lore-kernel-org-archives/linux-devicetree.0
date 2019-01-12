From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH lora-next 3/4] dt-bindings: lora: sx125x: add clock
 bindings
Date: Sat, 12 Jan 2019 05:14:23 +0100
Message-ID: <cc85a823-74d4-7c35-16bd-1b278d5df732@suse.de>
References: <20190108084132.10214-1-ben.whitten@gmail.com>
 <20190108084132.10214-3-ben.whitten@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190108084132.10214-3-ben.whitten@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>
Cc: linux-lpwan@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

Am 08.01.19 um 09:41 schrieb Ben Whitten:
> The sx125x consumes a 32MHz clock and if it is coupled with a sx130x
> concentrator may also provide a gated version of this 32MHz for the
> concentrator.

"SX125x", "SX130x", "32 MHz"

> 
> In the example we connect to output 0 of "txco" clock source. The radio
> also provides a single clock output, hence "#clock-cells = <0>", named
> "clk32m" for consumption by the sx130x concentrator.

No, as pointed out before, output 0 with #clock-cells = <0> is wrong!
Either it's 1 and then you can use a single-cell index, or it's 0, in
which case that's the next (invalid) clock.

> 
> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
>  .../{ => net}/lora/semtech,sx125x.yaml        | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  rename Documentation/devicetree/bindings/{ => net}/lora/semtech,sx125x.yaml (67%)
> 
> diff --git a/Documentation/devicetree/bindings/lora/semtech,sx125x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
> similarity index 67%
> rename from Documentation/devicetree/bindings/lora/semtech,sx125x.yaml
> rename to Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml

In wrong patch?

> index 5eadec860b70..c2fb4ac06341 100644
> --- a/Documentation/devicetree/bindings/lora/semtech,sx125x.yaml
> +++ b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
> @@ -33,13 +33,40 @@ properties:
>      description: The frequency of the SPI communication to the radio,
>        in Hz. Maximum SPI frequency is 10MHz.
>  
> +  clocks:
> +    maxItems: 1
> +    description: 32MHz clock provider
> +
> +  clock-names:
> +    items:
> +      - const: txco

The name TCXO and 32 MHz appear to come from the SX1301 manual's
reference example?

In the SX1257 manual I see XTA/XTB connected to an XTAL, and CLK_IN.
Both CLK_IN and CLK_OUT are documented as 36 MHz (page 8). In table 2-4
(page 11) however FXOSC is 32 to 36 MHz, typically 36 MHz; FCLK_IN also
has a range of 32 to 36 MHz there. So I guess we should be having two
named clocks here and be more permissive in the description?

While getting into the hairy details of clock names, we should also
prepare optional properties for supply voltages, in case they come from
some PMIC that needs a regulator drifer. By my count there's 7 inputs:
VBAT1/2/3, VR_PA, VR_ANA1/2, VR_DIG. Do we need a named -supply property
for each?

> +
> +  clock-output-names:
> +    items:
> +      - const: clk32m
> +    description: 32MHz output clock name
> +
> +  '#clock-cells':
> +    const: 0
> +
>  required:
>    - compatible
>    - reg
>  
>  examples:
>    - |
> +    tcxo: dummy32m {
> +      compatible = "fixed-clock";
> +      clock-frequency = <32000000>;
> +      clock-output-names = "tcxo";
> +      #clock-cells = <0>;
> +    };
> +
>      radio0: lora@0 {
>        compatible = "semtech,sx1257";
>        reg = <0>;
> +      clocks = <&tcxo 0>;

just <&tcxo>

> +      clock-names = "tcxo";
> +      clock-output-names = "clk32m";
> +      #clock-cells = <0>;
>      };
> 

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
