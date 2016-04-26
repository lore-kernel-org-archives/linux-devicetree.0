From: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] support control with using GPIO lines
Date: Wed, 27 Apr 2016 04:53:18 +0900
Message-ID: <CAC5umyguFq7vBenkJYM8AWCNJ3oGBKzKAMHHMsO=+OFHtE4b0A@mail.gmail.com>
References: <1460300366-25248-1-git-send-email-akinobu.mita@gmail.com>
	<20160410151237.GD5377@piout.net>
	<1460301781.17404.171.camel@gmail.com>
	<20160410153855.GG5377@piout.net>
	<20160412012518.GQ3351@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160412012518.GQ3351-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sorry for the late reply.

2016-04-12 10:25 GMT+09:00 Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Sun, Apr 10, 2016 at 05:38:55PM +0200, Alexandre Belloni wrote:
>> On 10/04/2016 at 18:23:01 +0300, Sergei Ianovich wrote :
>
>> > No, unfortunately. I've investigated this possibility for my platform.
>> > spi-gpio doesn't support LSB-first and 3-wire options. Adding support
>> > there is a very big change. The best way to add GPIO support is to
>> > create spi-gpio-3wire with LSB-first support.
>
>> Mark, do you have nay opinion on that?
>
> Three wire doesn't seem like it should be invasive, LSB is going to be a
> lot more invasive though it seems reasonable to just do the reversal in
> the driver for whatever device this is and let the SPI controller run
> normally.  Or we could do that in the core with a pass over the data.

I've added 3wire support to spi-gpio and added the bit reversal logic
to ds1302 driver if the spi mode is not LSB first.  But the register
read command doesn't work.  I think there is no suitable SPI mode that
can communicate with DS1302.  The reason is as follows.

For the read data transfer, the address/command byte is sent on the
rising edge of the first eight SCLK cycles and the read data byte is
transmitted on the falling edge of the next eight SCL cycles.

But in the latter read data byte data phase, I/O pin is tri-stated
upon each rising edge of SCLK.
(Please see DATA OUTPUT section and Figure 6. Timing Diagram: Read Data
Transfer in https://datasheets.maximintegrated.com/en/ds/DS1302.pdf)

So if the SPI mode 0 (CPOL=0 CPHA=0) is selected, the address/command
byte phase is ok but the read data byte is unavailable because each
bit is retrieved while SCLK is high.  Similarly there is no suitable
SPI mode for DS1302.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
