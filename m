From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 2/2] rtc: omap: add rtc wakeup support to alarm events
Date: Fri, 31 May 2013 12:20:39 +0530
Message-ID: <CA+V-a8tpPV35Z22YCNKOvCP36+v1sF8+9Fiy_Wrk4T-iCVv4nw@mail.gmail.com>
References: <1369982005-8572-1-git-send-email-gururaja.hebbar@ti.com> <1369982005-8572-3-git-send-email-gururaja.hebbar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1369982005-8572-3-git-send-email-gururaja.hebbar@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Hebbar Gururaja <gururaja.hebbar@ti.com>
Cc: akpm@linux-foundation.org, a.zummo@towertech.it, davinci-linux-open-source@linux.davincidsp.com, linux@arm.linux.org.uk, rtc-linux@googlegroups.com, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, zonque@gmail.com, rob@landley.net, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Gururaja,

Thanks for the patch.

On Fri, May 31, 2013 at 12:03 PM, Hebbar Gururaja
<gururaja.hebbar@ti.com> wrote:
> On some platforms (like AM33xx), a special register (RTC_IRQWAKEEN)
[snip]
>  - ti,wakeup_capable: Inform the rtc driver that this module is wake-up
>    capable so that rtcwake and suspend tests can work.
> +- ti,has_irq_wake_enb: Inform rtc driver that this module has a a
same comment applies here as well.
s/has a a/ has a

> +  special register to enable Wakeup feature for Alarm events.
>
>  Example:
>
> diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
> index 000a02f..5e9c0dd 100644
> --- a/drivers/rtc/rtc-omap.c
> +++ b/drivers/rtc/rtc-omap.c
> @@ -72,6 +72,8 @@
>  #define OMAP_RTC_KICK0_REG             0x6c
>  #define OMAP_RTC_KICK1_REG             0x70
>
> +#define OMAP_RTC_IRQWAKEEN             0x7C
> +
why not have the hex values in smaller case as done in the rest of the file ?

Regards,
--Prabhakar Lad
