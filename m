Return-Path: <glikely@secretlab.ca>
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <E700D92A-7777-46E7-A99C-D8321D4F1EE6@konsulko.com>
References: <1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1404493129-8914-6-git-send-email-pantelis.antoniou@konsulko.com>
 <20140711052437.2232BC40B84@trevor.secretlab.ca> <0E971359-9791-43D0-86C3-2CE81457934E@konsulko.com>
 <CACxGe6v7hTTtdjY3zAmAUR29zn+3iOFpuac2=CqiLAd5wXfn-A@mail.gmail.com> <E700D92A-7777-46E7-A99C-D8321D4F1EE6@konsulko.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 15 Jul 2014 23:54:40 -0600
Message-ID: <CACxGe6vZQ-LewrQmbM=3JebErJfX1u4uGoSUtHLGgHbz7fUddw@mail.gmail.com>
Subject: Re: [PATCH 5/5] of: Transactional DT support.
Content-Type: text/plain; charset=ISO-8859-1
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Linux I2C <linux-i2c@vger.kernel.org>, Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 15, 2014 at 12:41 AM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
> Hi Grant,
>
> On Jul 14, 2014, at 9:09 PM, Grant Likely wrote:
>
>> On Fri, Jul 11, 2014 at 2:28 PM, Pantelis Antoniou
>> <pantelis.antoniou@konsulko.com> wrote:
>>> Hi Grant,
>>>
>>> On Jul 11, 2014, at 8:24 AM, Grant Likely wrote:
>>>
>>>> On Fri,  4 Jul 2014 19:58:49 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
>>>>> Introducing DT transactional support.
>>>>>
>>>>> A DT transaction is a method which allows one to apply changes
>>>>> in the live tree, in such a way that either the full set of changes
>>>>> take effect, or the state of the tree can be rolled-back to the
>>>>> state it was before it was attempted. An applied transaction
>>>>> can be rolled-back at any time.
>>>>>
>>>>> If any transaction results in the change of a state of a device
>>>>> node, a notifier for that node will be fired which allows a bus
>>>>> to create/destroy devices as directed.
>>>>>
>>>>> Documentation is in
>>>>>     Documentation/devicetree/transactions.txt
>>>>
>>>> Hi Pantelis,
>>>>
>>>> I've got a lot of comments below, but you don't need to respin the
>>>> series immediately. I've got a tree that I'm working with to sort out
>>>> what I can queue up for the next kernel. Give me a few days and I'll
>>>> send you what I've gotten to.
>>>>
>>>
>>> OK, that would be good.
>>
>> It is rather rough, and I haven't squashed the patches together yet,
>> but you can see what I have here. I'm busy writing some basic
>> testcases to prove out the functionality before I squash things down.
>>
>
> Thanks for that. I'll pick this branch up and perform some testing from my
> own side.

I pushed out some extra bug fixes and new changes tonight, so make
sure you grab the latest tree.

g.
