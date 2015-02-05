From: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] arm64,hi6220: Enable Hisilicon Hi6220 SoC
Date: Thu, 5 Feb 2015 10:46:31 -0800
Message-ID: <CANMBJr685FzZzQ660Z1aNJX+Kzkw1OqM6RJAviARbL+5a=MJ2A@mail.gmail.com>
References: <1423128277-10297-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423128277-10297-1-git-send-email-bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuyiping@hisilicon.
List-Id: devicetree@vger.kernel.org

Hi Bintian,

On 5 February 2015 at 01:24, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
> Hello,
>
> Hi6220 is one mobile solution of Hisilicon, this patchset contains
> initial support for Hi6220 SoC and HiKey development board, which
> is based on ARM Cortex A53 architecture. Initial support is minimal
> and includes just the arch configuration, clock driver, device tree
> configuration.
>
> Many peripheral drivers will be submitted later.
>
> Any comments will be appreciated!
>
> Thanks,
>
> Bintian Wang (3):
>   arm64: Enable Hisilicon ARMv8 SoC family in Kconfig and defconfig
>   clk: hi6220: Clock driver support for Hisilicon hi6220 SoC
>   arm64: dts: Add dts files for Hisilicon Hi6220 SoC

Thanks for posting these! I've applied this series on top of
next-20150204, however there was some fuzz that needed to be cleaned
up on 3/3 [1]. I've confirmed the platform is booting to a basic user
space without issue.

Tested-by: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>
>  .../bindings/arm/hisilicon/hisilicon.txt           |   33 +++
>  .../devicetree/bindings/clock/hi6220-clock.txt     |   30 +++
>  arch/arm64/Kconfig                                 |    6 +
>  arch/arm64/boot/dts/Makefile                       |    1 +
>  arch/arm64/boot/dts/hisilicon/Makefile             |    5 +
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     |   31 +++
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |  204 ++++++++++++++
>  arch/arm64/configs/defconfig                       |    1 +
>  drivers/clk/Kconfig                                |    2 +
>  drivers/clk/Makefile                               |    4 +-
>  drivers/clk/hisilicon/Kconfig                      |    5 +
>  drivers/clk/hisilicon/Makefile                     |    1 +
>  drivers/clk/hisilicon/clk-hi6220.c                 |  284 ++++++++++++++++++++
>  drivers/clk/hisilicon/clk.c                        |   29 ++
>  drivers/clk/hisilicon/clk.h                        |   17 ++
>  drivers/clk/hisilicon/clkdivider-hi6220.c          |  273 +++++++++++++++++++
>  include/dt-bindings/clock/hi6220-clock.h           |  172 ++++++++++++
>  17 files changed, 1095 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/hi6220-clock.txt
>  create mode 100644 arch/arm64/boot/dts/hisilicon/Makefile
>  create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
>  create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220.dtsi
>  create mode 100644 drivers/clk/hisilicon/Kconfig
>  create mode 100644 drivers/clk/hisilicon/clk-hi6220.c
>  create mode 100644 drivers/clk/hisilicon/clkdivider-hi6220.c
>  create mode 100644 include/dt-bindings/clock/hi6220-clock.h
>
> --
> 1.7.9.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Cheers,

Tyler

[1] https://git.linaro.org/people/tyler.baker/linux.git/commitdiff/e9ab7b08e844009c66ba5ecf946d4b3e23551f73?hp=fcfe654f30cf75c847f69b2965c6b9e4d01c5b08
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
