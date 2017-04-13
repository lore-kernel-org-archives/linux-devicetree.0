From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH v2 05/22] ARM: dts: at91: Add generic compatible string
 for I2C EEPROM
Date: Thu, 13 Apr 2017 18:09:56 -0300
Message-ID: <dd93eb32-ca1e-5041-051e-c4f072f0f9a2@osg.samsung.com>
References: <20170413182839.25381-1-javier@osg.samsung.com>
 <20170413182839.25381-6-javier@osg.samsung.com>
 <869a0f44-6c97-2109-776b-6da9b86c732a@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <869a0f44-6c97-2109-776b-6da9b86c732a-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Peter,

On 04/13/2017 05:43 PM, Peter Rosin wrote:
> On 2017-04-13 20:28, Javier Martinez Canillas wrote:

[snip]

>>  
>>  	eeprom@50 {
>> -		compatible = "nxp,24c02";
>> +		compatible = "nxp,24c02","atmel,24c02";
>>  		reg = <0x50>;
>>  		pagesize = <16>;
>>  	};
>>
> 
> Sure, in principle. But not having a space after the commas is a real OCD
> trigger for me. My spine is rotating... :-)
>

Right, Geert already pointed out. It's something I missed in my sed script
so I got it wrong in all the DTS :(

I'll fix my script and send a v2.
 
> Anyway, with those whitespace fixes (and without them too, but please):
> Acked-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
>

Thanks for the review!

> Cheers,
> peda
> 
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
