From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 2/3] usb: gadget: pxa27x_udc device-tree documentation
Date: Wed, 25 Jun 2014 21:54:01 +0200
Message-ID: <87zjh07okm.fsf@free.fr>
References: <1403427899-32154-1-git-send-email-robert.jarzmik@free.fr>
	<1403427899-32154-2-git-send-email-robert.jarzmik@free.fr>
	<20140625103357.GC14495@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140625103357.GC14495@leverpostej> (Mark Rutland's message of
	"Wed, 25 Jun 2014 11:33:57 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb@vger.kernel.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:

> On Sun, Jun 22, 2014 at 10:04:58AM +0100, Robert Jarzmik wrote:
>> index 79729a9..0e4863f 100644
>> --- a/Documentation/devicetree/bindings/usb/pxa-usb.txt
>> +++ b/Documentation/devicetree/bindings/usb/pxa-usb.txt
>> @@ -29,3 +29,23 @@ Example:
>>  		marvell,port-mode = <2>; /* PMM_GLOBAL_MODE */
>>  	};
>>  
>> +UDC
>> +
>> +Required properties:
>> + - compatible: Should be "marvell,pxa27x-udc" for USB controllers
>> +   used in device mode.
>
> We typically don't like wildcard compatible strings in DT.
Same as in the other patch, "marvell,pxa270-udc".
>
>> +
>> +Optional properties:
>> + - "udc-pullup-gpio" - gpio activated to control the USB D+ pullup.
>> + - "udc-pullup-gpio-inverted" - boolean inverting gpio pullup logic.
>
> Use the GPIO bindings.
OK. I'm presuming in this case you think of something like :
	udc-pullup-gpio = <&gpio 22 GPIO_ACTIVE_LOW>
Which translates into:
	"udc-pullup-gpio" - gpio activated to control the USB D+ pullup (see
        gpio.txt)

>
>> +
>> +Example:
>> +
>> +		pxa27x_udc: udc@40600000 {
>> +			compatible = "marvell,pxa27x-udc";
>> +			reg = <0x40600000 0x10000>;
>> +			interrupts = <11>;
>> +			clocks = <&pxa2xx_clks 11>;
>> +			clock-names = "pxa27x-udc";
>
> Neither of these were mentioned above.
Ah you mean I shall describe the standard reg, interrupts as mandatory standard
options I take it. OK.
>
> The name of the clock input doesn't make sense.
I don't understand. With [1] does it make any more sense ? If not you'll have to
expand a bit more the "doesn't make sense".

Cheers.

--
Robert

[1] http://www.spinics.net/lists/arm-kernel/msg337522.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
