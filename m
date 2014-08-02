From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Migrate PXA27x platforms to clock framework
Date: Sat, 2 Aug 2014 20:27:21 +0800
Message-ID: <CAN1soZwDDwiLuVkT7kRJX-wy-UmyDj-2yiReGrpBrTOJkKpuSA@mail.gmail.com>
References: <1406753464-15000-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406753464-15000-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 31, 2014 at 4:50 AM, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> wrote:
> This is the third opus of this serie.
> From the previous one :
>  - the boot ordering was fixed
>    For DT, we rely on time_init() in arch/arm
>    For non-DT, we keep the postcore_init() until all 3 PXA variants are
>    converted, and meanwhile I'll discuss with Haojian where to call directly the
>    clocks init function.
>  - the section mismatches were fixed
>    A split is done between CKEN clock descriptor and CKEN clock structure
>
> The result was tested with a Mitac MIO A701 :
>  - with the upstream platform-data based machine code
>  - with the device-tree version
>
> As for the patches, if they are carried fully by Mike, I think there will be a
> minor conflict in arch/arm/mach-pxa/Makefile with the clocksource patches I
> submitted earlier.
>
> As before, the goal remains the same :
>  - keeping legacy platforms working (ie. without device-tree)
>  - enable PXA27x to work with a device-tree kernel, and hence
>    open the way to drivers conversion
>  - be robust enough to support pxa25x and pxa3xx later inclusion
>    with almost no change to clk-pxa-dt.c.
>
> Robert Jarzmik (6):
>   clk: add pxa clocks infrastructure
>   clk: dts: document pxa clock binding
>   arm: pxa: add clock pll selection bits
>   clk: add pxa27x clock drivers
>   dts: add devicetree bindings for pxa27x clocks
>   arm: pxa: Transition pxa27x to clk framework
>
>  .../devicetree/bindings/clock/pxa-clock.txt        |  16 +
>  arch/arm/Kconfig                                   |   1 +
>  arch/arm/boot/dts/pxa27x.dtsi                      |  20 +-
>  arch/arm/mach-pxa/Makefile                         |   8 +-
>  arch/arm/mach-pxa/include/mach/pxa2xx-regs.h       |  10 +
>  arch/arm/mach-pxa/pxa27x.c                         | 186 +----------
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/pxa/Makefile                           |   2 +
>  drivers/clk/pxa/clk-pxa.c                          |  97 ++++++
>  drivers/clk/pxa/clk-pxa.h                          | 107 ++++++
>  drivers/clk/pxa/clk-pxa27x.c                       | 370 +++++++++++++++++++++
>  include/dt-bindings/clock/pxa-clock.h              |  77 +++++
>  12 files changed, 716 insertions(+), 179 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/pxa-clock.txt
>  create mode 100644 drivers/clk/pxa/Makefile
>  create mode 100644 drivers/clk/pxa/clk-pxa.c
>  create mode 100644 drivers/clk/pxa/clk-pxa.h
>  create mode 100644 drivers/clk/pxa/clk-pxa27x.c
>  create mode 100644 include/dt-bindings/clock/pxa-clock.h
>
> --
> 2.0.0.rc2
>

Acked-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Only with a small comment.

Regards
Haojian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
