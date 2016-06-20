From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v6 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Mon, 20 Jun 2016 11:32:35 +0800
Message-ID: <3b65b363-72a8-7985-7da1-9045583c90b8@rock-chips.com>
References: <1466129353-48063-1-git-send-email-frank.wang@rock-chips.com>
 <1466129353-48063-3-git-send-email-frank.wang@rock-chips.com>
 <576383C6.3050005@roeck-us.net>
 <98bc69af-c597-d1ee-e83d-c7b5918e9ef4@rock-chips.com>
 <5763F92D.80102@roeck-us.net>
 <ab59a324-d5e1-730a-28a7-01f8af664eb7@rock-chips.com>
 <CABXOdTd0baqMt7LqsmVk1S8VNpzEhQ7kBeKiqTaR4+Ov01NwDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABXOdTd0baqMt7LqsmVk1S8VNpzEhQ7kBeKiqTaR4+Ov01NwDA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko & Guenter,

On 2016/6/20 11:00, Guenter Roeck wrote:
> On Sun, Jun 19, 2016 at 6:27 PM, Frank Wang <frank.wang-TNX95d0MmH5qZ5pVbMyqKg@public.gmane.org=
m> wrote:
>> Hi Guenter,
>>
>>
>> On 2016/6/17 21:20, Guenter Roeck wrote:
>>> Hi Frank,
>>>
>>> On 06/16/2016 11:43 PM, Frank Wang wrote:
>>>> Hi Guenter,
>>>>
>>>> On 2016/6/17 12:59, Guenter Roeck wrote:
>>>>> On 06/16/2016 07:09 PM, Frank Wang wrote:
>>>>>> The newer SoCs (rk3366, rk3399) take a different usb-phy IP bloc=
k
>>>>>> than rk3288 and before, and most of phy-related registers are al=
so
>>>>>> different from the past, so a new phy driver is required necessa=
rily.
>>>>>>
>>>>>> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>>>> Suggested-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>>>>> Suggested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>>>> Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>>>>>> Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>>>>>> ---
>>>>>
>>>>> [ ... ]
>>>>>
>>>>>> +
>>>>>> +static int rockchip_usb2phy_resume(struct phy *phy)
>>>>>> +{
>>>>>> +    struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(phy=
);
>>>>>> +    struct rockchip_usb2phy *rphy =3D dev_get_drvdata(phy->dev.=
parent);
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    dev_dbg(&rport->phy->dev, "port resume\n");
>>>>>> +
>>>>>> +    ret =3D clk_prepare_enable(rphy->clk480m);
>>>>>> +    if (ret)
>>>>>> +        return ret;
>>>>>> +
>>>>> If suspend can be called multiple times, resume can be called
>>>>> multiple times as well. Doesn't this cause a clock imbalance
>>>>> if you call clk_prepare_enable() multiple times on resume,
>>>>> but clk_disable_unprepare() only once on suspend ?
>>>>>
>>>> Well, what you said is reasonable, How does something like below?
>>>>
>>>> @@ -307,6 +307,9 @@ static int rockchip_usb2phy_resume(struct phy =
*phy)
>>>>
>>>>           dev_dbg(&rport->phy->dev, "port resume\n");
>>>>
>>>> +       if (!rport->suspended)
>>>> +               return 0;
>>>> +
>>>>           ret =3D clk_prepare_enable(rphy->clk480m);
>>>>           if (ret)
>>>>                   return ret;
>>>> @@ -327,12 +330,16 @@ static int rockchip_usb2phy_suspend(struct p=
hy
>>>> *phy)
>>>>
>>>>           dev_dbg(&rport->phy->dev, "port suspend\n");
>>>>
>>>> +       if (rport->suspended)
>>>> +               return 0;
>>>> +
>>>>           ret =3D property_enable(rphy, &rport->port_cfg->phy_sus,=
 true);
>>>>           if (ret)
>>>>                   return ret;
>>>>
>>>>           rport->suspended =3D true;
>>>>           clk_disable_unprepare(rphy->clk480m);
>>>> +
>>>>           return 0;
>>>>    }
>>>>
>>>> @@ -485,6 +492,7 @@ static int rockchip_usb2phy_host_port_init(str=
uct
>>>> rockchip_usb2phy *rphy,
>>>>
>>>>           rport->port_id =3D USB2PHY_PORT_HOST;
>>>>           rport->port_cfg =3D &rphy->phy_cfg->port_cfgs[USB2PHY_PO=
RT_HOST];
>>>> +       rport->suspended =3D true;
>>>>
>>> Why does it start in suspended mode ? That seems odd.
>>>
>> This is an initialization. Using above design which make 'suspended'=
 as a
>> condition both in *_usb2phy_resume and *_usb2phy_suspend, I believe =
if it is
>> not initialized as suspended mode, the first resume process will be =
skipped.
> I had to re-read the entire patch.
>
> Turns out my problem was one of terminology. Using "suspend" and
> "resume" to me suggested the common use of suspend and resume
> functions. That is not the case here. After mentally replacing
> "suspend" with "power_off" and "resume" with "power_on", you are
> right, no problem exists. Sorry for the noise.
>
> Maybe it would be useful to replace "resume" with "power_on" and
> "suspend" with "power_off" in the function and variable names to
> reduce confusion and misunderstandings.
>
> Thanks,
> Guenter

Well, it does have a bits confusion, however, the phy-port always just=20
goes to suspend and resume mode (Not power off and power on) in a fact.=
=20
So must it be renamed?

@Heiko St=C3=BCbner. Hey Heiko, what is your unique perceptions? ;-)


BR.
=46rank

>
>> Theoretically, the phy-port in suspended mode make sense when it is =
at start
>> time, then the upper layer controller will invoke phy_power_on (See
>> phy-core.c), and it further call back *_usb2phy_resume to make phy-p=
ort work
>> properly.
>>
>> So could you tell me what make you feeling odd or would you like to =
give
>> another appropriate way please? :-)
>>
>> BR.
>> Frank
>>
>>
>>>>           mutex_init(&rport->mutex);
>>>>           INIT_DELAYED_WORK(&rport->sm_work, rockchip_usb2phy_sm_w=
ork);
>>>>
>>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
