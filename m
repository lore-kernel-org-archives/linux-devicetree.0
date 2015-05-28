From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/6] arm64,hi6220: Enable Hisilicon Hi6220 SoC
Date: Thu, 28 May 2015 09:48:16 -0700
Message-ID: <7hy4k8k5rj.fsf@deeprootsystems.com>
References: <1431007225-8513-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431007225-8513-1-git-send-email-bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
	(Bintian Wang's message of "Thu, 7 May 2015 22:00:19 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.c
List-Id: devicetree@vger.kernel.org

Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> writes:

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

Tested-by: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

I've now tested this version on top of v4.1-rc5 using the mainline
u-boot port[1], and confirm that all 8 cores are booting.

No UEFI required... yay!

Kevin

[1] http://lists.denx.de/pipermail/u-boot/2015-May/214006.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
