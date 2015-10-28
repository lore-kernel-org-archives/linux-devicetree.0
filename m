From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH 3/3] ARM: BCM: Add SMP support for Broadcom NSP
Date: Wed, 28 Oct 2015 20:10:47 +0100
Message-ID: <56311DB7.5000905@hauke-m.de>
References: <1444844820-24290-1-git-send-email-kapilh@broadcom.com> <1444844820-24290-4-git-send-email-kapilh@broadcom.com> <561ED691.8080407@hauke-m.de> <561FD005.3040900@broadcom.com> <562016A9.7050208@hauke-m.de> <20151015211703.GQ32089@broadcom.com> <5630DA81.4030301@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5630DA81.4030301@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kapil Hali <kapilh@broadcom.com>, Jon Mason <jonmason@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 10/28/2015 03:24 PM, Kapil Hali wrote:
> 
> 
> On 10/16/2015 2:47 AM, Jon Mason wrote:
>> On Thu, Oct 15, 2015 at 11:12:09PM +0200, Hauke Mehrtens wrote:
>>> On 10/15/2015 06:10 PM, Kapil Hali wrote:
>>>>
>>>>
>>>> On 10/15/2015 3:56 AM, Hauke Mehrtens wrote:
>>>>> On 10/14/2015 07:47 PM, Kapil Hali wrote:
>>>>>> Add SMP support for Broadcom's Northstar Plus SoC,
>>>>>> cpu enable method and pen_release procedures. This
>>>>>> changes also consolidates iProc family's - BCM NSP
>>>>>> and BCM Kona, SMP handling in a common file.
>>>>>
>>>>> This will probably also work on normal Northstar CPUs without changes.
>>>>>
>>>> I think, it should work for most of the variants of Northstar family, 
>>>> except for those which have a BOOTROM bug.
>>>
>>> Which SoC are affected by this BOOTROM bug?
>>
>> 53012 is the one I am seeing.  Not seeing it on 4708 (and assuming it is
>> not present on 4709).  Internally, we do the ugly bug workaround on
>> all Northstar SoCs.  The workaround is not acceptable upstream, so I
>> am not pushing it. :)
>>
>> Thanks,
>> Jon
>>
> 
> Hi Hauke,
> 
> Now that you have tested Jon's patch which is based on my changes for
> SMP, shall I take his changes and add it on top of my changes and resend?
> Also, do I consider your Acked-by and Tested-by for the change?
> 
> Thanks,
> Kapil
> 

Hi Kapil,

I tested this on Northstar 1.

Acked-by: Hauke Mehrtens <hauke@hauke-m.de>
Tested-by: Hauke Mehrtens <hauke@hauke-m.de>

I think Florian has to take the patches and you should hurry up because
the merge window probably opens on Monday.

You can send all patches again with the bcm501x patch or just that one,
I assume there are no changes needed for the other patches?

Hauke
