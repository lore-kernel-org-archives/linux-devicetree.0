Return-Path: <SRS0=aNmO=SA=nic.cz=marek.behun@kernel.org>
Date: Fri, 29 Mar 2019 20:00:03 +0100
From: Marek Behun <marek.behun@nic.cz>
Subject: Re: [PATCH v3 leds-next 2/2] dt-bindings: leds: Document Turris
 Omnia LED controller binding
Message-ID: <20190329200003.77443bc4@nic.cz>
In-Reply-To: <20190328193428.19273-3-marek.behun@nic.cz>
References: <20190328193428.19273-1-marek.behun@nic.cz>
	<20190328193428.19273-3-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

I have a question about how to design correctly the situation about
global brigthness on this controller in the device tree.

The thing is that these LEDs are, in hardware, controlled via PWM and
SPI, but this is done via microcontroller running a proprietary
firmware. So from the point of view of the CPU, should the LEDs be
described in the device tree as connected to the mircocontroller
direclty, or should pwm and spi nodes be created as well?

Next thing is that the values of the RGB channels for each LED is
controlled via SPI, but the global brightness controlled byt the single
PWM also controls the LED brightnesses globally.

How should this be specified?

Thank you.

> +Example:
> +
> +	led-controller@2b {
> +		compatible = "cznic,turris-omnia-leds";
> +		reg = <0x2b>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		led@0 {
> +			reg = <0x0>;
> +			label = "userB";
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		led@1 {
> +			reg = <0x1>;
> +			label = "userA";
> +		};
> +
> +		led@2 {
> +			reg = <0x2>;
> +			label = "pci3";
> +		};
> +
> +		led@3 {
> +			reg = <0x3>;
> +			label = "pci2";
> +		};
> +
> +		led@4 {
> +			reg = <0x4>;
> +			label = "pci1";
> +		};
> +
> +		led@5 {
> +			reg = <0x5>;
> +			label = "wan";
> +		};
> +
> +		led@6 {
> +			reg = <0x6>;
> +			label = "lan4";
> +		};
> +
> +		led@7 {
> +			reg = <0x7>;
> +			label = "lan3";
> +		};
> +
> +		led@8 {
> +			reg = <0x8>;
> +			label = "lan2";
> +		};
> +
> +		led@9 {
> +			reg = <0x9>;
> +			label = "lan1";
> +		};
> +
> +		led@a {
> +			reg = <0xa>;
> +			label = "lan0";
> +		};
> +
> +		led@b {
> +			reg = <0xb>;
> +			label = "power";
> +		};
> +	};
