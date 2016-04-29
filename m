From: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] support control with using GPIO lines
Date: Fri, 29 Apr 2016 14:40:25 +0900
Message-ID: <CAC5umyhLZ7Nvakf84qS73HG=H39mjYf5Lv=BPFnqZt-rTrZvCA@mail.gmail.com>
References: <1460300366-25248-1-git-send-email-akinobu.mita@gmail.com>
	<20160410151237.GD5377@piout.net>
	<1460301781.17404.171.camel@gmail.com>
	<20160410153855.GG5377@piout.net>
	<20160412012518.GQ3351@sirena.org.uk>
	<CAC5umyguFq7vBenkJYM8AWCNJ3oGBKzKAMHHMsO=+OFHtE4b0A@mail.gmail.com>
	<20160427135012.GP3217@sirena.org.uk>
	<1461765799.2957.4.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461765799.2957.4.camel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-04-27 23:03 GMT+09:00 Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On Wed, 2016-04-27 at 14:50 +0100, Mark Brown wrote:
>> On Wed, Apr 27, 2016 at 04:53:18AM +0900, Akinobu Mita wrote:
>>
>> >
>> > For the read data transfer, the address/command byte is sent on the
>> > rising edge of the first eight SCLK cycles and the read data byte
>> > is
>> > transmitted on the falling edge of the next eight SCL cycles.
>> That's an innovative and exciting hardware design :/  Definitely
>> doesn't
>> seem to correspond too closely to any SPI mode I can think of.
>
> DS1302 uses the standard MicroWire half-duplex transfer timing. The
> timing can be handled by eg. PXA270 built-in SPI controller with proper
> configuration.

Thanks for clarification about the hardware.

I feel that using spi-gpio to communicate with DS1302 is difficult
because we need to introduce different timing option to spi-gpio
(spi-bitbang) for the I/O pin which is tri-stated upon each rising
edge of SCLK, as I said in the last email.

So I think that the way like the patch 3 and 4 in this series showed
is reasonable.  And rtc-ds2404, rtc-moxart, and rtc-v3020 do something
similar.

If there is no complaint, I'll resend patch 3 and 4 with small fixes.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
