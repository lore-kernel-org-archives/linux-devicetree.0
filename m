From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH 3/4] ARM: dts: da850-evm: enable cpufreq
Date: Thu, 21 Mar 2019 10:53:46 -0500
Message-ID: <06c6fe16-eb33-960c-909a-635e70c3b976@lechnology.com>
References: <20190321141010.19612-1-brgl@bgdev.pl>
 <20190321141010.19612-4-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321141010.19612-4-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <adam.ford@logicpd.com>
List-Id: devicetree@vger.kernel.org

On 3/21/19 9:10 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Enable cpufreq-dt support for da850-evm. The cvdd regulator is fixed
> at 1.2V on this board so disable the lower operating points and enable
> the 375MHz opp.


The board-da850-evm.c file seems to indicate that this regulator is
variable and comes from the tps65070. This regulator seems to be missing
from the device tree though, even though it has device tree bindings.

Cc: Adam Ford


> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   arch/arm/boot/dts/da850-evm.dts | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
> index f04bc3e15332..f63867692da4 100644
> --- a/arch/arm/boot/dts/da850-evm.dts
> +++ b/arch/arm/boot/dts/da850-evm.dts
> @@ -151,6 +151,15 @@
>   			system-clock-frequency = <24576000>;
>   		};
>   	};
> +
> +	cvdd: regulator0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cvdd";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
>   };
>   
>   &ecap2 {
> @@ -191,6 +200,27 @@
>   	};
>   };
>   
> +&cpu {
> +	cpu-supply = <&cvdd>;
> +};
> +
> +/*
> + * DA850-EVM has a fixed CVDD of 1.2V - we cannot go below 300MHz or
> + * above 375MHz.
> + */
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
>   &sata {
>   	status = "okay";
>   };
> 
