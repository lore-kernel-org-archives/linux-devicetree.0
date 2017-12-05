From: Krzysztof Adamski <k@japko.eu>
Subject: Re: [PATCH] ARM: dts: sun8i: h3: enable USB OTG for NanoPi Neo board
Date: Tue, 5 Dec 2017 23:10:16 +0100
Message-ID: <20171205221016.GA16666@t440.localdomain>
References: <20171201224942.GA12473@t440.localdomain>
 <20171205090706.et5a7dizkhn6auje@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171205090706.et5a7dizkhn6auje@flea.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 05, 2017 at 10:07:06AM +0100, Maxime Ripard wrote:
>> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
>> index 78f6c24952dd..14c3f137dbd3 100644
>> --- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
>> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
>> @@ -53,3 +53,20 @@
>> 	allwinner,leds-active-low;
>> 	status = "okay";
>> };
>> +
>> +&usb_otg {
>> +	status = "okay";
>> +	dr_mode = "peripheral";
>> +};
>> +
>> +&usbphy {
>> +	usb0_id_det-gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
>> +};
>> +
>> +&ohci0 {
>> +	status = "okay";
>> +};
>> +
>> +&ehci0 {
>> +	status = "okay";
>> +};
>
>Please sort the nodes in alphabetical order.

Will do in v2 sent in separate e-mail.

>Also, does it make sense to add the OHCI and EHCI controller for a
>peripheral-only device?

It does. The reasoning is the same as for the OrangePi Zero board in the
patch by Icenowy Zheng (72897fa31fcf6222a11c6ebb0bcca25628bb1f7c) - the
host mode on this board should work if you have external power source.
In this case you can switch the mode via sysfs. I wanted to be
consistent with the approach taken for the OrangePi Zero board. I added
this reasoning to the commit message of v2.

Best regards,
Krzysztof Adamski
