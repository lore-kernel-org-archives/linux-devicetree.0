From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 5/7] dt-bindings: mfd: Add H6 GPADC binding
Date: Wed, 8 May 2019 12:44:56 +0100
Message-ID: <20190508114456.GF31645@dell>
References: <20190503072813.2719-1-tiny.windzz@gmail.com>
 <20190503072813.2719-6-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190503072813.2719-6-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 03 May 2019, Yangtao Li wrote:

> This patch adds documentation for the H6 GPADC binding.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  .../devicetree/bindings/mfd/sun4i-gpadc.txt   | 27 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
> index 86dd8191b04c..eeaf27eb8abd 100644
> --- a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
> +++ b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
> @@ -5,11 +5,22 @@ and sometimes as a touchscreen controller.
>  
>  Required properties:
>    - compatible: "allwinner,sun8i-a33-ths",
> +		"allwinner,sun50i-h6-ths",
>    - reg: mmio address range of the chip,
> -  - #thermal-sensor-cells: shall be 0,
> +  - #thermal-sensor-cells: shall be 0 for sun8i-a33-ths,
> +			   shall be 1 for sun50i-h6-ths,
>    - #io-channel-cells: shall be 0,
>  
> -Example:
> +Optional properties:
> +  - clocks: Must contain an entry for each entry in clock-names.
> +	    See common clock-bindings.txt for details.

Nit: This should be a relative path, like the reset.txt below.

> +  - clock-names: A list of clock names. For sun50i-h6-ths, it must contain
> +		 "bus".
> +  - resets: Must contain an entry for each entry in reset-names.
> +	    See ../reset/reset.txt for details.
> +  - reset-names: For sun50i-h6-ths, it must contain "bus".
> +
> +Example1:
>  	ths: ths@1c25000 {
>  		compatible = "allwinner,sun8i-a33-ths";
>  		reg = <0x01c25000 0x100>;
> @@ -17,6 +28,18 @@ Example:
>  		#io-channel-cells = <0>;
>  	};
>  
> +Example2:
> +	ths: ths@1c25000 {
> +		compatible = "allwinner,sun50i-h6-ths";
> +		reg = <0x05070400 0x100>;
> +		clocks = <&ccu CLK_BUS_THS>;
> +		clock-names = "bus";
> +		resets = <&ccu RST_BUS_THS>;
> +		reset-names = "bus";
> +		#thermal-sensor-cells = <1>;
> +		#io-channel-cells = <0>;
> +       };
> +
>  sun4i, sun5i and sun6i SoCs are also supported via the older binding:
>  
>  sun4i resistive touchscreen controller

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
