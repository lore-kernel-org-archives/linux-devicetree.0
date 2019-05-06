Return-Path: <SRS0=hkqx=TG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hamsrv800.servertools24.de ([213.238.32.28]:53391 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726277AbfEFTMi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 May 2019 15:12:38 -0400
Subject: Re: [PATCH v3 2/2] leds: spi-byte: add single byte SPI LED driver
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <20190505200022.32209-2-oss@c-mauderer.de>
 <8c150278-4bf6-4202-998e-4d82a2a3cd3c@ti.com>
 <3f0d7a10-a67e-a2c2-98fe-a487493b8f2c@c-mauderer.de>
 <fb0bc2a0-1311-3a45-04db-5cddcba48392@ti.com> <20190506151500.GA6221@amd>
 <3de252f0-de98-bec2-b233-8be1d38a4671@c-mauderer.de>
 <8b55ddf2-379b-9012-9d91-e31ab4f6a68a@ti.com>
From: Christian Mauderer <oss@c-mauderer.de>
Message-ID: <16bbe798-473b-c20b-60b2-61444f0518eb@c-mauderer.de>
Date: Mon, 6 May 2019 21:12:34 +0200
MIME-Version: 1.0
In-Reply-To: <8b55ddf2-379b-9012-9d91-e31ab4f6a68a@ti.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello Dan,

On 06/05/2019 19:40, Dan Murphy wrote:
> Christian
> 
> On 5/6/19 10:29 AM, Christian Mauderer wrote:
>> On 06/05/2019 17:15, Pavel Machek wrote:
>>> Hi!
>>>
>>>>> Of course it would have been possible to make it a lot more universal by
>>>>> for example adding a prefix, a bit mask or other word lengths. But that
>>>>> would have added a lot of complexity without any actual application.
>>>>>
>>>>
>>>> I have to disagree here.  If this is supposed to be a universal SPI byte driver that
>>>> needs special handling then it is either needs to be created in a universal way or needs to be made
>>>> target specific.
>>>>
>>>
>>> Let him be. The driver is good.
>>>
>>> If some hardware needs more flexibility, we add it.
>>>
>>> No need to have 1000 releases of everything.
>>>
>>> 									Pavel
>>>
>>
>> Hello Pavel,
>>
>> thanks for the support.
>>
>> It's a pure hobby project so I have the time to add useful features or
>> to improve the description to make it clear what the drivers intention
>> is. So if we find a more useful set of features it's a good idea to
>> discuss it.
>>
>> By the way: Although I haven't written a Linux driver yet it's not my
>> first open source project. So I know that there can be a lot of
>> different opinions and sometimes a lot of revisions. So no big risk of
>> scaring me away.
>>
> 
> Hopefully the feedback from all is helping you with developing kernel drivers :).

I hadn't expected a such big discussion for such a small driver. But
it's no problem. Part of my work is to develop drivers for a open source
real time operating system. So I'm used to discussions. The community is
only a lot smaller and the drivers are far less standardized than for Linux.

> 
> One request though is can you slow down a bit in the versions?
> I had 3 versions in my inbox before I had a chance to review v1.
> 
> I have been asked the same thing by someone and now I try to give at least 24-48 hours so others over seas
> can get a chance to review prior to posting a new version.

I planned to wait till the discussion cools down before creating a v4. I
only have been so fast because yesterday I had the impression that some
big changes are requested and therefore created a v2. After that the
feedback seemed to only need detail changes therefore v3. But I forgot
that it maybe would be a good idea to wait till Monday.

Best regards

Christian

>
> Dan
> 
>> Best regards
>>
>> Christian
>>
