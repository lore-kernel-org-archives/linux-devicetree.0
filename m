From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v6 5/7] arm64: dts: amlogic: g12a: add cooling properties
Date: Mon, 30 Sep 2019 10:19:29 +0200
Message-ID: <73f3dc4c-2f3e-2c29-f667-15ce76ebcf3e@baylibre.com>
References: <20190927184352.28759-1-glaroque@baylibre.com>
 <20190927184352.28759-6-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927184352.28759-6-glaroque@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>, amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 27/09/2019 20:43, Guillaume La Roque wrote:
> Add missing #colling-cells field for G12A SoC
> Add cooling-map for passive and hot trip point
> 
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index 733a9d46fc4b..3ab6497548ca 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -18,6 +18,7 @@
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
>  			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -26,6 +27,7 @@
>  			reg = <0x0 0x1>;
>  			enable-method = "psci";
>  			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu2: cpu@2 {
> @@ -34,6 +36,7 @@
>  			reg = <0x0 0x2>;
>  			enable-method = "psci";
>  			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu3: cpu@3 {
> @@ -42,6 +45,7 @@
>  			reg = <0x0 0x3>;
>  			enable-method = "psci";
>  			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		l2: l2-cache0 {
> @@ -113,3 +117,23 @@
>  &sd_emmc_a {
>  	amlogic,dram-access-quirk;
>  };
> +
> +&cpu_thermal {
> +	cooling-maps {
> +		map0 {
> +			trip = <&cpu_passive>;
> +			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +		};
> +
> +		map1 {
> +			trip = <&cpu_hot>;
> +			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
