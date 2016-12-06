From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 2/5] ARM: BCM5301X: Specify USB controllers in DT
Date: Tue, 6 Dec 2016 09:28:33 -0800
Message-ID: <c721c71c-117f-185d-0544-954981dbcf04@broadcom.com>
References: <20161206171714.22738-1-zajec5@gmail.com>
 <20161206171714.22738-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161206171714.22738-2-zajec5@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org



On 12/6/2016 9:17 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> There are 3 separated controllers, one per USB /standard/. With PHY
> drivers in place they can be simply supported with generic drivers.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  arch/arm/boot/dts/bcm5301x.dtsi | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
> index f09a2bb..bfc98d19 100644
> --- a/arch/arm/boot/dts/bcm5301x.dtsi
> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
> @@ -248,8 +248,26 @@
>  
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +			ranges;
>  
> -			phys = <&usb2_phy>;
> +			interrupt-parent = <&gic>;
> +
> +			ohci: ohci@21000 {
> +				#usb-cells = <0>;
> +
> +				compatible = "generic-ohci";
> +				reg = <0x00022000 0x1000>;

Your label ohci@21000 does not match the 'reg' at 0x22000.

> +				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			ehci: ehci@22000 {
> +				#usb-cells = <0>;
> +
> +				compatible = "generic-ehci";
> +				reg = <0x00021000 0x1000>;

Looks like you got the label of ohci and ehci reversed?

> +				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb2_phy>;
> +			};
>  		};
>  
>  		usb3: usb3@23000 {
> @@ -257,6 +275,19 @@
>  
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +			ranges;
> +
> +			interrupt-parent = <&gic>;
> +
> +			xhci: xhci@23000 {
> +				#usb-cells = <0>;
> +
> +				compatible = "generic-xhci";
> +				reg = <0x00023000 0x1000>;
> +				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb3_phy>;
> +				phy-names = "usb";
> +			};
>  		};
>  
>  		spi@29000 {
> 
