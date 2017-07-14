From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RFC PATCH 3/6] phy: rockcip-pcie: reconstruct driver to support
 per-lane PHYs
Date: Fri, 14 Jul 2017 17:14:22 +0800
Message-ID: <f612829f-0bcb-3a8f-76e1-b88e1932f888@rock-chips.com>
References: <1500004101-240296-1-git-send-email-shawn.lin@rock-chips.com>
 <1500004366-241633-1-git-send-email-shawn.lin@rock-chips.com>
 <1500004366-241633-2-git-send-email-shawn.lin@rock-chips.com>
 <20170714051030.GA59140@google.com>
 <a0b188ea-71e2-8c8a-999d-754a35891ab9@rock-chips.com>
 <59686CCA.60804@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59686CCA.60804-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jeffy,

On 2017/7/14 15:03, jeffy wrote:
> Hi Shawn,
> 
> On 07/14/2017 02:33 PM, Shawn Lin wrote:
>>>
>>>> +        return rk_phy->phys[0];
>>>> +    }
>>>> +}
>>>> +
>>>>   static inline void phy_wr_cfg(struct rockchip_pcie_phy *rk_phy,
>>>>                     u32 addr, u32 data)
>>>>   {
>>>> @@ -114,20 +139,55 @@ static inline u32 phy_rd_cfg(struct
>>>> rockchip_pcie_phy *rk_phy,
>>>>       return val;
>>>>   }
>>>> -static int rockchip_pcie_phy_power_off(struct phy *phy)
>>>> +static int rockchip_pcie_phy_common_power_off(struct phy *phy)
>>>>   {
>>>>       struct rockchip_pcie_phy *rk_phy = phy_get_drvdata(phy);
>>>>       int err = 0;
>>>> +    if (WARN_ON(!rk_phy->pwr_cnt))
>>>> +        return -EINVAL;
>>>> +
>>>> +    if (rk_phy->pwr_cnt > 0)
>>>
>>> This should be:
>>>
>>>     if (--rk_phy->pwr_cnt)
>>>
>>> Also, you technically might need locking, now that multiple phys (which
>>> each only have their own independent mutex) are accessing the same
>>> refcount. Or maybe just make this an atomic variable.
>>
>> Good catch!
> Sounds like we need something similar to phy-core.c's power_count and 
> init_count.

Probably, and I will look into it later.

> 
>>>> +
>>>>       return 0;
>>>>   }
>>>> +#define DECLARE_PHY_POWER_OFF_PER_LANE(id) \
>>>> +static int rockchip_pcie_lane##id##_phy_power_off(struct phy *phy) \
>>>
>>> What? All this macro magic (and duplicate generated functions) should
>>> not be necessary. You just need some per-phy data that keeps the index.
>>
>> I can't quite follow yours here. The only argument passing on to
>> the PHY APIs is 'struct phy *phy', and how could you trace the index
>> from it? The caller should save phy instead of 'rockchip_pcie_phy', in
>> which the per-phy data should be.
>>
>> Or could you kindly show me some example here:)
>>
> Maybe add a struct rockchip_pcie_phy_data for each phy, contains their 
> index and a pointer to the common struct rockchip_pcie_phy?

yes, I got Brian's point after reading it more times, and I almost
finish converting to per-lane data now..

> 
> 
> 
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
