From: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH 0/3] arm64: dts: hisi: hip06 SAS device tree fixes
Date: Tue, 15 Nov 2016 16:12:35 +0000
Message-ID: <582B33F3.2040700@hisilicon.com>
References: <1478537065-169286-1-git-send-email-john.garry@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478537065-169286-1-git-send-email-john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Garry <john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi John,

On 2016/11/7 16:44, John Garry wrote:
> This patchset resolves some hip06 SAS device tree issues.
>

Series applied to the hisilicon soc tree.
Thanks!

Best Regards,
Wei

> John Garry (3):
>   arm64: dts: hisi: fix hip06 sas am-max-trans quirk
>   arm64: dts: hisi: disable sas0 and sas2 for d03
>   arm64: dts: hisi: add refclk node to hip06 dts files for SAS
> 
>  arch/arm64/boot/dts/hisilicon/hip06-d03.dts |  8 --------
>  arch/arm64/boot/dts/hisilicon/hip06.dtsi    | 11 ++++++++++-
>  2 files changed, 10 insertions(+), 9 deletions(-)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
