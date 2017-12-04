From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 0/4] Move DP phy switch to PHY driver
Date: Mon, 4 Dec 2017 10:47:08 +0800
Message-ID: <8042d73f-c1de-da41-9066-2377de1f521c@rock-chips.com>
References: <1486712654-15431-1-git-send-email-zyw@rock-chips.com>
 <c6fb4d29-6c6d-7f39-3cdd-3bc42c4519a2@rock-chips.com>
 <CAD=FV=Vk0fOfYXc2gGDpvoVuT8m9WGT-eJ4hOM=G5MY_Bzzpwg@mail.gmail.com>
 <1941891.vosvJnn3h1@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=gb18030; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1941891.vosvJnn3h1@phil>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel@list>
List-Id: devicetree@vger.kernel.org

Hi Heiko


On 2017Äê12ÔÂ02ÈÕ 05:58, Heiko Stuebner wrote:
> Am Freitag, 1. Dezember 2017, 13:42:46 CET schrieb Doug Anderson:
>> Hi,
>>
>> On Wed, Nov 29, 2017 at 6:27 PM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>>> Hi Doug
>>>
>>> Thank you for mentioning this patch.
>>>
>>> I think the focus of the discussion is: can we put the grf control bit to
>>> dts.
>>>
>>> The RK3399 has 2 Type-C phy, but only one DP controller, this "uphy_dp_sel"
>>>
>>> can help to switch these 2 phy. So I think this bit can be considered as a
>>> part of
>>>
>>> Type-C phy, these 2 phy have different bits, just similar to other bits
>>> (such as "pipe-status").
>>>
>>> Put them to DTS file might be a accepted practice.
>> I guess the first step would be finding the person to make a decision.
>> Is that Heiko?  Olof?  Kishon?  Rob?.  As I see it there are a few
>> options:
>>
>> 1. Land this series as-is.  This makes the new bit work just like all
>> the other ones next to it.  If anyone happens to try to use an old
>> device tree on a new kernel they'll break.  Seems rather unlikely
>> given that the whole type C PHY is not really fully functional
>> upstream, but technically this is a no-no from a device tree
>> perspective.
>>
>> 2. Change the series to make this property optional.  If it's not
>> there then the code behaves like it always did.  This would address
>> the "compatibility" problem but likely wouldn't actually help any real
>> people, and it would be extra work.
>>
>> 3. Redo the driver to deprecate all the old offsets / bits and just
>> put the table in the driver, keyed off the compatible string and base
>> address if the IO memory.
>>
>>
>> I can't make this decision.  It's up to those folks who would be
>> landing the patch and I'd be happy with any of them.  What I'm less
>> happy with, however, is the indecision preventing forward progress.
>> We should pick one of the above things and land it.  My own personal
>> bias is #1: just land the series.  No real people will be hurt and
>> it's just adding another property that matches the ones next to it.
> I'd second that #1 . That whole type-c phy thingy never fully worked in
> the past (some for the never used dp output), so personally I don't have
> issues with going that route.
>
>
>>  From a long term perspective (AKA how I'd write the next driver like
>> this) I personally lean towards to "tables in the driver, not in the
>> device tree" but quite honestly I'm happy to take whatever direction
>> the maintainers give.
> It looks like we're in agreement here :-) . GRF stuff should not leak into
> the devicetree, as it causes endless headaches later. But I guess we'll
> need to live with the ones that happened so far.
>
So, the first step is: move all the private property of tcphy to 
drivers/phy/rockchip/phy-rockchip-typec.c.
Second step: new a member: uphy-dp-sel.
In my mind, we should have discussed these properties before, and then I 
moved them all into DTS.


>
>
>
>

-- 
Chris Zhong


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
