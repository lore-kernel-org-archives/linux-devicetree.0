From: Ben Whitten <benwhitten@gmail.com>
Subject: Re: [PATCH v3 lora-next 3/4] dt-bindings: lora: sx125x: add clock bindings
Date: Thu, 24 Jan 2019 15:03:57 +0000
Message-ID: <CAF3==isnHSCAS=Q7HjUgOgjTyYs=xBbK69J7QUEv7i9kVZjPNg@mail.gmail.com>
References: <20190124145309.21698-1-ben.whitten@lairdtech.com> <20190124145309.21698-4-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190124145309.21698-4-ben.whitten@lairdtech.com>
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-lpwan@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Missed linux-lpwan

On Thu, 24 Jan 2019 at 14:53, Ben Whitten <ben.whitten@gmail.com> wrote:
>
> From: Ben Whitten <ben.whitten@gmail.com>
>
> The SX125x consumes a clock (FXOSC) ranging from 32 to 36 MHz as its main
> XTAL. It may also consume a clock for the TX synthesizer or DAC input clock
> (FCLK_IN).
> If the radio is coupled with an SX130x the radio is therefor operating in
> master mode and it may also provide a gated version of FXOSC clock for the
> concentrator. In this case the concentrator is expecting a 32 MHz input
> clock.
>
> In the example we connect fxosc to the "txco" clock source, represented by a
> fixed clock. The radio also provides a clock output "fclk_out" for
> consumption by the SX130x concentrator.
>
> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
> v2 -> v3:
> * Name clock inputs and outputs
> * Add FCLK_IN
> v1 -> v2:
> * Fixed incorrect usage of clock cells
> * Fixed wording in commit and descriptions
> * Dropped enforced clock names
> ---
>  .../bindings/net/lora/semtech,sx125x.yaml     | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
> index fe2d2a23c28b..be45bcfd97be 100644
> --- a/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
> +++ b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
> @@ -27,12 +27,41 @@ properties:
>      description: The chip select on the SPI bus or radio number in concentrator
>        , with radio A = 0 and radio B = 1.
>
> +  clocks:
> +    maxItems: 2
> +    description: Input clock (FXOSC) provider with output ranging from 32 MHz
> +      to 36 MHz. TX synthesizer or DAC input clock (FCLK_IN) provider with
> +      output ranging from 32 MHz to 36 MHz.
> +
> +  clock-names:
> +    items:
> +      - const: fxosc
> +      - const: fclk_in
> +    description: Input clock (FXOSC), TX synthesizer or DAC input clock
> +      (FCLK_IN)
> +
> +  clock-output-names:
> +    items:
> +      - const: fclk_out
> +    description: Output clock (FCLK_OUT) name, clock is gated version of the
> +      input (FXOSC). Used in master mode operation.
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
>      spi {
>        #address-cells = <1>;
>        #size-cells = <0>;
> @@ -40,5 +69,9 @@ examples:
>        radio0: radio@0 {
>          compatible = "semtech,sx1257";
>          reg = <0>;
> +        clocks = <&tcxo>;
> +        clock-names = "fxosc";
> +        clock-output-names = "fclk_out";
> +        #clock-cells = <0>;
>        };
>      };
> --
> 2.17.1
>
