From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 1/6] dt-bindings: net: bluetooth: add support for MediaTek
 MT7663U and MT7668U UART devices
Date: Mon, 18 Feb 2019 14:05:11 +0100
Message-ID: <0EF74A38-3D1F-4BD1-9B72-78E8720C125D@holtmann.org>
References: <cover.1550184473.git.sean.wang@mediatek.com>
 <c31b9ed0f2c711f53ad88c96f2d0a1bd22d9de58.1550184473.git.sean.wang@mediatek.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c31b9ed0f2c711f53ad88c96f2d0a1bd22d9de58.1550184473.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Johan Hedberg <johan.hedberg@gmail.com>, devicetree <devicetree@vger.kernel.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> Update binding document with adding support of MT7663U and MT7668U UART
> devices to mediatek-bluetooth.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> .../bindings/net/mediatek-bluetooth.txt       | 64 +++++++++++++++++++
> 1 file changed, 64 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
> index 14ceb2a5b4e8..41a7dcc80f5b 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
> @@ -33,3 +33,67 @@ Example:
> 			clock-names = "ref";
> 		};
> 	};
> +
> +MediaTek UART based Bluetooth Devices
> +==================================
> +
> +This device is a serial attached device to UART device and thus it must be a
> +child node of the serial node with UART.
> +
> +Please refer to the following documents for generic properties:
> +
> +	Documentation/devicetree/bindings/serial/slave-device.txt
> +
> +Required properties:
> +
> +- compatible:	Must be
> +		  "mediatek,mt7663u-bluetooth": for MT7663U device
> +		  "mediatek,mt7668u-bluetooth": for MT7668U device
> +- vcc-supply:	Main voltage regulator
> +- pinctrl-names: Should be "default", "runtime"
> +- pinctrl-0: Should contain UART RXD low when the device is powered up to
> +	     enter proper bootstrap mode.
> +- pinctrl-1: Should contain UART mode pin ctrl
> +
> +Optional properties:
> +
> +- reset-gpios:	GPIO used to reset the device whose initial state keeps low,
> +		if the GPIO is missing, then board-level design should be
> +		guaranteed.
> +- current-speed:  Current baud rate of the device whose defaults to 921600
> +
> +Example:
> +
> +	uart1_pins_boot: uart1-default {
> +		pins-dat {
> +			pinmux = <MT7623_PIN_81_URXD1_FUNC_GPIO81>;
> +			output-low;
> +		};
> +	};
> +
> +	uart1_pins_runtime: uart1-runtime {
> +		pins-dat {
> +			pinmux = <MT7623_PIN_81_URXD1_FUNC_URXD1>,
> +				 <MT7623_PIN_82_UTXD1_FUNC_UTXD1>;
> +		};
> +	};
> +
> +	uart1: serial@11003000 {
> +		compatible = "mediatek,mt7623-uart",
> +			     "mediatek,mt6577-uart";
> +		reg = <0 0x11003000 0 0x400>;
> +		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&pericfg CLK_PERI_UART1_SEL>,
> +			 <&pericfg CLK_PERI_UART1>;
> +		clock-names = "baud", "bus";
> +
> +		bluetooth {
> +			compatible = "mediatek,mt7663u-bluetooth";
> +			vcc-supply = <&reg_5v>;
> +			reset-gpios = <&pio 24 GPIO_ACTIVE_LOW>;
> +			pinctrl-names = "default", "runtime";
> +			pinctrl-0 = <&uart1_pins_boot>;
> +			pinctrl-1 = <&uart1_pins_runtime>;
> +			current-speed = <921600>;
> +		};
> +	};

can you ACK this please.

Regards

Marcel
