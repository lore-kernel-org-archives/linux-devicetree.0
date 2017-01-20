From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v9 0/4] arm64: arch_timer: Add workaround for
 hisilicon-161010101 erratum
Date: Fri, 20 Jan 2017 15:04:28 +0000
Message-ID: <20170120150428.GC22152@leverpostej>
References: <1484832916-7248-1-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484832916-7248-1-git-send-email-dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: marc.zyngier-5wv7dgnIgG8@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 09:35:12PM +0800, Ding Tianhong wrote:
> Ding Tianhong (4):
>   arm64: arch_timer: Add device tree binding for hisilicon-161010101
>     erratum
>   arm64: arch_timer: Introduce a generic erratum handing mechanism for
>     fsl-a008585
>   arm64: arch_timer: Work around Erratum Hisilicon-161010101
>   arm64: arch timer: Add timer erratum property for Hip05-d02 and
>     Hip06-d03
> 
>  Documentation/admin-guide/kernel-parameters.txt    |   9 --
>  Documentation/arm64/silicon-errata.txt             |  43 +++---
>  .../devicetree/bindings/arm/arch_timer.txt         |   6 +
>  arch/arm64/boot/dts/hisilicon/hip05.dtsi           |   1 +
>  arch/arm64/boot/dts/hisilicon/hip06.dtsi           |   1 +
>  arch/arm64/include/asm/arch_timer.h                |  38 ++----
>  drivers/clocksource/Kconfig                        |  18 +++
>  drivers/clocksource/arm_arch_timer.c               | 150 +++++++++++++++------
>  8 files changed, 171 insertions(+), 95 deletions(-)

I've picked these up (with a few local cleanups), given that some local
testing, and pushed the result to a branch [1] on my git repo.

There are likely to be clashes with the arm64 tree (e.g. for
silicon-errata.txt), and we're also likely to have more arch timer
updates shortly for the GTDT stuff, so I think the best bet is for both
arm64 and the clocksource tree to pull that branch for v4.11.

Alternatively, we could take this all through the arm64 tree, if the
clocksource maintainers are happy with that.

Thoughts?

Thanks,
Mark.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arch-timer/hisi-161010101
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
