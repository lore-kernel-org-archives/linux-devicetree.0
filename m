From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 2/2] move imx-hdmi to bridge/dw-hdmi
Date: Wed, 05 Nov 2014 09:55:14 +0800
Message-ID: <54598382.7040407@rock-chips.com>
References: <1415108398-34376-1-git-send-email-andy.yan@rock-chips.com> <5458D9B9.5030606@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5458D9B9.5030606-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Josh Boyer <jwboyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi ZubairLK:
On 2014=E5=B9=B411=E6=9C=8804=E6=97=A5 21:50, Zubair Lutfullah Kakakhel=
 wrote:
> Hi,
>
> On 04/11/14 13:39, Andy Yan wrote:
>> From: Andy yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> the original imx hdmi driver is under staging/imx-drm,
>> which depends on imx-drm, so move the imx hdmi drvier out
>> to drm/bridge and rename imx-hdmi to dw-hdmi
>>
>> Change-Id: I5f417372f256aa26cd00a3cd0160741680afd39d
>> ---
>>   drivers/gpu/drm/bridge/Kconfig        |    5 +
>>   drivers/gpu/drm/bridge/Makefile       |    1 +
>>   drivers/gpu/drm/bridge/dw_hdmi.c      | 1651 +++++++++++++++++++++=
++++++++++++
>>   drivers/gpu/drm/bridge/dw_hdmi.h      | 1032 +++++++++++++++++++++
>>   drivers/staging/imx-drm/Kconfig       |    1 +
>>   drivers/staging/imx-drm/Makefile      |    2 +-
>>   drivers/staging/imx-drm/dw_hdmi-imx.c |   66 +-
>>   drivers/staging/imx-drm/imx-hdmi.c    | 1651 ---------------------=
------------
>>   drivers/staging/imx-drm/imx-hdmi.h    | 1032 ---------------------
>>   include/drm/bridge/dw_hdmi.h          |   26 +-
>>   10 files changed, 2737 insertions(+), 2730 deletions(-)
>>   create mode 100644 drivers/gpu/drm/bridge/dw_hdmi.c
>>   create mode 100644 drivers/gpu/drm/bridge/dw_hdmi.h
>>   delete mode 100644 drivers/staging/imx-drm/imx-hdmi.c
>>   delete mode 100644 drivers/staging/imx-drm/imx-hdmi.h
>>
>
> Could you try generating this patch with the -M option?
>
> git format-patch should then understand its a rename.
> Then it should generate a smaller patch that is possible to review ea=
sily.
>
> Thanks
> ZubairLK
>
>
>
ok, I will do it .
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
