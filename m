Return-Path: <SRS0=rCaq=WY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.nic.cz ([217.31.204.67]:32950 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbfH1PCG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Aug 2019 11:02:06 -0400
Date: Wed, 28 Aug 2019 17:02:04 +0200
From: Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Subject: Re: [PATCH mvebu-dt64 3/3] arm64: dts: marvell: add DTS for Turris
 Mox
Message-ID: <20190828170204.15340299@dellmb.labs.office.nic.cz>
In-Reply-To: <20190828121909.GB32178@lunn.ch>
References: <20190827151644.12532-1-marek.behun@nic.cz>
        <20190827151644.12532-4-marek.behun@nic.cz>
        <8736hlziv3.fsf@FE-laptop>
        <20190828121909.GB32178@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, 28 Aug 2019 14:19:09 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > > +	leds {
> > > +		compatible = "gpio-leds";
> > > +		red {
> > > +			gpios = <&gpiosb 21 GPIO_ACTIVE_LOW>;
> > > +			linux,default-trigger = "default-on";
> > > +		};  
> 
> I think there would normally be a label here, so the LED has a
> name. There is a convention to follow, which is in the documentation.

I shall rename it to "mox:red:activity" according to convetion.

> > > +	};
> > > +
> > > +	gpio-keys {
> > > +		compatible = "gpio-keys";
> > > +
> > > +		reset {
> > > +			label = "reset";
> > > +			linux,code = <BTN_MISC>;  
> 
> I'm pretty sure there is a linux,code for reset.

KEY_RESTART

> 
> > > +			gpios = <&gpiosb 20 GPIO_ACTIVE_LOW>;
> > > +			debounce-interval = <60>;
> > > +		};
> > > +	};  
> 
> > > +
> > > +	sfp: sfp {
> > > +		compatible = "sff,sfp+";
> > > +		i2c-bus = <&i2c0>;  
> 
> The standard for SFPs sets the maximum bus speed is 100Khz. I'm sure
> some can do 400Khz, but if you want to support all SFPs, you should
> use the lower speed. I don't see anywhere in this file where you set
> the maximum speed. Maybe the bus defaults to 100K so you don't need
> anything?

Ill add it to i2c0

> > > +
> > > +&i2c0 {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&i2c1_pins>;  
> 
> The node is called i2c0, but here you have i2c1_pins?

That is how this is defined in armada-37xx.dtsi. First i2c has
phandle pointer called i2c0, second i2c1. But the pinctrl drivers uses
i2c1 and i2c2. All device trees need to be changed for this. This can
be done later in a separate commit for all device trees using
armada-37xx.dtsi

> > > +	status = "okay";
> > > +
> > > +	rtc@6f {
> > > +		compatible = "microchip,mcp7940x";
> > > +		reg = <0x6f>;
> > > +	};
> > > +};
> > > +
> > > +&pcie_reset_pins {
> > > +	function = "gpio";
> > > +};  
> 
> Should there be something to indicate which GPIO?

No. The thing here is that the function here should remain "pcie"
ideally. When that pin is configured in pcie mode, modifying specific
pcie register should control the pin. But for some reason on our SOC it
does not. I suspect it does not work for Miquel Raynal either, since he
sent patches for aardvark that use reset-gpio as well (see
https://lkml.org/lkml/2018/12/12/242 ).
So we configure it in gpio mode and than in the pcie node we have
  reset-gpios = <&gpiosb 3 GPIO_ACTIVE_LOW>;

> > +		ports {  
> 
> > > +			switch0port10: port@a {
> > > +				reg = <0xa>;
> > > +				label = "dsa";
> > > +				phy-mode = "2500base-x";
> > > +				managed = "in-band-status";
> > > +				link = <&switch1port9
> > > &switch2port9>;  
> 
> Does u-boot also modify this, if switch2 does not exist? I don't know
> if it actually matters, but if the switch does not exist, but the
> routing entry exists, this switch might still send it frames and use
> up some of your bandwidth?

That port has status = "disabled" by default. U-Boot enables that node
if second switch is present. U-Boot removes all disabled nodes before
boot. Even if it did not, kernel ignores disabled nodes here.

Marek
