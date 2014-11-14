From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v10 05/11] drm: bridge/dw_hdmi:split some phy configuration
 to platform driver
Date: Fri, 14 Nov 2014 19:08:43 +0800
Message-ID: <5465E2BB.1070507@rock-chips.com>
References: <1415934583-16290-1-git-send-email-andy.yan@rock-chips.com> <1415935631-16826-1-git-send-email-andy.yan@rock-chips.com> <5465D73C.9030507@imgtec.com> <5465DF0C.50301@rock-chips.com> <5465DFB2.8060601@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5465DFB2.8060601-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Josh Boyer <jwboyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 2014=E5=B9=B411=E6=9C=8814=E6=97=A5 18:55, Zubair Lutfullah Kakakhel=
 wrote:
>
> On 14/11/14 10:53, Andy Yan wrote:
>> Hi ZubairLK:
>>     Thanks for your review.
>> On 2014=E5=B9=B411=E6=9C=8814=E6=97=A5 18:19, Zubair Lutfullah Kakak=
hel wrote:
>>> Hi Andy,
>>>
>>> Nice work on this patch series. Its getting better and better :).
>>>
>>> On 14/11/14 03:27, Andy Yan wrote:
>>>> hdmi phy clock symbol and transmission termination value
>>>> can adjust platform specific to get the best SI
>>>                          ^Is this signal integrity?
>>     yes , SI  is signal integrity, such as eye diagram measurement
>>> Are these two disjoint features in separate patches?
>>>
>>>> also add mode_valid interface for some platform may not support
>>>> all the display mode
>>> Sounds like another separate patch to me. :)
>>     they can seperate
>>> Also, This series is becoming quite large. With major changes and f=
ixes mixed together.
>>>
>>> Patch 3 splits imx-drm.
>>> Patch 4 moves dw-drm out of imx-drm folder.
>>> Patch 7 adds binding
>>> Patch 9 converts to drm bridge.
>>>
>>> Can these be placed together easily?
>>> And in the start. i.e. patch 1, 2, 3, 4,
>>>
>>> Then all fixes etc can come afterwards?
>>>
>>> It helps when checking histories later as to how a driver was made =
and how fixes happened.
>>>
>>> Especially when file moves happen..
>>    Do you mean we can rearrange the patch series?
>>    put patch 3, 4 ,7, 9 together  one bye one
>>    than followed by the fixes patches  5 ,6, 8, 11 ?
> Yes. Rearrange so that the split imx-drm/imx-hdmi and conversion to d=
rm-bridge is at the start of the series.
> Then the rest are bug fixes and feature additions.
   Can I put patch#1(make checkpatch happy) and patch#2 (defer probe) a=
s=20
the first two patch.
   Daniel from Google chromium think it's better to put the two slightl=
y=20
changes in the front for easy review.
> Cheers,
> ZubairLK
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
