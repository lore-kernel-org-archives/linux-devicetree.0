MIME-Version: 1.0
In-Reply-To: <20180328065312.6584-1-oleg@kaa.org.ua>
References: <20180327164903.6307-2-oleg@kaa.org.ua>
	<20180328065312.6584-1-oleg@kaa.org.ua>
Date: Wed, 28 Mar 2018 10:43:05 -0500
Message-ID: <CAL_Jsq+g+uZdh6zMS05_oR7Ab7L9UKufD4-xeAH1h35HSuqAqg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: Add vendor prefix and docs for CR0014114
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: devicetree@vger.kernel.org, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 28, 2018 at 1:53 AM, Oleh Kravchenko <oleg@kaa.org.ua> wrote:
> add vendor prefix for Crane;
> add documentation and example for dt-bindings CR0014114.
>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../devicetree/bindings/leds/leds-cr0014114.txt    | 51 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> new file mode 100644
> index 000000000000..6e8b135bb59f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> @@ -0,0 +1,51 @@
> +Crane Merchandising System - cr0014114 LED driver
> +-------------------------------------------------
> +
> +This LED Board is widely used in vending machines produced
> +by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible: "crane,cr0014114"
> +
> +LED sub-node properties:
> +- label :
> +       see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger : (optional)
> +       see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example
> +-------
> +
> +led-controller@0 {
> +       compatible = "crane,cr0014114";
> +       reg = <0>;
> +       spi-max-frequency = <50000>;

And they have to be documented above...

> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       led@0 {
> +               reg = <0>;
> +               label = "cr0014114:red:coin";
> +       };
> +       led@1 {
> +               reg = <1>;
> +               label = "cr0014114:green:coin";
> +       };
> +       led@2 {
> +               reg = <2>;
> +               label = "cr0014114:blue:coin";
> +       };
> +       led@3 {
> +               reg = <3>;
> +               label = "cr0014114:red:bill";
> +       };
> +       led@4 {
> +               reg = <4>;
> +               label = "cr0014114:green:bill";
> +       };
> +       led@5 {
> +               reg = <5>;
> +               label = "cr0014114:blue:bill";
> +       };
> +       ...
> +};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index ae850d6c0ad3..f17949c365f5 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -75,6 +75,7 @@ cnxt  Conexant Systems, Inc.
>  compulab       CompuLab Ltd.
>  cortina        Cortina Systems, Inc.
>  cosmic Cosmic Circuits
> +crane  Crane Connectivity Solutions
>  creative       Creative Technology Ltd
>  crystalfontz   Crystalfontz America, Inc.
>  cubietech      Cubietech, Ltd.
> --
> 2.16.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
