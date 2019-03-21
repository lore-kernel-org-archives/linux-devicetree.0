From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH 2/4] ARM: dts: da850: add cpu node and operating points to
 DT
Date: Thu, 21 Mar 2019 10:56:27 -0500
Message-ID: <a5874799-b7a5-e33b-436a-e215c9afd38a@lechnology.com>
References: <20190321141010.19612-1-brgl@bgdev.pl>
 <20190321141010.19612-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321141010.19612-3-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 3/21/19 9:10 AM, Bartosz Golaszewski wrote:
> From: David Lechner <david@lechnology.com>
> 
> This adds a cpu node and operating points to the common da850.dtsi file.
> 
> Additionally, a regulator is added to the LEGO EV3 board along with
> some board-specific CPU configuration.

Should mention the LCDK board here as well since it is included in this
patch.

> 
> Regulators need to be hooked up on other boards to get them working.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   arch/arm/boot/dts/da850-lcdk.dts     | 31 +++++++++++++++
>   arch/arm/boot/dts/da850-lego-ev3.dts | 30 +++++++++++++++
>   arch/arm/boot/dts/da850.dtsi         | 56 ++++++++++++++++++++++++++++
>   3 files changed, 117 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
> index 26f453dc8370..f29ed9010812 100644
> --- a/arch/arm/boot/dts/da850-lcdk.dts
> +++ b/arch/arm/boot/dts/da850-lcdk.dts
> @@ -155,12 +155,43 @@
>   			};
>   		};
>   	};
> +
> +	cvdd: regulator0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cvdd";
> +		regulator-min-microvolt = <1300000>;
> +		regulator-max-microvolt = <1300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
>   };
>   
>   &ref_clk {
>   	clock-frequency = <24000000>;
>   };
>   
> +&cpu {
> +	cpu-supply = <&cvdd>;
> +};
> +
> +/* LCDK has a fixed CVDD of 1.3V, so only op points >= 300MHz are valid */
> +
> +&opp_100 {
> +	status = "disabled";
> +};
> +
> +&opp_200 {
> +	status = "disabled";
> +};
> +
> +&opp_375 {
> +	status = "okay";
> +};
> +
> +&opp_456 {
> +	status = "okay";
> +};
> +
>   &pmx_core {
>   	status = "okay";
>   
> diff --git a/arch/arm/boot/dts/da850-lego-ev3.dts b/arch/arm/boot/dts/da850-lego-ev3.dts
> index 66fcadf0ba91..553717f84483 100644
> --- a/arch/arm/boot/dts/da850-lego-ev3.dts
> +++ b/arch/arm/boot/dts/da850-lego-ev3.dts
> @@ -125,6 +125,15 @@
>   		amp-supply = <&amp>;
>   	};
>   
> +	cvdd: regulator0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cvdd";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>   	/*
>   	 * This is a 5V current limiting regulator that is shared by USB,
>   	 * the sensor (input) ports, the motor (output) ports and the A/DC.
> @@ -204,6 +213,27 @@
>   	clock-frequency = <24000000>;
>   };
>   
> +&cpu {
> +	cpu-supply = <&cvdd>;
> +};
> +
> +/* since we have a fixed regulator, we can't run at these points */
> +&opp_100 {
> +	status = "disabled";
> +};
> +
> +&opp_200 {
> +	status = "disabled";
> +};
> +
> +/*
> + * The SoC is actually the 456MHz version, but because of the fixed regulator
> + * This is the fastest we can go.
> + */
> +&opp_375 {
> +	status = "okay";
> +};
> +
>   &pmx_core {
>   	status = "okay";
>   
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 559659b399d0..ee61d1253b58 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -20,6 +20,62 @@
>   		reg = <0xc0000000 0x0>;
>   	};
>   
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu: cpu@0 {
> +			compatible = "arm,arm926ej-s";
> +			device_type = "cpu";
> +			reg = <0>;
> +			clocks = <&psc0 14>;
> +			operating-points-v2 = <&opp_table>;
> +		};
> +	};
> +
> +	opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp_100: opp100-100000000 {
> +			opp-hz = /bits/ 64 <100000000>;
> +			opp-microvolt = <1000000 950000 1050000>;
> +		};
> +
> +		opp_200: opp110-200000000 {
> +			opp-hz = /bits/ 64 <200000000>;
> +			opp-microvolt = <1100000 1050000 1160000>;
> +		};
> +
> +		opp_300: opp120-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			opp-microvolt = <1200000 1140000 1320000>;
> +		};
> +
> +		/*
> +		 * Original silicon was 300MHz max, so higher frequencies
> +		 * need to be enabled on a per-board basis if the chip is
> +		 * capable.
> +		 */
> +
> +		opp_375: opp120-375000000 {
> +			status = "disabled";
> +			opp-hz = /bits/ 64 <375000000>;
> +			opp-microvolt = <1200000 1140000 1320000>;
> +		};
> +
> +		opp_415: opp130-415000000 {
> +			status = "disabled";
> +			opp-hz = /bits/ 64 <415000000>;
> +			opp-microvolt = <1300000 1250000 1350000>;
> +		};

I just made this point (415MHz) up for experimenting with undervolting
before going all the way to 456MHz at 1.2V. I'm not sure if it is
actually useful to anyone else.

> +
> +		opp_456: opp130-456000000 {
> +			status = "disabled";
> +			opp-hz = /bits/ 64 <456000000>;
> +			opp-microvolt = <1300000 1250000 1350000>;
> +		};
> +	};
> +
>   	arm {
>   		#address-cells = <1>;
>   		#size-cells = <1>;
> 
