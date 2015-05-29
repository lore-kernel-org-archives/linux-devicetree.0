From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 0/7] arm64,hi6220: Enable Hisilicon Hi6220 SoC
Date: Fri, 29 May 2015 16:00:41 -0700
Message-ID: <7hwpzrdm5i.fsf@deeprootsystems.com>
References: <1432865319-20413-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432865319-20413-1-git-send-email-bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
	(Bintian Wang's message of "Fri, 29 May 2015 10:08:32 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.c
List-Id: devicetree@vger.kernel.org

Hi Bintian,

Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> writes:

> From: Bintian Wang <wangbintian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Hi6220 is one mobile solution of Hisilicon, this patchset contains
> initial support for Hi6220 SoC and HiKey development board, which
> supports octal ARM Cortex A53 cores. Initial support is minimal and
> includes just the arch configuration, clock driver, device tree
> configuration.
>
> PSCI is enabled in device tree and there is no problem to boot all the
> octal cores, and the CPU hotplug is also working now, you can download
> and compile the latest firmware based on the following link to run this
> patch set:
> https://github.com/96boards/documentation/wiki/UEFI
>
> Changes v6~v8:
> This three versions only modified the clock drivers based on the
> Stephen's review advices.
> * clk-hi6220.c:
>   ** Split the clock header file from clock driver
>   ** Delete setting the parents clock of UART1 to HI6220_150M in clock
>      driver, we can do that using assigned-clock in dts when enable
>      UART1 in the future.
> * clkdivider-hi6220.c: 
>   ** Reuse some functions exported by clk-divider.c
>   ** Remove "pr_err" and CLK_IS_BASIC flag
>   ** Fix some programing style problems
> * hisilicon/clk.h: remove the "__init" markings on some funcition
>   prototypes.

It's not clear what kernel this series is meant to apply to.  It doesn't
apply cleanly to v4.1-rc2 (the version stated for v5) or the current -rc
(v4.1-rc5) it also doesn't apply cleanly to linus/master or linux-next.

If the series doesn't apply to Linus tree, please state clearly in the
changelog what tree it should apply to as well as any dependncies.

Also, this version is missing patch 1 from the v6 series, which adds the
Kconfig/defconfig changes. Without that patch, nothing in this series is
even compiled (clk driver or DTS files.)

So my recommendation, since the clock driver is very close to being
merged:

Please create a v9 series with *only* the patches that are not already
queued up on the clk tree[1].  That should be patches 1-3 and 7 of this
series, plus patch 1 from v6.

That series should apply cleanly to v4.1-rc1 (or a newer -rc if there
are dependencies.)  In the changelog to that series, state the version
that it applies to, and also state that it depends on the clk-next
branch where the clock maintainers have queued up the driver[1].

Then all that's left is to collect an ack from a DT maintainer, and
these can be queued up via the arm-soc tree.

FWIW, I've boot tested patches 1-3 and 7 of this series, plus patch 1
from v6 combined with the clk-next-hi6220 branch[1] on my board (which
uses ATF + mainline u-boot) and all 8 A53 cores are coming up, so feel
free to add:

Tested-by: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

to your v9 series.

Thanks,

Kevin

[1] git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next-hi6220
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
