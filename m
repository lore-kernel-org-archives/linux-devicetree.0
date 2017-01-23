From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 15/18] ARM64: dts: meson-gxl: Reorder nodes
Date: Mon, 23 Jan 2017 09:57:59 +0100
Message-ID: <9c5e3b71-1a6a-7753-7f1c-5eec49d975b0@baylibre.com>
References: <20170120222118.21476-1-afaerber@suse.de>
 <20170120222118.21476-16-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170120222118.21476-16-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, linux-amlogic@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/20/2017 11:21 PM, Andreas Färber wrote:
> Sort nodes referenced by label alphabetically.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 40 +++++++++++++++---------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index bdf2305a2e25..afa74455e1de 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -120,6 +120,26 @@
>  	};
>  };
>  
> +&hiubus {
> +	clkc: clock-controller@0 {
> +		compatible = "amlogic,gxl-clkc", "amlogic,gxbb-clkc";
> +		#clock-cells = <1>;
> +		reg = <0x0 0x0 0x0 0x3db>;
> +	};
> +};
> +
> +&i2c_A {
> +	clocks = <&clkc CLKID_I2C>;
> +};
> +
> +&i2c_B {
> +	clocks = <&clkc CLKID_I2C>;
> +};
> +
> +&i2c_C {
> +	clocks = <&clkc CLKID_I2C>;
> +};
> +
>  &periphs {
>  	pinctrl_periphs: pinctrl@4b0 {
>  		compatible = "amlogic,meson-gxl-periphs-pinctrl";
> @@ -320,26 +340,6 @@
>  	};
>  };
>  
> -&hiubus {
> -	clkc: clock-controller@0 {
> -		compatible = "amlogic,gxl-clkc", "amlogic,gxbb-clkc";
> -		#clock-cells = <1>;
> -		reg = <0x0 0x0 0x0 0x3db>;
> -	};
> -};
> -
> -&i2c_A {
> -	clocks = <&clkc CLKID_I2C>;
> -};
> -
> -&i2c_B {
> -	clocks = <&clkc CLKID_I2C>;
> -};
> -
> -&i2c_C {
> -	clocks = <&clkc CLKID_I2C>;
> -};
> -
>  &sd_emmc_a {
>  	clocks = <&clkc CLKID_SD_EMMC_A>,
>  		 <&xtal>,
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
