From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v1 1/3] usb: phy: device-tree documentation for gpio-vbus
Date: Tue, 04 Nov 2014 22:27:09 +0100
Message-ID: <87wq7a1wsy.fsf@free.fr>
References: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
	<CA+gwMcco4-aOHd4tQRFkUts+C9G5+ymxEhGXYB_FaeuBLQSBrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+gwMcco4-aOHd4tQRFkUts+C9G5+ymxEhGXYB_FaeuBLQSBrw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Philipp Zabel's message of "Tue, 4 Nov 2014 09:20:55 +0100")
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Hi Robert,
>
> On Sun, Nov 2, 2014 at 7:11 PM, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> wrote:

> Maybe duplicate the comment from the driver here how his is about
> B peripheral only devices
Yeah sure, for v2.

>> +Required properties:
>> +- compatible : should be "generic,phy-gpio-vbus"
>
> I'm not sure about the compatible value. I have not seen the "generic,"
> vendor prefix, and all the other generic gpio-something bindings don't
> use any prefix: "gpio-gate-clock", "gpio-leds", "gpio-beeper",
> "pps-gpio", etc.
Okay, so we'll probably end up on "phy-gpio-vbus" then.

>> +- #phy-cells : from the generic PHY bindings, must be 1.
>> +- gpios      : set of 2 gpio properties (see gpio.txt for gpio properties format)
>> +               first gpio is required, it's the VBus sensing input gpio
>> +              second gpio is optional, it's the D+ pullup controlling output
>> +              gpio
>> +
>> +Optional properties:
>> +- wakeup     : boolean, if true the VBus gpio will wakeup the platform
>
> The vbus_draw regulator should be part of this binding, I think.
Indeed. It should be optional, right ? Schedules for v2.

>> +Example:
>> +       usb2phy : gpio-vbus@13 {
>> +               compatible = "generic,phy-gpio-vbus";
>> +               gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
>> +               wakeup;
>
> This on the other hand might be too generic.
> I'd like to see just wakeup used here, but the other bindings prefix
> "linux," (or "gpio-key,").
If I write this, would you change to better suit you ?
	usb2phy : gpio-vbus@13 {
		compatible = "phy-gpio-vbus";
		regulator-vbus: regulator@0 {
                	regulator-min-microvolt = <5000000>;
                	regulator-max-microvolt = <5000000>;
			regulator-always-on;
		};
		vbus-gpio = <&gpio 13 GPIO_ACTIVE_LOW>;
		wakeup;
	};               

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
