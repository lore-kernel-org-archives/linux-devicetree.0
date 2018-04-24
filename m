From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [RESEND PATCH] ARM: dts: consistently use 'atmel' as at24
 manufacturer in cyclone5
Date: Tue, 24 Apr 2018 10:10:45 -0500
Message-ID: <f7f749f6-3378-3ba8-a612-ff4ef89753ed@kernel.org>
References: <20180417094513.7627-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180417094513.7627-1-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 04/17/2018 04:45 AM, Bartosz Golaszewski wrote:
> Using 'at' or 'at24' as the <manufacturer> part of the compatible
> string is now deprecated. Use a correct value: 'atmel,<model>'.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
> index 2459d133f1be..f50b19447de6 100644
> --- a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
> +++ b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
> @@ -161,7 +161,7 @@
>  	};
>  
>  	at24@50 {
> -		compatible = "at24,24c01";
> +		compatible = "atmel,24c01";
>  		pagesize = <8>;
>  		reg = <0x50>;
>  	};
> @@ -213,7 +213,7 @@
>  			#size-cells = <0>;
>  			reg = <6>;
>  			eeprom@51 {
> -				compatible = "at,24c01";
> +				compatible = "atmel,24c01";
>  				pagesize = <8>;
>  				reg = <0x51>;
>  			};
> @@ -224,7 +224,7 @@
>  			#size-cells = <0>;
>  			reg = <7>;
>  			eeprom@51 {
> -				compatible = "at,24c01";
> +				compatible = "atmel,24c01";
>  				pagesize = <8>;
>  				reg = <0x51>;
>  			};
> 

Applied, thanks!

Dinh
