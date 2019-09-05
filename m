From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 13/16] ARM: mmp: move cputype.h to include/linux/soc/
Date: Thu, 5 Sep 2019 12:20:56 +0200
Message-ID: <CAK8P3a1kpRcmTW0hH7-9vd4SiJjEuTMRPb6Kb06LSiRj0AGd8A@mail.gmail.com>
References: <20190830220743.439670-14-lkundrak@v3.sk> <201909021510.0g4L7Wva%lkp@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201909021510.0g4L7Wva%lkp@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: Lubomir Rintel <lkundrak@v3.sk>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Stephen Boyd <sboyd@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, "Cc : Rob Herring" <robh+dt@kernel.org>, kbuild-all@01.org, "To : Olof Johansson" <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, linux-clk <linux-clk@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 2, 2019 at 10:16 AM kbuild test robot <lkp@intel.com> wrote:

>
> vim +5 include/linux/soc/mmp/cputype.h
>
> 49cbe78637eb05 arch/arm/mach-mmp/include/mach/cputype.h Eric Miao 2009-01-20  4
> 49cbe78637eb05 arch/arm/mach-mmp/include/mach/cputype.h Eric Miao 2009-01-20 @5  #include <asm/cputype.h>
> 49cbe78637eb05 arch/arm/mach-mmp/include/mach/cputype.h Eric Miao 2009-01-20  6
>

You can probably do something like

#ifdef CONFIG_ARM
#include <asm/cputype.h>
#else
static inline read_cpuid_id(void) { return 0; }
#endif

Then again, ideally drivers don't even have to know about this,
but would distinguish between devices based on the
compatible string for the particular device.

       Arnd
