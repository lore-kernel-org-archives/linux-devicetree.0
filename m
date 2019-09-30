From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v6 3/7] arm64: dts: amlogic: g12: add temperature sensor
Date: Mon, 30 Sep 2019 10:19:03 +0200
Message-ID: <6aff984e-cb77-cc02-9df6-905a517b428d@baylibre.com>
References: <20190927184352.28759-1-glaroque@baylibre.com>
 <20190927184352.28759-4-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927184352.28759-4-glaroque@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>, amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 27/09/2019 20:43, Guillaume La Roque wrote:
> Add cpu and ddr temperature sensors for G12 Socs
> 
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-g12-common.dtsi    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 38d70ce1cfc7..0660d9ef6a86 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -1353,6 +1353,26 @@
>  				};
>  			};
>  
> +			cpu_temp: temperature-sensor@34800 {
> +				compatible = "amlogic,g12a-cpu-thermal",
> +					     "amlogic,g12a-thermal";
> +				reg = <0x0 0x34800 0x0 0x50>;
> +				interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&clkc CLKID_TS>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,ao-secure = <&sec_AO>;
> +			};
> +
> +			ddr_temp: temperature-sensor@34c00 {
> +				compatible = "amlogic,g12a-ddr-thermal",
> +					     "amlogic,g12a-thermal";
> +				reg = <0x0 0x34c00 0x0 0x50>;
> +				interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&clkc CLKID_TS>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,ao-secure = <&sec_AO>;
> +			};
> +
>  			usb2_phy0: phy@36000 {
>  				compatible = "amlogic,g12a-usb2-phy";
>  				reg = <0x0 0x36000 0x0 0x2000>;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
