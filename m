From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v6 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Fri, 17 Jun 2016 06:20:45 -0700
Message-ID: <5763F92D.80102@roeck-us.net>
References: <1466129353-48063-1-git-send-email-frank.wang@rock-chips.com>
 <1466129353-48063-3-git-send-email-frank.wang@rock-chips.com>
 <576383C6.3050005@roeck-us.net>
 <98bc69af-c597-d1ee-e83d-c7b5918e9ef4@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <98bc69af-c597-d1ee-e83d-c7b5918e9ef4@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>, heiko@sntech.de
Cc: dianders@chromium.org, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Frank,

On 06/16/2016 11:43 PM, Frank Wang wrote:
> Hi Guenter,
>
> On 2016/6/17 12:59, Guenter Roeck wrote:
>> On 06/16/2016 07:09 PM, Frank Wang wrote:
>>> The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
>>> than rk3288 and before, and most of phy-related registers are also
>>> different from the past, so a new phy driver is required necessarily.
>>>
>>> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
>>> Suggested-by: Guenter Roeck <linux@roeck-us.net>
>>> Suggested-by: Doug Anderson <dianders@chromium.org>
>>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>>> ---
>>
>> [ ... ]
>>
>>> +
>>> +static int rockchip_usb2phy_resume(struct phy *phy)
>>> +{
>>> +    struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
>>> +    struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
>>> +    int ret;
>>> +
>>> +    dev_dbg(&rport->phy->dev, "port resume\n");
>>> +
>>> +    ret = clk_prepare_enable(rphy->clk480m);
>>> +    if (ret)
>>> +        return ret;
>>> +
>> If suspend can be called multiple times, resume can be called
>> multiple times as well. Doesn't this cause a clock imbalance
>> if you call clk_prepare_enable() multiple times on resume,
>> but clk_disable_unprepare() only once on suspend ?
>>
>
> Well, what you said is reasonable, How does something like below?
>
> @@ -307,6 +307,9 @@ static int rockchip_usb2phy_resume(struct phy *phy)
>
>          dev_dbg(&rport->phy->dev, "port resume\n");
>
> +       if (!rport->suspended)
> +               return 0;
> +
>          ret = clk_prepare_enable(rphy->clk480m);
>          if (ret)
>                  return ret;
> @@ -327,12 +330,16 @@ static int rockchip_usb2phy_suspend(struct phy *phy)
>
>          dev_dbg(&rport->phy->dev, "port suspend\n");
>
> +       if (rport->suspended)
> +               return 0;
> +
>          ret = property_enable(rphy, &rport->port_cfg->phy_sus, true);
>          if (ret)
>                  return ret;
>
>          rport->suspended = true;
>          clk_disable_unprepare(rphy->clk480m);
> +
>          return 0;
>   }
>
> @@ -485,6 +492,7 @@ static int rockchip_usb2phy_host_port_init(struct rockchip_usb2phy *rphy,
>
>          rport->port_id = USB2PHY_PORT_HOST;
>          rport->port_cfg = &rphy->phy_cfg->port_cfgs[USB2PHY_PORT_HOST];
> +       rport->suspended = true;
>

Why does it start in suspended mode ? That seems odd.

Guenter

>          mutex_init(&rport->mutex);
>          INIT_DELAYED_WORK(&rport->sm_work, rockchip_usb2phy_sm_work);
>
