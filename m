From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 1/3] ARM: dts: add Netronix E60K02 board common file
Date: Fri, 27 Sep 2019 21:08:07 +0200
Message-ID: <20190927210807.26439a94@aktux>
References: <20190927061423.17278-1-andreas@kemnade.info>
        <20190927061423.17278-2-andreas@kemnade.info>
        <20190927094721.w26ggnli4f5a64uv@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927094721.w26ggnli4f5a64uv@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com, marex@denx.de, angus@akkea.ca, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, j.neuschaefer@gmx.net, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

Hi Marco,

On Fri, 27 Sep 2019 11:47:21 +0200
Marco Felsch <m.felsch@pengutronix.de> wrote:

> Hi Andreas,
> 
> thanks for the patch.
> 
thanks for the quick review. Most of your comments are clear.

[...]
> > +	wifi_pwrseq: wifi_pwrseq {
> > +		compatible = "mmc-pwrseq-simple";
> > +		post-power-on-delay-ms = <20>;
> > +		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;  
> 
> Can you add a pinctrl-entry here please? The general rule is to mux
> things where you use it.
> 
yes, there are many places in my patch where they are added to some
parent devices.
I will fix that.
[...]
> > +	leds {
> > +		compatible = "gpio-leds";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_led>;  
> 
> Please move all muxing you made here into this file or add phandles so
> the dts file need to add only the muxing stuff. This applies to all
> pinctrl you made here.
> 
so you disagree with this pattern:
in .dtsi
 some_device {
   pinctrl-0 = <&pinctrl_some_device>;
 };

and in .dts (one I sent with this patch series and the tolino/mx6sl one
is not ready-cooked yet, will be part of a later series)
&iomuxc {
   pinctrl_some_device: some_devicegrp {
   	fsl,pins = <...>;
   };
};

?

> > +
> > +		GLED {
> > +			gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
> > +			linux,default-trigger = "timer";
> > +		};
> > +	};
> > +
> > +	gpio-keys {
> > +		compatible = "gpio-keys";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_gpio_keys>;
> > +		power {
> > +			label = "Power";
> > +			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_POWER>;  
> 
> Add missing header: dt-bindings/input/input.h to use this.
> 
I am doing this in the .dts but it is probably better to do it here
because it is used here.

> > +			gpio-key,wakeup;
> > +		};
> > +		cover {
> > +			label = "Cover";
> > +			gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
> > +			linux,code = <SW_LID>;
> > +			linux,input-type = <0x05>;    /* EV_SW */  
> 
> In the header above EV_SW is also specified so please use it here.
> 
This pattern is in many files. I took one as an example. It seems that
50% of devicetree files have this pattern, the other 50% do have the
pattern you proposed (which I like more). So probably EV_SW was not
available in former times?

> > +			gpio-key,wakeup;
> > +		};
> > +	};
> > +
> > +};
> > +
> > +
> > +  
> 
> Whitespaces
> 
> > +&audmux {
> > +	pinctrl-names = "default";
> > +	status = "disabled";  
> 
> Why you mentioned a pinctrl-names here without the mux? Do we need the
> status line here? The common case is that such devices are off by
> default/the base dt.
> 
yes, that things can be removed.
> > +};
> > +
> > +&snvs_rtc {
> > +	status = "disabled";  
> 
> Same applies here.
> 

No, seems to be an exception, it does not have a status = "disabled" in
imx6sll.dtsi.

> > +};
> > +
> > +&i2c1 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default","sleep";
> > +	pinctrl-0 = <&pinctrl_i2c1 &pinctrl_lm3630a_bl_gpio>;  
> 
> The &pinctrl_lm3630a_bl_gpio should be moved into the lm3630a node.
> 
> > +	pinctrl-1 = <&pinctrl_i2c1_sleep>;
> > +	status = "okay";
> > +
> > +	lm3630a: lm3630a-i2c@36 {  
> 
> please name it backlight@36
> 
> > +		reg = <0x36>;
> > +		status = "ok";  
> 
> status lines are always be the last and if it is okay you can drop it
> because the default is okay.
> 
well, I added it because the driver was not loaded but later I found out
that the real reason is that module aliases were broken and forgot to
remove that "ok".

Regards,
Andreas
