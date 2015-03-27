From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 0/3] arm: msm: Use timer DT node for qcom watchdog config
Date: Thu, 26 Mar 2015 22:55:23 -0700
Message-ID: <20150327055523.GC5625@codeaurora.org>
References: <1424485176-8348-1-git-send-email-mathieu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424485176-8348-1-git-send-email-mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/20, Mathieu Olivari wrote:
> This change is done as a follow-up to the following thread:
> https://lkml.org/lkml/2014/10/1/436
> 
> qcom-wdt is currently assuming the presence of a dedicated node in DT
> to gets its configuration. However, on msm architecture, the watchdog is
> usually part of the timer block. So this patch-set is changing the driver
> and slightly enhancing the timer DT bindings to provide the relevant clocks
> and interrupts.
> 
> Mathieu Olivari (3):
>   watchdog: qcom: use timer devicetree binding
>   ARM: qcom: add description of KPSS WDT for IPQ8064
>   ARM: msm: add watchdog entries to DT timer binding doc
> 
>  Documentation/devicetree/bindings/arm/msm/timer.txt | 16 +++++++++++++---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi                 | 14 +++++++++++++-
>  drivers/watchdog/qcom-wdt.c                         | 21 +++++++++++++++------
>  3 files changed, 41 insertions(+), 10 deletions(-)
> 

Can this patchset be applied? Or should we resend with collected
acks?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
