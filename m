From: Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH RFC v3 11/18] drm/bridge: Add Synopsys DesignWare MIPI
 DSI host controller driver
Date: Tue, 23 Dec 2014 17:03:41 +0800
Message-ID: <54992FED.5080908@freescale.com>
References: <1419306399-9387-1-git-send-email-Ying.Liu@freescale.com>
 <1419306399-9387-12-git-send-email-Ying.Liu@freescale.com>
 <1770602566.921194.1419323596151.JavaMail.open-xchange@oxbaltgw08.schlund.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1770602566.921194.1419323596151.JavaMail.open-xchange-h4m1HHXQYNHc2Cnrm9MUdsgmgJlYmuWJ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, andyshrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On 12/23/2014 04:33 PM, Stefan Wahren wrote:
> Hi Liu,
>
>> Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org> hat am 23. Dezember 2014 um 04:46
>> geschrieben:
>>
>>
>> This patch adds Synopsys DesignWare MIPI DSI host controller driver support.
>> Currently, the driver supports the burst with sync pulses mode only.
>>
>> Signed-off-by: Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>> v2->v3:
>> * Newly introduced in v3 to address Andy Yan's comment. This is based on
>> the i.MX MIPI DSI driver in v2. To make the Synopsys DesignWare MIPI DSI
>> host controller driver less platform-dependant, this patch places it at
>> the drm/bridge directory as a DRM bridge driver.
>>
>> .../devicetree/bindings/drm/bridge/dw_mipi_dsi.txt | 72 ++
>
> please take care of [1] and send the Documentation part as a separate patch.
> This should also apply to all the other patches from your series.

All right, I'll do that.

Thanks,
Liu Ying

>
> Thanks
>
> Stefan
>
> [1] -
> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/submitting-patches.txt
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
