From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH lora-next 4/4] dt-bindings: lora: sx130x: add clock
 bindings
Date: Sat, 12 Jan 2019 05:44:47 +0100
Message-ID: <56999005-89ca-c98c-0f5b-48eda15ea9fa@suse.de>
References: <20190108084132.10214-1-ben.whitten@gmail.com>
 <20190108084132.10214-4-ben.whitten@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190108084132.10214-4-ben.whitten@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>
Cc: linux-lpwan@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

Am 08.01.19 um 09:41 schrieb Ben Whitten:
> The sx130x family consumes two clocks, a 32MHz clock provided by a
> connected IQ transceiver, and a 133MHz high speed clock.
> 
> In the example we connect the concentrator to output 0 of a fixed clock
> providing the 133MHz high speed clock, and we connect to output 0 of a
> connected transceiver 32MHz clock.
> 
> The connected radios are both fed from output 0 of a fixed 32MHz clock,
> with only one being the clock source back with one output to the
> sx130x concentrator.

No, no, no... See below.

> 
> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
>  .../{ => net}/lora/semtech,sx130x.yaml        | 39 ++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{ => net}/lora/semtech,sx130x.yaml (62%)
> 
> diff --git a/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
> similarity index 62%
> rename from Documentation/devicetree/bindings/lora/semtech,sx130x.yaml
> rename to Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
> index ad263bc4e60d..23a096ca2912 100644
> --- a/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml
> +++ b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
> @@ -15,7 +15,8 @@ description: |
>    demodulating LoRa signals on 8 channels simultaneously.
>  
>    It is typically paired with two sx125x IQ radios controlled over an
> -  SPI directly from the concentrator.
> +  SPI directly from the concentrator. One of the radios will provide
> +  a 32MHz clock back into the concentrator.

The SX125x does not seem to document the frequency of the output clock,
so I assume it's pass-through of whatever went in, and 32 MHz seems
correct for the SX130x input side.

>  
>    The concentrator itself it controlled over SPI.
>  
> @@ -41,6 +42,20 @@ properties:
>        in Hz. Maximum SPI frequency is 10MHz although 8MHz is typically used
>        on a number of cards.
>  
> +  clocks:
> +    maxItems: 2
> +    items:
> +      - description: 32MHz clock provider
> +      - description: 133MHz high speed clock provider
> +    description: The chip requires two clock inputs; A 32MHz clock at CMOS
> +      level which is provided from a connected radio.
> +      And a 133MHz high speed clock at CMOS level provided by an oscillator.
> +
> +  clock-names:
> +    items:
> +      - const: clk32m

The pin is called CLK32M; in the specs there's XTAL32F/XTAL32T.

> +      - const: clkhs

The pin is called CLKHS; in the specs it's HSC_F.

So I assume both names are good, but wanted to double-check.

> +
>    radio-spi:
>      description: The concentrator has two radios connected which are contained
>        within the following node.
> @@ -64,11 +79,27 @@ required:
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
> +    clkhs: dummy133m {
> +      compatible = "fixed-clock";
> +      clock-frequency = <133000000>;
> +      clock-output-names = "clkhs";
> +      #clock-cells = <0>;
> +    };
> +
>      concentrator0: lora@0 {
>        compatible = "semtech,sx1301";
>        reg = <0>;
>        reset-gpios = <&pioB 27 GPIO_ACTIVE_HIGH>;
>        spi-max-frequency = <8000000>;
> +      clocks = <&radio1 0>, <&clkhs 0>;

Once again, this is wrong use of #clock-cells: <&radio1>, <&clkhs>
Otherwise you have four clocks, and your "clkhs" will be <0>.

> +      clock-names = "clk32m", "clkhs";
>  
>        radio-spi {
>          #address-cells = <1>;
> @@ -77,11 +108,17 @@ examples:
>          radio0: lora@0 {
>            compatible = "semtech,sx1257";
>            reg = <0>;
> +          clocks = <&tcxo 0>;

Ditto, <&tcxo>.

> +          clock-names = "tcxo";
>          };
>  
>          radio1: lora@1 {
>            compatible = "semtech,sx1257";
>            reg = <1>;
> +          clocks = <&tcxo 0>;

<&tcxo>

> +          clock-names = "tcxo";
> +          clock-output-names = "clk32m";
> +          #clock-cells = <0>;
>          };
>        };
>      };

This example may need to be updated to use a fixed-clock instead of the
radio'S output, due to unsolved clk provider implementation problems
that will render the example unusable.

Same as for the radio, we should also prepare optional regulator inputs.
There's at least 1.8 V and 3.3 V supplies here.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
