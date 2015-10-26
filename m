From: Ming Lei <ming.lei-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH v6 3/4] arm64/arm, numa, dt: adding numa dt binding
 implementation for arm64 platforms
Date: Mon, 26 Oct 2015 09:44:31 +0800
Message-ID: <CACVXFVMiZs_g3qw99-PhxLiX5oLe8_z5cOAfJZ_4-09jN2koCQ@mail.gmail.com>
References: <1445337931-11344-1-git-send-email-gkulkarni@caviumnetworks.com>
	<1445337931-11344-4-git-send-email-gkulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445337931-11344-4-git-send-email-gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "marc.zyngier-5wv7dgnIgG8@public.gmane.org" <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Prasun Kapoor <Prasun.Kapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 20, 2015 at 6:45 PM, Ganapatrao Kulkarni
<gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> Adding numa dt binding support for arm64 based platforms.
> dt node parsing for numa topology is done using device property
> proximity and device node distance-map.
>
> Reviewed-by: Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm64/Kconfig            |  10 ++
>  arch/arm64/include/asm/numa.h |  10 ++
>  arch/arm64/kernel/Makefile    |   1 +
>  arch/arm64/kernel/of_numa.c   | 221 ++++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/kernel/smp.c       |   1 +
>  arch/arm64/mm/numa.c          |  10 +-
>  6 files changed, 252 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/kernel/of_numa.c
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 0f9cdc7..6cf8d20 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -426,6 +426,16 @@ config NUMA
>           local memory controller of the CPU and add some more
>           NUMA awareness to the kernel.
>
> +config OF_NUMA
> +       bool "Device Tree NUMA support"
> +       depends on NUMA
> +       depends on OF
> +       default y
> +       help
> +         Enable Device Tree NUMA support.
> +         This enables the numa mapping of cpu, memory, io and
> +         inter node distances using dt bindings.

Enabling the above config option can cause numa_init() warning in
numa-less arm64 system, please see the following report:

          https://bugs.launchpad.net/bugs/1509221

Thanks,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
