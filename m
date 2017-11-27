From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] clocksource: sprd: Add timer driver for Spreadtrum
 SC9860 platform
Date: Mon, 27 Nov 2017 13:15:40 +0800
Message-ID: <CAMz4ku+5zAt40Vzdiv4NZuXUb3Utex5f_-HWHtASM9abBx9Fxw@mail.gmail.com>
References: <58d686b831e2509d6fc29fbe61dc610902c250c3.1511501514.git.baolin.wang@spreadtrum.com>
 <201711251226.MKE0Bxdd%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201711251226.MKE0Bxdd%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 25 November 2017 at 13:00, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> Hi Baolin,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on tip/timers/core]
> [also build test WARNING on v4.14 next-20171124]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Baolin-Wang/dt-bindings-clocksource-Add-Spreadtrum-SC9860-timer/20171125-090749
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/swab.h:4:0,
>                     from include/uapi/linux/byteorder/big_endian.h:12,
>                     from include/linux/byteorder/big_endian.h:4,
>                     from arch/arm/include/uapi/asm/byteorder.h:19,
>                     from include/asm-generic/bitops/le.h:5,
>                     from arch/arm/include/asm/bitops.h:340,
>                     from include/linux/bitops.h:37,
>                     from include/linux/kernel.h:10,
>                     from include/linux/list.h:8,
>                     from include/linux/preempt.h:10,
>                     from include/linux/spinlock.h:50,
>                     from include/linux/seqlock.h:35,
>                     from include/linux/time.h:5,
>                     from include/uapi/linux/timex.h:56,
>                     from include/linux/timex.h:56,
>                     from include/linux/clocksource.h:12,
>                     from drivers/clocksource/sprd-timer.c:7:
>    drivers/clocksource/sprd-timer.c: In function 'sprd_timer_update_counter':
>    drivers/clocksource/sprd-timer.c:85:24: warning: right shift count >= width of type [-Wshift-count-overflow]
>      writel_relaxed(cycles >> TIMER_VALUE_HI_SHIFT,

OK. I will fix this warning in next version. Thanks.

>                            ^
>    include/uapi/linux/swab.h:113:54: note: in definition of macro '__swab32'
>     #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
>                                                          ^
>    include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__cpu_to_le32'
>     #define cpu_to_le32 __cpu_to_le32
>                         ^~~~~~~~~~~~~
>>> drivers/clocksource/sprd-timer.c:85:2: note: in expansion of macro 'writel_relaxed'
>      writel_relaxed(cycles >> TIMER_VALUE_HI_SHIFT,
>      ^~~~~~~~~~~~~~
>
> vim +/writel_relaxed +85 drivers/clocksource/sprd-timer.c
>
>     79
>     80  static void sprd_timer_update_counter(struct sprd_timer_device *timer,
>     81                                        unsigned long cycles)
>     82  {
>     83          writel_relaxed(cycles & TIMER_VALUE_LO_MASK,
>     84                         timer->base + TIMER_LOAD_LO);
>   > 85          writel_relaxed(cycles >> TIMER_VALUE_HI_SHIFT,
>     86                         timer->base + TIMER_LOAD_HI);
>     87  }
>     88
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
