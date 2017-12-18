From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v2 18/19] ARM: dts: aspeed-romulus: Update Romulus system
Date: Mon, 18 Dec 2017 10:32:36 +0100
Message-ID: <b8e80861-88c4-da87-a201-ca2eefaa5a94@kaod.org>
References: <20171215062443.23059-1-joel@jms.id.au>
 <20171215062443.23059-19-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171215062443.23059-19-joel@jms.id.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, Xo Wang <xow@google.com>, Lei YU <mine260309@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Some comments below,

On 12/15/2017 07:24 AM, Joel Stanley wrote:
>  - Fix incorrect RAM size
>  - Remove alias; these are now specified in the dtsi
>  - Add newly upstreamed devices
>  - Include OpenBMC flash layout
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 153 ++++++++++++++++++++++++++-
>  1 file changed, 148 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index a7a9386f964d..bfdf643584df 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -7,17 +7,13 @@
>  	model = "Romulus BMC";
>  	compatible = "ibm,romulus-bmc", "aspeed,ast2500";
>  
> -	aliases {
> -		serial4 = &uart5;
> -	};
> -
>  	chosen {
>  		stdout-path = &uart5;
>  		bootargs = "console=ttyS4,115200 earlyprintk";
>  	};
>  
>  	memory {
> -		reg = <0x80000000 0x40000000>;
> +		reg = <0x80000000 0x20000000>;
>  	};
>  
>  	reserved-memory {
> @@ -29,6 +25,73 @@
>  			no-map;
>  			reg = <0xbf000000 0x01000000>; /* 16M */
>  		};
> +
> +		flash_memory: region@98000000 {
> +			no-map;
> +			reg = <0x98000000 0x04000000>; /* 64M */
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		fault {
> +			gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		identify {
> +			gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		power {
> +			gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	fsi: gpio-fsi {
> +		compatible = "fsi-master-gpio", "fsi-master";
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> +		data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> +		mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
> +		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
> +		trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		checkstop {
> +			label = "checkstop";
> +			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(J, 2)>;
> +		};
> +	};
> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	flash@0 {
> +		status = "okay";
> +		label = "pnor";
> +		m25p,fast-read;
> +#include "openbmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		label = "pnor";
> +		m25p,fast-read;
>  	};
>  };


hmm, the fmc and spi1 bindings were already added in commit 1142aea9ff9d.


> @@ -38,6 +101,7 @@
>  		status = "okay";
>  		m25p,fast-read;
>  		label = "bmc";
> +#include "openbmc-flash-layout.dtsi"


This looks like an extra "fmc" node ? 

>  	};
>  };
>  
> @@ -53,6 +117,12 @@
>  	};
>  };
>  
> +&lpc_ctrl {
> +	status = "okay";
> +	memory-region = <&flash_memory>;
> +	flash = <&spi1>;
> +};
> +
>  &uart1 {
>  	/* Rear RS-232 connector */
>  	status = "okay";
> @@ -81,6 +151,10 @@
>  	pinctrl-0 = <&pinctrl_rmii1_default>;
>  };
>  
> +&i2c1 {
> +	status = "okay";
> +};
> +
>  &i2c2 {
>  	status = "okay";
>  };
> @@ -133,8 +207,77 @@
>  
>  &i2c12 {
>  	status = "okay";
> +
> +	max31785@52 {
> +		compatible = "maxim,max31785";
> +		reg = <0x52>;
> +	};
> +};
> +
> +&gpio {
> +	nic_func_mode0 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "nic_func_mode0";
> +	};
> +	nic_func_mode1 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "nic_func_mode1";
> +	};
>  };
>  
>  &vuart {
>  	status = "okay";
>  };
> +
> +&gfx {
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	aspeed,external-nodes = <&gfx &lhc>;
> +};
> +
> +&pwm_tacho {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +
> +	fan@0 {
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x08>;
> +	};
> +
> +	fan@1 {
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x09>;
> +	};
> +
> +	fan@2 {
> +		reg = <0x01>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0a>;
> +	};
> +
> +	fan@3 {
> +		reg = <0x01>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0b>;
> +	};
> +
> +	fan@4 {
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0c>;
> +	};
> +
> +	fan@5 {
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0d>;
> +	};
> +
> +	fan@6 {
> +		reg = <0x01>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0e>;
> +	};
> +};
> 
