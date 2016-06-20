From: Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Sun, 19 Jun 2016 20:00:41 -0700
Message-ID: <CABXOdTd0baqMt7LqsmVk1S8VNpzEhQ7kBeKiqTaR4+Ov01NwDA@mail.gmail.com>
References: <1466129353-48063-1-git-send-email-frank.wang@rock-chips.com>
 <1466129353-48063-3-git-send-email-frank.wang@rock-chips.com>
 <576383C6.3050005@roeck-us.net>
 <98bc69af-c597-d1ee-e83d-c7b5918e9ef4@rock-chips.com>
 <5763F92D.80102@roeck-us.net>
 <ab59a324-d5e1-730a-28a7-01f8af664eb7@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <ab59a324-d5e1-730a-28a7-01f8af664eb7-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 19, 2016 at 6:27 PM, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Hi Guenter,
>
>
> On 2016/6/17 21:20, Guenter Roeck wrote:
>>
>> Hi Frank,
>>
>> On 06/16/2016 11:43 PM, Frank Wang wrote:
>>>
>>> Hi Guenter,
>>>
>>> On 2016/6/17 12:59, Guenter Roeck wrote:
>>>>
>>>> On 06/16/2016 07:09 PM, Frank Wang wrote:
>>>>>
>>>>> The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
>>>>> than rk3288 and before, and most of phy-related registers are also
>>>>> different from the past, so a new phy driver is required necessarily.
>>>>>
>>>>> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>>> Suggested-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>>>> Suggested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>>> Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>>>>> Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>>>>> ---
>>>>
>>>>
>>>> [ ... ]
>>>>
>>>>> +
>>>>> +static int rockchip_usb2phy_resume(struct phy *phy)
>>>>> +{
>>>>> +    struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
>>>>> +    struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
>>>>> +    int ret;
>>>>> +
>>>>> +    dev_dbg(&rport->phy->dev, "port resume\n");
>>>>> +
>>>>> +    ret = clk_prepare_enable(rphy->clk480m);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>
>>>> If suspend can be called multiple times, resume can be called
>>>> multiple times as well. Doesn't this cause a clock imbalance
>>>> if you call clk_prepare_enable() multiple times on resume,
>>>> but clk_disable_unprepare() only once on suspend ?
>>>>
>>>
>>> Well, what you said is reasonable, How does something like below?
>>>
>>> @@ -307,6 +307,9 @@ static int rockchip_usb2phy_resume(struct phy *phy)
>>>
>>>          dev_dbg(&rport->phy->dev, "port resume\n");
>>>
>>> +       if (!rport->suspended)
>>> +               return 0;
>>> +
>>>          ret = clk_prepare_enable(rphy->clk480m);
>>>          if (ret)
>>>                  return ret;
>>> @@ -327,12 +330,16 @@ static int rockchip_usb2phy_suspend(struct phy
>>> *phy)
>>>
>>>          dev_dbg(&rport->phy->dev, "port suspend\n");
>>>
>>> +       if (rport->suspended)
>>> +               return 0;
>>> +
>>>          ret = property_enable(rphy, &rport->port_cfg->phy_sus, true);
>>>          if (ret)
>>>                  return ret;
>>>
>>>          rport->suspended = true;
>>>          clk_disable_unprepare(rphy->clk480m);
>>> +
>>>          return 0;
>>>   }
>>>
>>> @@ -485,6 +492,7 @@ static int rockchip_usb2phy_host_port_init(struct
>>> rockchip_usb2phy *rphy,
>>>
>>>          rport->port_id = USB2PHY_PORT_HOST;
>>>          rport->port_cfg = &rphy->phy_cfg->port_cfgs[USB2PHY_PORT_HOST];
>>> +       rport->suspended = true;
>>>
>>
>> Why does it start in suspended mode ? That seems odd.
>>
>
> This is an initialization. Using above design which make 'suspended' as a
> condition both in *_usb2phy_resume and *_usb2phy_suspend, I believe if it is
> not initialized as suspended mode, the first resume process will be skipped.

I had to re-read the entire patch.

Turns out my problem was one of terminology. Using "suspend" and
"resume" to me suggested the common use of suspend and resume
functions. That is not the case here. After mentally replacing
"suspend" with "power_off" and "resume" with "power_on", you are
right, no problem exists. Sorry for the noise.

Maybe it would be useful to replace "resume" with "power_on" and
"suspend" with "power_off" in the function and variable names to
reduce confusion and misunderstandings.

Thanks,
Guenter

> Theoretically, the phy-port in suspended mode make sense when it is at start
> time, then the upper layer controller will invoke phy_power_on (See
> phy-core.c), and it further call back *_usb2phy_resume to make phy-port work
> properly.
>
> So could you tell me what make you feeling odd or would you like to give
> another appropriate way please? :-)
>
> BR.
> Frank
>
>
>>
>>>          mutex_init(&rport->mutex);
>>>          INIT_DELAYED_WORK(&rport->sm_work, rockchip_usb2phy_sm_work);
>>>
>>
>
>
