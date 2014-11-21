From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v1] usb: phy: nop: device tree documentation for vbus
Date: Fri, 21 Nov 2014 18:49:47 +0100
Message-ID: <87ioi85tqc.fsf@free.fr>
References: <1415538138-24434-1-git-send-email-robert.jarzmik@free.fr>
	<20141121154506.GG7508@saruman> <87r3ww5v7d.fsf@free.fr>
	<20141121172259.GU7508@saruman>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141121172259.GU7508@saruman> (Felipe Balbi's message of "Fri,
	21 Nov 2014 11:22:59 -0600")
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> writes:

> On Fri, Nov 21, 2014 at 06:17:58PM +0100, Robert Jarzmik wrote:
>> Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> writes:
>> 
>> > On Sun, Nov 09, 2014 at 02:02:18PM +0100, Robert Jarzmik wrote:
>> >>  	hsusb1_phy {
>> >> @@ -26,8 +31,11 @@ Example:
>> >>  		clock-names = "main_clk";
>> >>  		vcc-supply = <&hsusb1_vcc_regulator>;
>> >>  		reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
>> >> +		vbus-gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
>> >> +		vbus-regulator = <&vbus_regulator>;
>> >
>> > not sure why you need vbus-gpios here. You can pass the gpio to the
>> > regulator as enable-gpio, right ?
>> 
>> Euh no. From my understanding a regulator enable-gpio is an _output_ gpio
>> enabling the regulator. This vbus-gpio is an _input_ gpio detecting the vbus
>> assertion. Maybe a name like "vbus-detect-gpio" would be more accurante ?
>
> aha, that clears it up, yeah. So the GPIO is detecting if we have VBUS
> from the host side while the regulator supplies VBUS ?
Yup, exactly. I'll amend the name for v2.

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
