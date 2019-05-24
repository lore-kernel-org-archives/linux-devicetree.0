From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH v13 2/4] arm64: dts: fsl: librem5: Add a device tree for  the Librem5 devkit
Date: Fri, 24 May 2019 15:20:45 -0700
Message-ID: <64cc01b6cc6590e328e7b488bedb9dc8@www.akkea.ca>
References: <20190520142330.3556-1-angus@akkea.ca>
 <20190520142330.3556-3-angus@akkea.ca>
 <20190523191926.GB3803@xo-6d-61-c0.localdomain>
 <1e6c0664949f38452b8f14b901bff513@www.akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1e6c0664949f38452b8f14b901bff513@www.akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: angus.ainslie@puri.sm, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On 2019-05-24 15:00, Angus Ainslie wrote:
> Hi Pavel,
> 
> On 2019-05-23 12:19, Pavel Machek wrote:
>> Hi!
>> 
>>> - LEDs
>>> - gyro
>>> - magnetometer
>> 
>>> +	leds {
>>> +		compatible = "gpio-leds";
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&pinctrl_gpio_leds>;
>>> +
>>> +		led1 {
>>> +			label = "LED 1";
>> 
>> So, what kind of LED do you have, and what color is it? label should
>> probably be something like
>> notify:green.
>> 
> 
> As we don't have a specific use for these yet does it really matter if
> there is a colour or a number associated with them ?
> 
>>> +	charger@6b { /* bq25896 */
>>> +		compatible = "ti,bq25890";
>>> +		reg = <0x6b>;
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&pinctrl_charger>;
>>> +		interrupt-parent = <&gpio3>;
>>> +		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
>>> +		ti,battery-regulation-voltage = <4192000>; /* 4.192V */
>>> +		ti,charge-current = <1600000>; /* 1.6 A */
>> 
>> No space before A, for consistency.
>> 
>>> +		ti,termination-current = <66000>;  /* 66mA */
>>> +		ti,precharge-current = <1300000>; /* 1.3A */
>> 
>> I thought precharge is usually something low, because you are not yet
>> sure of battery health...?
>> 
> 
> I think I put that in incorrectly. The intention was 130mA.
> 
>>> +		ti,minimum-sys-voltage = <2750000>; /* 2.75V */
>> 
>> Are you sure? Normally systems shut down at 3.2V, 3V or so. Li-ion
>> batteries don't
>> really like to be discharged _this_ deep.
> 
> You are correct. I'll fix it for the next version.
> 

Looking into it further Sanyo and Panasonic get over 300 cycles bringing 
the NCR18650 down to 2.5V so 2.75V should be fine.

http://www.batteryonestop.com/baotongusa/products/datasheets/li-ion/SANYO-NCR18650B-3400mAh.pdf
https://industrial.panasonic.com/ww/products/batteries/secondary-batteries/lithium-ion/cylindrical-type/NCR18650PF

Angus

> Thanks
> Angus
> 
>> 
>> 										Pavel
