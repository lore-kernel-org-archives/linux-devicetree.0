From: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RFC PATCH 3/6] phy: rockcip-pcie: reconstruct driver to support
 per-lane PHYs
Date: Fri, 14 Jul 2017 15:19:27 +0800
Message-ID: <5968707F.4060700@rock-chips.com>
References: <1500004101-240296-1-git-send-email-shawn.lin@rock-chips.com> <1500004366-241633-1-git-send-email-shawn.lin@rock-chips.com> <1500004366-241633-2-git-send-email-shawn.lin@rock-chips.com> <20170714051030.GA59140@google.com> <a0b188ea-71e2-8c8a-999d-754a35891ab9@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a0b188ea-71e2-8c8a-999d-754a35891ab9-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On 07/14/2017 02:33 PM, Shawn Lin wrote:
>>>
>>> +static struct phy *rockchip_pcie_phy_of_xlate(struct device *dev,
>>> +                          struct of_phandle_args *args)
>>> +{
>>> +    struct rockchip_pcie_phy *rk_phy = dev_get_drvdata(dev);
>>> +
>>> +    if (!rk_phy)
>>> +        return ERR_PTR(-ENODEV);
>>
>> Shouldn't you just check args->args_count to determine legacy vs. new
>> style?
>>
>
> args_count is 1 for legacy mode but could also means you just add one
> phy with the new per-lane mode?

The new per-lane mode should follow by a lane number, so their 
args_count should be 1, while in the legacy mode it should be 0.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
