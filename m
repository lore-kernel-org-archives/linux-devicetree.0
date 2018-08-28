From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: NSP: Enable SFP on bcm958625hr
Date: Tue, 28 Aug 2018 14:31:02 -0700
Message-ID: <b1c97c3e-ae7f-8948-5146-df27e38da961@broadcom.com>
References: <20180828175420.7992-1-f.fainelli@gmail.com>
 <20180828175420.7992-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828175420.7992-2-f.fainelli@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, andrew@lunn.ch, rmk+kernel@armlinux.org.uk
List-Id: devicetree@vger.kernel.org



On 8/28/2018 10:54 AM, Florian Fainelli wrote:
> Enable the SFP connected to port 5 of the switch and wire up all GPIOs
> to the SFP cage. Because of a hardware limitation of the i2c controller
> on the iProc SoCs which prevents large i2c (> 63 bytes) transactions to
> work, we use the i2c-gpio interface instead, which does not have that
> limitation. This allows us to read the SFP module EEPROM, which would
> not be possible otherwise since it exceeds that size during a single
> read transfer.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>   arch/arm/boot/dts/bcm958625hr.dts | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/bcm958625hr.dts b/arch/arm/boot/dts/bcm958625hr.dts
> index ea3fc194f8f3..6fa0d8d1a218 100644
> --- a/arch/arm/boot/dts/bcm958625hr.dts
> +++ b/arch/arm/boot/dts/bcm958625hr.dts
> @@ -58,6 +58,24 @@
>   		open-source;
>   		priority = <200>;
>   	};
> +
> +	/* Hardware I2C block cannot do more than 63 bytes per transfer,
> +	 * which would prevent reading from a SFP's EEPROM (256 byte).
> +	 */
> +	i2c1: i2c1 {

nit, "i2c1: i2c {" ?

> +		compatible = "i2c-gpio";
> +		sda-gpios = <&gpioa 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&gpioa 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	};
> +
> +	sfp: sfp {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c1>;
> +		mod-def0-gpios = <&gpioa 28 GPIO_ACTIVE_LOW>;
> +		los-gpios = <&gpioa 24 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpios = <&gpioa 30 GPIO_ACTIVE_HIGH>;
> +		tx-disable-gpios = <&gpioa 26 GPIO_ACTIVE_HIGH>;
> +	};
>   };
>   
>   &amac0 {
> @@ -210,6 +228,14 @@
>   			reg = <4>;
>   		};
>   
> +		port@5 {
> +			label = "sfp";
> +			phy-mode = "sgmii";
> +			reg = <5>;
> +			sfp = <&sfp>;
> +			managed = "in-band-status";
> +		};
> +
>   		port@8 {
>   			ethernet = <&amac2>;
>   			label = "cpu";
> 
