From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 0/4] Move DP phy switch to PHY driver
Date: Thu, 30 Nov 2017 10:27:49 +0800
Message-ID: <c6fb4d29-6c6d-7f39-3cdd-3bc42c4519a2@rock-chips.com>
References: <1486712654-15431-1-git-send-email-zyw@rock-chips.com>
 <CAD=FV=VdUhfL+_MShYynoXKQW1-KpAOsW=x+hAxGZO78rJEyeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=VdUhfL+_MShYynoXKQW1-KpAOsW=x+hAxGZO78rJEyeQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Doug

Thank you for mentioning this patch.

I think the focus of the discussion is: can we put the grf control bit 
to dts.

The RK3399 has 2 Type-C phy, but only one DP controller, this "uphy_dp_sel"

can help to switch these 2 phy. So I think this bit can be considered as 
a part of

Type-C phy, these 2 phy have different bits, just similar to other bits 
(such as "pipe-status").

Put them to DTS file might be a accepted practice.



On 2017年11月29日 07:32, Doug Anderson wrote:
> Hi,
>
> On Thu, Feb 9, 2017 at 11:44 PM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>> There are 2 Type-c PHYs in RK3399, but only one DP controller. Hence
>> only one PHY can connect to DP controller at one time, the other should
>> be disconnected. The GRF_SOC_CON26 register has a switch bit to do it,
>> set this bit means enable PHY 1, clear this bit means enable PHY 0.
>>
>> If the board has 2 Type-C ports, the DP driver get the phy id from
>> devm_of_phy_get_by_index, and then control this switch according to
>> this id. But some others board only has one Type-C port, it may be PHY 0
>> or PHY 1. The dts node id can not tell us the correct PHY id. Hence move
>> this switch to PHY driver, the PHY driver can distinguish between PHY 0
>> and PHY 1, and then write the correct register bit.
>>
>>
>>
>> Chris Zhong (4):
>>    Documentation: bindings: add uphy-dp-sel for Rockchip USB Type-C PHY
>>    arm64: dts: rockchip: add rockchip,uphy-dp-sel for Type-C phy
>>    phy: rockchip-typec: support DP phy switch
>>    drm/rockchip: cdn-dp: remove the DP phy switch
>>
>>   Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt | 5 +++++
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi                     | 2 ++
>>   drivers/gpu/drm/rockchip/cdn-dp-core.c                       | 7 -------
>>   drivers/phy/phy-rockchip-typec.c                             | 9 +++++++++
>>   4 files changed, 16 insertions(+), 7 deletions(-)
> What ever happened to this series?  It seemed like it just dropped on
> the floor...
>
> There was a bit of contention on patch #3
> <https://patchwork.kernel.org/patch/9566095/> about the fact that we
> were specifying addresses in the device tree vs. hardcoding them in
> the driver.  Any way we can just make a decision and go with it?
>
>
> -Doug
>
>
>

-- 
Chris Zhong


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
