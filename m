From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 4/5] phy: add Marvell HSIC 28nm PHY
Date: Tue, 26 May 2015 11:36:54 +0530
Message-ID: <55640D7E.8020501@ti.com>
References: <1431557340-5421-1-git-send-email-robh@kernel.org> <1431557340-5421-5-git-send-email-robh@kernel.org> <555DD384.2090506@ti.com> <555DD4C2.80406@ti.com> <CAL_JsqJxkOXNJ1wkoKAdFpGeaKcjCN2k0vBFWsY=wcuMEDVUOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJxkOXNJ1wkoKAdFpGeaKcjCN2k0vBFWsY=wcuMEDVUOg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Saturday 23 May 2015 01:24 AM, Rob Herring wrote:
> On Thu, May 21, 2015 at 7:51 AM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
>> On Thursday 21 May 2015 06:15 PM, Kishon Vijay Abraham I wrote:
>>>
>>> Hi,
>>>
>>> On Thursday 14 May 2015 04:18 AM, Rob Herring wrote:
>>>>
>>>> Add PHY driver for the Marvell HSIC 28nm PHY. This PHY is found in
>>>> PXA1928
>>>> SOC.
>
> [...]
>
>>>> +       writel(readl(base + PHY_28NM_HSIC_CTRL) &
>>>> ~PHY_28NM_HSIC_S2H_HSIC_EN,
>>>> +               base + PHY_28NM_HSIC_CTRL);
>>>> +
>>>> +       clk_disable_unprepare(mv_phy->clk);
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static const struct phy_ops hsic_ops = {
>>>> +       .init           = mv_hsic_phy_init,
>>>> +       .power_on       = mv_hsic_phy_power_on,
>>>> +       .power_off      = mv_hsic_phy_power_off,
>>>
>>>
>>> exit callback is missing? Shouldn't we turn off the PLLs in exit callback?
>
> I really don't understand the division of the ops functions. It seems
> backwards to me. Don't you need to power on the phy before you can
> initialize it? Or init is supposed to be s/w init of some kind.

Generally the order is init and then power on. During init the driver can 
perform the various setting for initializing the PHY which includes PLL 
programming, calibration etc.. And then power on which actually starts the PHY 
so that PHY can now transfer and receive data.
> AFAICT, all the drivers just call init and power_on back to back.
>
>>
>> Also add the .owner member since this driver can be used as module.
>
> Strange. Generally an ops struct just has ops.

phy-core has a call to try_module_get with this .owner so that the module is 
not removed after phy_get. Maybe we can make phy-core to handle it in some 
other way. Need to check.

Thanks
Kishon
