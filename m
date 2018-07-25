Return-Path: <robherring2@gmail.com>
Date: Wed, 25 Jul 2018 14:07:55 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: meson8b: use the registers from
 the HHI syscon
Message-ID: <20180725200755.GA24555@rob-hp-laptop>
References: <20180721192846.18811-1-martin.blumenstingl@googlemail.com>
 <20180721192846.18811-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180721192846.18811-2-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat, Jul 21, 2018 at 09:28:44PM +0200, Martin Blumenstingl wrote:
> The clock controller on Meson8/Meson8m2 and Meson8b is part of a
> register region called "HHI". This register area contains more
> functionality than just a clock controller:
> - the clock controller
> - some reset controller bits
> - temperature sensor calibration data (on Meson8b and Meson8m2 only)
> - HDMI controller
> 
> The HHI register area may be accessed concurrently. Allow this by using
> a "system controller" as parent node.

Why? A single node can be a provider of multiple things. Maybe the HDMI 
should be a child since it will involve graph nodes, but the rest can be 
one node. There should be numerous examples of blocks that are clock and 
reset controllers.

> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/clock/amlogic,meson8b-clkc.txt         | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> index b455c5aa9139..38fb979210d3 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> +++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> @@ -9,15 +9,13 @@ Required Properties:
>  	- "amlogic,meson8-clkc" for Meson8 (S802) SoCs
>  	- "amlogic,meson8b-clkc" for Meson8 (S805) SoCs
>  	- "amlogic,meson8m2-clkc" for Meson8m2 (S812) SoCs
> -- reg: it must be composed by two tuples:
> -	0) physical base address of the xtal register and length of memory
> -	   mapped region.
> -	1) physical base address of the clock controller and length of memory
> -	   mapped region.
> -
>  - #clock-cells: should be 1.
>  - #reset-cells: should be 1.
>  
> +Parent node should have the following properties :
> +- compatible: "syscon", "simple-mfd"

These 2 compatibles alone are not valid.

> +- reg: base address and size of the HHI system control register space.
> +
>  Each clock is assigned an identifier and client nodes can use this identifier
>  to specify the clock which they consume. All available clocks are defined as
>  preprocessor macros in the dt-bindings/clock/meson8b-clkc.h header and can be
> @@ -30,9 +28,8 @@ device tree sources).
>  
>  Example: Clock controller node:
>  
> -	clkc: clock-controller@c1104000 {
> +	clkc: clock-controller {
>  		compatible = "amlogic,meson8b-clkc";
> -		reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
>  	};
> -- 
> 2.18.0
> 
