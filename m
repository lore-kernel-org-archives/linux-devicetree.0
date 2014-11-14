From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v10 11/11] drm: bridge/dw_hdmi: add rockchip rk3288 support
Date: Fri, 14 Nov 2014 19:21:36 +0800
Message-ID: <5465E5C0.7050207@rock-chips.com>
References: <1415934583-16290-1-git-send-email-andy.yan@rock-chips.com> <1415935884-17130-1-git-send-email-andy.yan@rock-chips.com> <5465D816.3020708@imgtec.com> <5465DB4F.7090402@rock-chips.com> <5465DF34.303@imgtec.com> <5465E3F1.4060407@rock-chips.com> <5465E47E.7090602@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5465E47E.7090602-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Josh Boyer <jwboyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 2014=E5=B9=B411=E6=9C=8814=E6=97=A5 19:16, Zubair Lutfullah Kakakhel=
 wrote:
>
> On 14/11/14 11:13, Andy Yan wrote:
>> On 2014=E5=B9=B411=E6=9C=8814=E6=97=A5 18:53, Zubair Lutfullah Kakak=
hel wrote:
>>> On 14/11/14 10:37, Andy Yan wrote:
>>>> On 2014=E5=B9=B411=E6=9C=8814=E6=97=A5 18:23, Zubair Lutfullah Kak=
akhel wrote:
>>>>> Hi Andy
>>>>>
>>>>> On 14/11/14 03:31, Andy Yan wrote:
>>>>>> Rockchip RK3288 hdmi is compatible with dw_hdmi
>>>>>>
>>>>>> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> Changes in v10:
>>>>>> - add more display mode support mpll configuration for rk3288
>>>>>>
>>>>>> Changes in v9:
>>>>>> - move some phy configuration to platform driver
>>>>>>
>>>>>> Changes in v8: None
>>>>>> Changes in v7: None
>>>>>> Changes in v6: None
>>>>>> Changes in v5: None
>>>>>> Changes in v4: None
>>>>>> Changes in v3: None
>>>>>> Changes in v2: None
>>>>>>
>>>>>>     drivers/gpu/drm/bridge/dw_hdmi.c            |  10 +
>>>>>>     drivers/gpu/drm/bridge/dw_hdmi.h            |   3 +-
>>>>>>     drivers/gpu/drm/rockchip/Kconfig            |  10 +
>>>>>>     drivers/gpu/drm/rockchip/Makefile           |   2 +-
>>>>>>     drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 355 ++++++++++=
++++++++++++++++++
>>>>>>     include/drm/bridge/dw_hdmi.h                |   1 +
>>>>>>     6 files changed, 379 insertions(+), 2 deletions(-)
>>>>>>     create mode 100644 drivers/gpu/drm/rockchip/dw_hdmi-rockchip=
=2Ec
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/bridge/dw_hdmi.c b/drivers/gpu/drm/=
bridge/dw_hdmi.c
>>>>>> index a2876fe..1dd1f0b 100644
>>>>>> --- a/drivers/gpu/drm/bridge/dw_hdmi.c
>>>>>> +++ b/drivers/gpu/drm/bridge/dw_hdmi.c
>>>>>> @@ -715,6 +715,13 @@ static void dw_hdmi_phy_enable_tmds(struct =
dw_hdmi *hdmi, u8 enable)
>>>>>>                  HDMI_PHY_CONF0_ENTMDS_MASK);
>>>>>>     }
>>>>>>     +static void dw_hdmi_phy_enable_spare(struct dw_hdmi *hdmi, =
u8 enable)
>>>>>> +{
>>>>>> +    hdmi_mask_writeb(hdmi, enable, HDMI_PHY_CONF0,
>>>>>> +             HDMI_PHY_CONF0_SPARECTRL_OFFSET,
>>>>>> +             HDMI_PHY_CONF0_SPARECTRL_MASK);
>>>>>> +}
>>>>>> +
>>>>> What does enable spare do? Can other future SoCs use it?
>>>>>
>>>>> This looks like DW specific. And can be a separate commit that ad=
ds a feature to the dw hdmi driver.
>>>>     Actually I am not very clearly about this bit, but RK3288 HDMI=
 will not work without this bit enable.
>>>>     On imx6, the description about this bit is:Reserved. Spare pin=
 control.
>>>>     On rk3288, the description is: svsret/sparectrl
>>>>      Both are very simple.
>>> Sounds like the IP Core in the rk3288 is slightly upgraded.
>>> Separate this section in a different commit as it is generic DW stu=
ff.
>>>
>>> And add what you wrote above in the commit message.
>>    Only Separate function dw_hdmi_phy_enale_spare ? not include
>>    if (hdmi->dev_type =3D=3D rk3288_hdmi)
>>                 dw_hdmi_enable_phy_spare(hdmi, 1);
>>   ?
> Yes. Separate dw_hdmi_phy_enable_spare and its associated defines
>   HDMI_PHY_CONF0_SPARECTRL_OFFSET
>   HDMI_PHY_CONF0_SPARECTRL_MASK
>   in the header
> as one commit.
>
>
> The if (hdmi->dev_type =3D=3D rk3288_hdmi) code is part of the add rk=
3288 support.
>
> ZubairLK
   Many thanks :-)
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
