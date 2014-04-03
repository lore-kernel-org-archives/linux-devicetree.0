From: Dann Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH v2 0/3] rtc: Add APM X-Gene SoC RTC driver
Date: Wed, 2 Apr 2014 19:16:29 -0600
Message-ID: <CALdTtnvxGjF6tMWEOuRqSRsM+2av6i5JeEfaHMRbj28OuTNq=g@mail.gmail.com>
References: <1396287370-1011-1-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396287370-1011-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Tested-by: dann frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

On Mon, Mar 31, 2014 at 11:36 AM, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org> wrote:
> This patch adds support for the APM X-Gene SoC RTC driver.
>
> v2
> * Change function xgene_rtc_read_time to return rtc_valid_tm(tm) instead 0
>
> v1
> * Initial version
>
> Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
> Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
> ---
> Loc Ho (3):
>   Documentation: Add documentation for the APM X-Gene SoC RTC DTS
>     binding
>   rtc: Add APM X-Gene SoC RTC driver
>   arm64: Add APM X-Gene SoC RTC DTS entry
>
>  .../devicetree/bindings/rtc/xgene-rtc.txt          |   28 ++
>  arch/arm64/boot/dts/apm-storm.dtsi                 |   21 ++
>  drivers/rtc/Kconfig                                |    9 +
>  drivers/rtc/Makefile                               |    1 +
>  drivers/rtc/rtc-xgene.c                            |  278 ++++++++++++++++++++
>  5 files changed, 337 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/xgene-rtc.txt
>  create mode 100644 drivers/rtc/rtc-xgene.c
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
