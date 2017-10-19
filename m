From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/8] extcon: gpio: Add DT bindings
Date: Thu, 19 Oct 2017 19:47:37 +0900
Message-ID: <59E882C9.9080506@samsung.com>
References: <20170924145622.4031-1-linus.walleij@linaro.org>
        <20170924145622.4031-2-linus.walleij@linaro.org>
        <CAL_JsqKth+EHVZEVpT1U7qVvN77i7oZjBJH5bbowXcjJxETuoA@mail.gmail.com>
        <CGME20170926003941epcas4p2a1987500f6e213b6a2ffe973ab1db922@epcas4p2.samsung.com>
        <CACRpkdbGA1L7YZNuad7uysf4VAT2bi+PrZyFAKpVy9WUdaj+NA@mail.gmail.com>
        <59C9B52D.8050909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <59C9B52D.8050909@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

[snip]

>>
>>>> +External Connector Using GPIO
>>>
>>> What kind of connector? All connectors external to something... And
>>> GPIO is not a kind of connector on its own, but an implementation.
>>
>> Yeah that is a problem with the whole subsystem I guess. Should
>> I add a paragraph describing the usecases?
>>
>> The whole thing is a bit
>> of Androidism and is named like this because Android named it like
>> this in their kernel tree.
>>
>>>> +Required properties:
>>>> +- compatible: should be "extcon-gpio"
>>>> +- extcon-gpios: the GPIO lines used for the external connectors
>>>
>>> This doesn't tell me what the GPIOs functions are and should. For
>>> example we have hpd-gpios for HDMI hotplug detect in HDMI connector
>>> binding.
>>
>> The idea is that this array corresponds to the extcon-connector-types
>> right below, I'll clarify that if you think the overall idea is OK.
>>
>>>> +  See gpio/gpio.txt
>>>> +- extcon-connector-types: set to an unsigned integer value arrat representing the types
>>>> +  of this connector, matched to the corresponding GPIO lines in the previous array.
>>>
>>> This should be determined by the compatible string.
>>
>> So a GPIO connector is very versatile. It is "general purpose" by definition,
>> so it needs to be subclassed.
>>
>> One possibility is to allow just one GPIO and have one comptible-string per
>> use case.
>> compatible = "gpio-usb-connector";
>> compatible = "gpio-charger-connector";
>> compatible = "gpio-headphone-connector";
>> etc etc
>>
>> These bindings on the other hand, assume that the driver will be able
>> to handle an array of gpios with an associated array of connector types,
>> which reflects how many of the existing extcon-type driver hardware works:
>> a single PMIC providing some 5 misc extcons for example.
>>
>> For this reason there is a generic compatible string and then the device
>> is subclassed per-gpio with the per-gpio connector type.

The "drivers/input/keyboard/gpio_keys.c" driver used the 'linux,code' property
to get the key type as following in the device-tree file:

gpio-keys {                                       
	compatible = "gpio-keys";

	key-1 {
		gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
		linux,code = <KEY_1>;
		label = "SW2-1";
		wakeup-source;
	};

	key-2 {
		gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
		linux,code = <KEY_2>;
		label = "SW2-2";
		wakeup-source;
	};
};


IMO, extcon-gpio.c uses the 'gpio-connectors' compatible
instead of 'extcon-gpio' and then define the connector type
in the include/dt-bindings/extcon/connectors.h. How about this?

For example,
In the include/dt-bindings/extcon/connectors.h,

#define CONNECTOR_USB		1 /* EXTCON_USB */
#define CONNECTOR_USB_HOST	2 /* EXTCON_USB_HOST */
#define CONNECTOR_CHG_USB_SDP	5 /* EXTCON_CHG_USB_SDP */
#define CONNECTOR_CHG_USB_DCP	6 /* EXTCON_CHG_USB_DCP */
#define CONNECTOR_CHG_USB_CDP	7 /* EXTCON_CHG_USB_CDP */
#define CONNECTOR_CHG_USB_ACA	8 /* EXTCON_CHG_USB_ACA */
...
#define CONNECTOR_HDMI		40 /* EXTCON_DISP_HDMI */
...

In the devicetree example for 'gpio-connectors', 

	usb-connector {
		compatible = "gpio-connectors";
		gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
		linux,connector = <CONNECTOR_USB>;
		wakeup-source;
	};

	hdmi-connector {
		gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
		linux,connector = <CONNECTOR_HDMI>;
		wakeup-source;	
	};


>>
>>>> +/* USB external connector */
>>>> +#define EXTCON_USB             1
>>>> +#define EXTCON_USB_HOST                2
>>>> +#define EXTCON_CHG_USB_SDP     5       /* Standard Downstream Port */
>>>> +#define EXTCON_CHG_USB_DCP     6       /* Dedicated Charging Port */
>>>> +#define EXTCON_CHG_USB_CDP     7       /* Charging Downstream Port */
>>>> +#define EXTCON_CHG_USB_ACA     8       /* Accessory Charger Adapter */
>>>> +#define EXTCON_CHG_USB_FAST    9
>>>> +#define EXTCON_CHG_USB_SLOW    10
>>>> +#define EXTCON_CHG_WPT         11      /* Wireless Power Transfer */
>>>> +#define EXTCON_CHG_USB_PD      12      /* USB Power Delivery */
>>>
>>> These don't all look to be mutually exclusive.
>>>
>>> For USB PD, isn't that discoverable?
> 
> Currently, EXTCON_CHG_USB_PD is not used on any extcon provider drivers.
> I think that EXTCON_CHG_USB_PD is discoverable according to the H/W design
> such as using ADC.
> 
> Also, The charger connectors of extcon are related to power_supply subsystem
> because power_supply is in charge of behavior when the connector is attached/detached.
> So, the extcon defines the EXTCON_CHG_USB_PD in order to detect this type.
> 
>>
>> Someone else would have to answer, this is based on the current
>> connector types supported by the Linux kernel.
>>
>>>> +/* Display external connector */
>>>> +#define EXTCON_DISP_HDMI       40      /* High-Definition Multimedia Interface */
>>>> +#define EXTCON_DISP_MHL                41      /* Mobile High-Definition Link */
>>>> +#define EXTCON_DISP_DVI                42      /* Digital Visual Interface */
>>>> +#define EXTCON_DISP_VGA                43      /* Video Graphics Array */
>>>> +#define EXTCON_DISP_DP         44      /* Display Port */
>>>> +#define EXTCON_DISP_HMD                45      /* Head-Mounted Display */
>>>
>>> We already have connector bindings for most of these. Use those as a
>>> model for whatever you want to do.
>>
>> I guess they are not in Documentation/devicetree/bindings/extcon/*
>>
>> Please point me in the right direction and I'll check it out.
>>
>> Yours,
>> Linus Walleij
>>
>>
>>
> 

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
