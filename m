Return-Path: <SRS0=KLoA=G6=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH v8 1/2] dt-bindings: Add vendor prefix and docs for
 CR0014114
References: <20180328185616.27711-2-oleg@kaa.org.ua>
 <20180402125350.2679-1-oleg@kaa.org.ua>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <521d74ae-91c8-d3e0-ac86-11a77cde8dca@gmail.com>
Date: Mon, 9 Apr 2018 21:18:36 +0200
MIME-Version: 1.0
In-Reply-To: <20180402125350.2679-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

We're missing DT maintainer ack for this patch.
especially for the part adding a new vendor prefix.

Could we get one?

Best regards,
Jacek Anaszewski

On 04/02/2018 02:53 PM, Oleh Kravchenko wrote:
> add vendor prefix for Crane;
> add documentation and example for dt-bindings CR0014114.
> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../devicetree/bindings/leds/leds-cr0014114.txt    | 54 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> new file mode 100644
> index 000000000000..4255b19ad25c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> @@ -0,0 +1,54 @@
> +Crane Merchandising System - cr0014114 LED driver
> +-------------------------------------------------
> +
> +This LED Board is widely used in vending machines produced
> +by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible: "crane,cr0014114"
> +
> +Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
> +apply. In particular, "reg" and "spi-max-frequency" properties must be given.
> +
> +LED sub-node properties:
> +- label :
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger : (optional)
> +	see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example
> +-------
> +
> +led-controller@0 {
> +	compatible = "crane,cr0014114";
> +	reg = <0>;
> +	spi-max-frequency = <50000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	led@0 {
> +		reg = <0>;
> +		label = "red:coin";
> +	};
> +	led@1 {
> +		reg = <1>;
> +		label = "green:coin";
> +	};
> +	led@2 {
> +		reg = <2>;
> +		label = "blue:coin";
> +	};
> +	led@3 {
> +		reg = <3>;
> +		label = "red:bill";
> +	};
> +	led@4 {
> +		reg = <4>;
> +		label = "green:bill";
> +	};
> +	led@5 {
> +		reg = <5>;
> +		label = "blue:bill";
> +	};
> +	...
> +};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index b5f978a4cac6..8e1f0af48aed 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -75,6 +75,7 @@ cnxt	Conexant Systems, Inc.
>  compulab	CompuLab Ltd.
>  cortina	Cortina Systems, Inc.
>  cosmic	Cosmic Circuits
> +crane	Crane Connectivity Solutions
>  creative	Creative Technology Ltd
>  crystalfontz	Crystalfontz America, Inc.
>  cubietech	Cubietech, Ltd.
> 
