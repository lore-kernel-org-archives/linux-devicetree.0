From: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/5] arm64,hi6220: Enable Hisilicon Hi6220 SoC
Date: Tue, 5 May 2015 21:31:18 +0800
Message-ID: <CAD6h2NQ2OCJmQhBG+-zT-dL=YJtpAk5T_1_m8C8SKm0RCg_D0Q@mail.gmail.com>
References: <1430800212-6970-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430800212-6970-1-git-send-email-bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Haifeng Yan <yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Wei Yan <sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Russell
List-Id: devicetree@vger.kernel.org

On 5 May 2015 at 12:30, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
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
> Changes v3:
> * Verified the CPU hotplug based on the new released firmware
> * Redefined the compatible strings of four system controllers in dts
> * Setting COMMON_CLK_HI6220 to a bool symbol
> * Keep CONFGI_ARCH_HISI sorted alphabetically
>
> Changes v2:
> * Split the DT bindings documents into earlier patches
> * Change SMP enable method from spin-table to PSCI in device tree
> * Remove "clock-frequency" from armv8-timer device node in device tree
> * Add more description about Hisilicon designed system controllers
>   in DT bindings document
> * Enable high speed clock on UART1 mux
> * Other changes based on the discussion in the mailing list:
>   https://lkml.org/lkml/2015/2/5/147
>
> Bintian Wang (5):
>   arm64: Enable Hisilicon ARMv8 SoC family in Kconfig and defconfig
>   arm64: hi6220: Document devicetree bindings for Hisilicon hi6220 SoC
>   clk: hi6220: Document devicetree bindings for hi6220 clock
>   clk: hi6220: Clock driver support for Hisilicon hi6220 SoC
>   arm64: dts: Add dts files for Hisilicon Hi6220 SoC
>
>

Acked-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
