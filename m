From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 lora-next 3/4] dt-bindings: lora: sx125x: add clock bindings
Date: Tue, 22 Jan 2019 14:12:27 -0600
Message-ID: <CAL_JsqJfm6Pbg0CEzfNtd-aXMi8nAwt_8nZA0_Xs=4p1=cB1Kw@mail.gmail.com>
References: <20190122180729.1834-1-ben.whitten@lairdtech.com> <20190122180729.1834-4-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190122180729.1834-4-ben.whitten@lairdtech.com>
Sender: netdev-owner@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, netdev <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-lpwan@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 22, 2019 at 12:07 PM Ben Whitten <ben.whitten@gmail.com> wrote:
>
> From: Ben Whitten <ben.whitten@gmail.com>
>
> The SX125x consumes a clock (FXOSC) ranging from 32 to 36 MHz.
> If the radio is coupled with an SX130x the radio is therefor operating in
> master mode and it may also provide a gated version of this clock for the
> concentrator. In this case the concentrator is expecting a 32 MHz input
> clock.
>
> In the example we connect to the "txco" clock source, represented by a
> fixed clock. The radio also provides a clock output named "clk32m" for
> consumption by the SX130x concentrator.

You can squash the clock patches into the 1st 2 patches if you want.

> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
> v1 -> v2:
> * Fixed incorrect usage of clock cells
> * Fixed wording in commit and descriptions
> * Dropped enforced clock names
> ---
>  .../bindings/net/lora/semtech,sx125x.yaml     | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
> index 4a51a251d97f..8287472fd545 100644
> --- a/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
> +++ b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
> @@ -27,12 +27,36 @@ properties:
>      description: The chip select on the SPI bus or radio number in concentrator
>        , with radio A = 0 and radio B = 1.
>
> +  clocks:
> +    maxItems: 1
> +    description: Input clock (FXOSC) provider with output ranging from 32 MHz
> +      to 36 MHz.
> +
> +  clock-names:
> +    maxItems: 1

This needs to say what the names are:

items:
  - const: txco

With that, you can drop maxItems as that is implied if we list the items.

Just to be clear, this name should be what the clock input is called,
not what drives the input. Seems like that would be 'fxosc'?

> +    description: Input clock (FXOSC) name from provider.
> +
> +  clock-output-names:
> +    maxItems: 1

This too should list the actual names.

> +    description: Output clock (CLK_OUT) name, clock is gated version of the
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
> @@ -40,5 +64,9 @@ examples:
>        radio0: lora@0 {
>          compatible = "semtech,sx1257";
>          reg = <0>;
> +        clocks = <&tcxo>;
> +        clock-names = "tcxo";
> +        clock-output-names = "clk32m";
> +        #clock-cells = <0>;
>        };
>      };
> --
> 2.17.1
>
