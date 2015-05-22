From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] phy: add Marvell HSIC 28nm PHY
Date: Fri, 22 May 2015 14:54:12 -0500
Message-ID: <CAL_JsqJxkOXNJ1wkoKAdFpGeaKcjCN2k0vBFWsY=wcuMEDVUOg@mail.gmail.com>
References: <1431557340-5421-1-git-send-email-robh@kernel.org>
 <1431557340-5421-5-git-send-email-robh@kernel.org> <555DD384.2090506@ti.com> <555DD4C2.80406@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555DD4C2.80406-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 7:51 AM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
> On Thursday 21 May 2015 06:15 PM, Kishon Vijay Abraham I wrote:
>>
>> Hi,
>>
>> On Thursday 14 May 2015 04:18 AM, Rob Herring wrote:
>>>
>>> Add PHY driver for the Marvell HSIC 28nm PHY. This PHY is found in
>>> PXA1928
>>> SOC.

[...]

>>> +       writel(readl(base + PHY_28NM_HSIC_CTRL) &
>>> ~PHY_28NM_HSIC_S2H_HSIC_EN,
>>> +               base + PHY_28NM_HSIC_CTRL);
>>> +
>>> +       clk_disable_unprepare(mv_phy->clk);
>>> +       return 0;
>>> +}
>>> +
>>> +static const struct phy_ops hsic_ops = {
>>> +       .init           = mv_hsic_phy_init,
>>> +       .power_on       = mv_hsic_phy_power_on,
>>> +       .power_off      = mv_hsic_phy_power_off,
>>
>>
>> exit callback is missing? Shouldn't we turn off the PLLs in exit callback?

I really don't understand the division of the ops functions. It seems
backwards to me. Don't you need to power on the phy before you can
initialize it? Or init is supposed to be s/w init of some kind.
AFAICT, all the drivers just call init and power_on back to back.

>
> Also add the .owner member since this driver can be used as module.

Strange. Generally an ops struct just has ops.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
