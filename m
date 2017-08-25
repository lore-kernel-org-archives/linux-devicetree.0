From: Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
Subject: Re: [PATCH 1/2] rtc: v3020: Add documentation for DT bindings
Date: Fri, 25 Aug 2017 18:36:20 -0400
Message-ID: <59A0A664.7040904@mothictech.com>
References: <b832db93-9885-adfe-39b4-1950851b391d@mothictech.com> <660fa006-4f91-2fb5-ef98-ba0482e1ecff@mothictech.com> <20170825215457.qcd5paiw5qtuybxv@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170825215457.qcd5paiw5qtuybxv@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/25/2017 05:54 PM, Rob Herring wrote:
>> +
>> +Required for MMIO connection:
>> +  - reg : should contain registers location and length.
>
> Looking at the datasheet, there's really no such thing. You'd have to
> have some specialized h/w to generate the serial waveform.

If it's MMIO attached i.e. hooked up to a single data bit on an 
otherwise multi-drop, flat addressed external bus, you do have to 
specify the memory address at which one would access the device.  Length 
is irrelevant, yes, as it has but one externally-accessible "register" 
in its memory map.

Is there a better way to handle this sort of thing than the typical 
"reg" binding?  It certainly seems to map nicely to ioremap().

>
>> +
>> +Required for GPIO connection:
>> +- emmicro,use-gpio
>> +- cs-gpios, wr-gpios, rd-gpios, io-gpios : specify gpios connected to
>> +  corresponding pins of the RTC
>> +
>> +Optional properties:
>> +- emmicro,mmio-left-shift : data bit to which IO line is connected for MMIO
>> +  connection (defaults to 0)
>
> This has come up several times on RTCs (LP8841, DS1302). This really
> looks like SPI and could probably use the spi-gpio bitbang driver.

Indeed it is perhaps like that.

This was a comparatively blind pass at DT-izing the existing driver 
without other changes.  It does work and has immediate application on a 
mainline'd DT board: Compulab CM-T3517 which is in fact what I'm porting to.

I don't think you could use spi-gpio bitbang if you had it 
memory-mapped, and there are actual platforms that do this.  Some of 
Compulab's older PXA based boards appear to do it, and they are in fact 
the boards still using pdata rather than DT that caused me to keep that 
around when doing this.

-- 
Brandon Martin
Mothic Technologies
317-565-1357 x7000
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
