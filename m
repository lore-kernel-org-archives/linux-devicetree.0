From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH] ARM: sun8i: h2+: add support for Banana
 Pi M2 Zero board
Date: Fri, 03 Nov 2017 07:53:17 +0800
Message-ID: <b548b74e04b29ec8c3cddb7cc42f2b4e@aosc.io>
References: <20171101093814.19177-1-icenowy@aosc.io>
 <20171102090248.wnvj7dpphn5uqsut@flea>
 <8327eaeaa12b99f9962a53c9f02ddd6d@aosc.io>
 <20171102155003.vp7uve4ypyn4sb6j@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171102155003.vp7uve4ypyn4sb6j@flea>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-11-02 23:50，Maxime Ripard 写道：
> On Thu, Nov 02, 2017 at 05:07:30PM +0800, Icenowy Zheng wrote:
>> > > +&mmc0 {
>> > > +	pinctrl-names = "default";
>> > > +	pinctrl-0 = <&mmc0_pins_a>;
>> > > +	vmmc-supply = <&reg_vcc3v3>;
>> > > +	bus-width = <4>;
>> > > +	/*
>> > > +	 * In different revisions the board have different card detect
>> > > +	 * configuration.
>> > > +	 */
>> >
>> > Which ones?
>> 
>> In the sample batch (1.2V fixed voltage) the card detect is normal
>> (PF6 low as inserted), however in the final batch (1.1V/1.3V
>> switchable) it's inverted at PF6 (high as inserted).
> 
> Then just use the final version's.
> 
>> > > +&usbphy {
>> > > +	usb0_id_det-gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
>> > > +	/* USB OTG VBUS is directly connected to 5V without any regulators
>> > > */
>> >
>> > So it cannot operate in OTG, but it's host only?
>> 
>> It can operate in OTG -- you can power the board via the OTG port,
>> as the VBUS is not gated from 5V at all, so 5V power at VBUS will
>> power up the board. Yes, it's a bit unsafe, but the board designer
>> did it.
> 
> What will provide the 5v in the first place then if a USB device is
> connected to the micro-USB connector?

There're two micro-USB connectors, one is power-only and another is
OTG. The Vbus of these two connectors are connected together, so
the external USB device will be powered just by the power input
from the power-only USB port.

> 
> Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
