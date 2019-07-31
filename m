From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 4/6] arm64: dts: meson: sei510: Add minimal thermal zone
Date: Wed, 31 Jul 2019 14:51:39 +0200
Message-ID: <c451fd49-bf3d-b7d7-46ba-43ac7bed3b90@baylibre.com>
References: <20190731121409.17285-1-glaroque@baylibre.com>
 <20190731121409.17285-5-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731121409.17285-5-glaroque@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>, daniel.lezcano@linaro.org, khilman@baylibre.com
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 31/07/2019 14:14, Guillaume La Roque wrote:
> Add minimal thermal zone for DDR and CPU sensor
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> index c7a87368850b..79ae514e238d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -33,6 +33,19 @@
>  		ethernet0 = &ethmac;
>  	};
>  
> +	thermal-zones {
> +		soc_thermal {
> +			polling-delay = <1000>;
> +			polling-delay-ptripsassive = <100>;
> +			thermal-sensors = <&cpu_temp 0>;


Seems the trips & cooling-maps are required as described in thermal.txt

For the soc_thermal zone it's esy to add a cooling map with the CPU
and cooling devices, but for the ddr_thermal, no idea if we can use the
CPUs within 2 cooling maps.

> +		};

I would add a blank line between the zones, same for other files.


> +		ddr_thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&ddr_temp 1>;
> +		};
> +	};
> +
>  	mono_dac: audio-codec-0 {
>  		compatible = "maxim,max98357a";
>  		#sound-dai-cells = <0>;
> 
