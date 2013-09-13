From: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Fri, 13 Sep 2013 12:55:47 +0800
Message-ID: <52329AD3.2050608@freescale.com>
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com> <20130905020435.GA3970@gmail.com> <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com> <522817D7.1010206@freescale.com> <522D3B79.3060707@freescale.com> <52318953.6090405@freescale.com> <1378979431.2627.402.camel@shinybook.infradead.org> <20130913025827.GA3051@gmail.com> <1378999322.4210.95.camel@i7.infradead.org> <20130913041208.GD3051@gmail.com> <20130912205644.GW29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130912205644.GW29403-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>, "thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org" <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "b44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <b44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=D3=DA 2013=C4=EA09=D4=C213=C8=D5 04:56, Mark Brown =D0=B4=B5=C0:
> On Fri, Sep 13, 2013 at 12:12:14AM -0400, Huang Shijie wrote:
>
>> I think the controller is designed for the NOR flash, yes, a little
>> strange.
> I think this is part of the problem - you're trying to represent
> something that isn't really a SPI controller as a SPI controller (or =
at
> least trying to implement functionality beyond that which a SPI
> controller has).
>
The QuadSpi is not a traditional SPI controller, but i think it is stil=
l
a SPI controller.
It connects and controls the SPI NOR FLASH, so what do you think it is?


>> Mark and you want to create the LUT instruction sequence at the runt=
ime,
>> But there is some disadvantage if we do so:
>>   [1] low efficiency:=20
>>   [2] we may can not create all the LUT instruction sequence at the
>>       runtime. For example, the buffer program(OPCODE_PP):
>>   [3] We may can not create the LUT instruction sequence at the runt=
ime,
>>       since we can not get enough information from the spi_transfer{=
}.
>>       A whole LUT instruction sequence may needs the following info:
> What this is saying to me is that you should not be impementing this =
as
If the quadspi controller is not a SPI controller, what controller is i=
t?


> a SPI controller, trying to do that is breaking the abstracton that S=
PI
> is offering.  Like people have said SPI is just about byte streams.
yes, SPI is now just about the byte streams.



But the Quadspi controller can not work with the byte streams directly,
it works with the LUT instruction sequences, so we have to parse the
byte streams,
and then uses the right LUT to trigger the transaction.



> I think what you should be doing is refactoring the MTD code which
> interfaces to SPI flashes to split out the code so that there's an
> abstraction which can express what this controller (and presumably
> other controllers) can do and then implement this functionaltiy at
> that level.
If i follow this advice, i have to create a new file cloned by the m25p=
80.c,
and replace all the SPI APIs with other APIs.

I have no idea what APIs can be used to replace the SPI APIs.


thanks
Huang Shijie



--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
