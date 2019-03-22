Return-Path: <SRS0=rSv0=RZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from uho.ysoft.cz ([81.19.3.130]:53410 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727495AbfCVGCg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 22 Mar 2019 02:02:36 -0400
Subject: Re: PM: RE: [PATCH] ARM: dts: imx6dl-yapp4: Use correct pseudo PHY
 address for the switch
References: <1553080145-29348-1-git-send-email-michal.vokac@ysoft.com>
 <3351685.tXMZElDEK0@debian64>
 <517b0bc6-9128-02be-7adb-7da286a0c00d@ysoft.com>
 <20190322012203.GQ12513@dragon>
From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <b8f2854b-9e6f-b3e5-35bd-3d246747458c@ysoft.com>
Date: Fri, 22 Mar 2019 07:02:33 +0100
MIME-Version: 1.0
In-Reply-To: <20190322012203.GQ12513@dragon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Christian Lamparter <chunkeey@gmail.com>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 22. 03. 19 2:22, Shawn Guo wrote:
> On Thu, Mar 21, 2019 at 01:44:26PM +0100, Michal Vokáč wrote:
>> Hi Christian,
>>
>> I added all the original recipients back to your PM as we may get some
>> useful feedback from someone.
>>
>> On 21. 03. 19 0:17, Christian Lamparter wrote:
>>> On Wednesday, March 20, 2019 12:09:05 PM CET you wrote:
>>>> The switch is accessible through pseudo PHY which is located at 0x10.
>>>
>>> It doesn't look like your patch made it to the device-tree patchwork?!
>>> (Maybe your @ysoft.com is blacklisted or something else is broken?)
>>
>> I am aware of that and I am quite sure my mail is not blacklisted.
>> I submitted quite some patches recently and some of those made it to
>> the device-tree patchwork with no problem. I've got the impression that
>> only patches that modify something inside Documentation/devicetree/ are
>> visible there (but I do not really know how the system works).
>>
>> @Rob, would you mind to shortly clarify how this works?
>>
>>> Also I don't think devicetree-tree would merge it. I think the best bet
>>> would be to resent the mail and include netdev mailing list and everyone
>> >from the get_maintainer.pl output:
>>
>> I always use the get_maintainter.pl script to get some initial list and
>> then I apply common sense to shrink/broaden the list to which people and
>> lists send the patches.
>>
>>> Shawn Guo <shawnguo@kernel.org> (maintainer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
>>> Sascha Hauer <s.hauer@pengutronix.de> (maintainer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
>>> Pengutronix Kernel Team <kernel@pengutronix.de> (reviewer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
>>> Fabio Estevam <festevam@gmail.com> (reviewer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
>>> NXP Linux Team <linux-imx@nxp.com> (reviewer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
>>> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>>> linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
>>
>> In this case this is really trivial patch so I think bothering all those
>> people is not necessary. In my case the script actually reports more
>> items then what you posted.
> 
> For future patches, please do copy folks above.  We need more eyes.

OK, I will do so. Thank you Shawn.

Michal
