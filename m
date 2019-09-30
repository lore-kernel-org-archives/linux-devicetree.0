From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v6 6/7] arm64: dts: amlogic: g12b: add cooling properties
Date: Mon, 30 Sep 2019 10:19:41 +0200
Message-ID: <e57cd8d9-5174-bd1b-e091-98d6328f7891@baylibre.com>
References: <20190927184352.28759-1-glaroque@baylibre.com>
 <20190927184352.28759-7-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927184352.28759-7-glaroque@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>, amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 27/09/2019 20:43, Guillaume La Roque wrote:
> Add missing #colling-cells field for G12B SoC
> Add cooling-map for passive and hot trip point
> 
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 29 +++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> index 98ae8a7c8b41..4bb89bce758f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> @@ -49,6 +49,7 @@
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
>  			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -57,6 +58,7 @@
>  			reg = <0x0 0x1>;
>  			enable-method = "psci";
>  			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu100: cpu@100 {
> @@ -65,6 +67,7 @@
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
>  			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu101: cpu@101 {
> @@ -73,6 +76,7 @@
>  			reg = <0x0 0x101>;
>  			enable-method = "psci";
>  			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu102: cpu@102 {
> @@ -81,6 +85,7 @@
>  			reg = <0x0 0x102>;
>  			enable-method = "psci";
>  			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu103: cpu@103 {
> @@ -89,6 +94,7 @@
>  			reg = <0x0 0x103>;
>  			enable-method = "psci";
>  			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		l2: l2-cache0 {
> @@ -219,3 +225,26 @@
>  &sd_emmc_a {
>  	amlogic,dram-access-quirk;
>  };
> +
> +&cpu_thermal {
> +	cooling-maps {
> +		map0 {
> +			trip = <&cpu_passive>;
> +			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +		};
> +		map1 {
> +			trip = <&cpu_hot>;
> +			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
