Return-Path: <SRS0=wcIq=TG=c-mauderer.de=oss@kernel.org>
Subject: Re: [PATCH v3 2/2] leds: spi-byte: add single byte SPI LED driver
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <20190505200022.32209-2-oss@c-mauderer.de>
 <8c150278-4bf6-4202-998e-4d82a2a3cd3c@ti.com>
 <3f0d7a10-a67e-a2c2-98fe-a487493b8f2c@c-mauderer.de>
 <fb0bc2a0-1311-3a45-04db-5cddcba48392@ti.com> <20190506151500.GA6221@amd>
From: Christian Mauderer <oss@c-mauderer.de>
Message-ID: <3de252f0-de98-bec2-b233-8be1d38a4671@c-mauderer.de>
Date: Mon, 6 May 2019 17:29:59 +0200
MIME-Version: 1.0
In-Reply-To: <20190506151500.GA6221@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 06/05/2019 17:15, Pavel Machek wrote:
> Hi!
> 
>>> Of course it would have been possible to make it a lot more universal by
>>> for example adding a prefix, a bit mask or other word lengths. But that
>>> would have added a lot of complexity without any actual application.
>>>
>>
>> I have to disagree here.  If this is supposed to be a universal SPI byte driver that
>> needs special handling then it is either needs to be created in a universal way or needs to be made
>> target specific.
>>
> 
> Let him be. The driver is good.
> 
> If some hardware needs more flexibility, we add it.
> 
> No need to have 1000 releases of everything.
> 
> 									Pavel
> 

Hello Pavel,

thanks for the support.

It's a pure hobby project so I have the time to add useful features or
to improve the description to make it clear what the drivers intention
is. So if we find a more useful set of features it's a good idea to
discuss it.

By the way: Although I haven't written a Linux driver yet it's not my
first open source project. So I know that there can be a lot of
different opinions and sometimes a lot of revisions. So no big risk of
scaring me away.

Best regards

Christian
