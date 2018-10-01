From: Yasha Cherikovsky <yasha.che3@gmail.com>
Subject: Re: [RFC 5/5] MIPS: Add Realtek RTL8186 SoC support
Date: Mon, 01 Oct 2018 12:24:58 +0300
Message-ID: <a7854b26769c0baec6ad03cc1eee03b78f89b194.camel@gmail.com>
References: <20180930141510.2690-1-yasha.che3@gmail.com>
         <20180930141510.2690-6-yasha.che3@gmail.com>
         <a7bba9bd-dab3-4f92-465f-e05beee2b9e3@arm.com>
         <ceced0d550bc30d4f3e66d2c7f569c39ca890ce4.camel@gmail.com>
         <351da67a-b1e6-7972-5c91-0f204690080f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <351da67a-b1e6-7972-5c91-0f204690080f@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2018-10-01 at 10:15 +0100, Marc Zyngier wrote:
> On 01/10/18 09:48, Yasha Cherikovsky wrote:
> > Hi Marc,
> > 
> > On Mon, 2018-10-01 at 09:19 +0100, Marc Zyngier wrote:
> > > Hi Yasha,
> > > 
> > > On 30/09/18 15:15, Yasha Cherikovsky wrote:
> > > > The Realtek RTL8186 SoC is a MIPS based SoC
> > > > used in some home routers [1][2].
> > > > 
> > > > The hardware includes Lexra LX5280 CPU with a TLB,
> > > > two Ethernet controllers, a WLAN controller and more.
> > > > 
> > > > With this patch, it is possible to successfully boot
> > > > the kernel and load userspace on the Edimax BR-6204Wg
> > > > router.
> > > > Network drivers support will come in future patches.
> > > > 
> > > > This patch includes:
> > > > - New MIPS rtl8186 platform
> > > >       - Core platform setup code (mostly DT based)
> > > >       - New Kconfig option
> > > >       - defconfig file
> > > >       - MIPS zboot UART support
> > > > - RTL8186 interrupt controller driver
> > > > - RTL8186 timer driver
> > > > - Device tree files for the RTL8186 SoC and Edimax BR-6204Wg
> > > >     router
> > > > 
> > > > [1] https://www.linux-mips.org/wiki/Realtek_SOC#Realtek_RTL8186
> > > > [2] https://wikidevi.com/wiki/Realtek_RTL8186
> > > > 
> > > > Signed-off-by: Yasha Cherikovsky <yasha.che3@gmail.com>
> > > > Cc: Ralf Baechle <ralf@linux-mips.org>
> > > > Cc: Paul Burton <paul.burton@mips.com>
> > > > Cc: James Hogan <jhogan@kernel.org>
> > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > Cc: Jason Cooper <jason@lakedaemon.net>
> > > > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > > > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > > Cc: linux-mips@linux-mips.org
> > > > Cc: devicetree@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > ---
> > > >    arch/mips/Kbuild.platforms                    |   1 +
> > > >    arch/mips/Kconfig                             |  17 ++
> > > >    arch/mips/boot/compressed/uart-16550.c        |   5 +
> > > >    arch/mips/boot/dts/Makefile                   |   1 +
> > > >    arch/mips/boot/dts/realtek/Makefile           |   4 +
> > > >    arch/mips/boot/dts/realtek/rtl8186.dtsi       |  86 +++++++
> > > >    .../dts/realtek/rtl8186_edimax_br_6204wg.dts  |  45 ++++
> > > >    arch/mips/configs/rtl8186_defconfig           | 112 +++++++++
> > > >    arch/mips/include/asm/mach-rtl8186/rtl8186.h  |  37 +++
> > > >    arch/mips/rtl8186/Makefile                    |   2 +
> > > >    arch/mips/rtl8186/Platform                    |   7 +
> > > >    arch/mips/rtl8186/irq.c                       |   8 +
> > > >    arch/mips/rtl8186/prom.c                      |  15 ++
> > > >    arch/mips/rtl8186/setup.c                     |  80 +++++++
> > > >    arch/mips/rtl8186/time.c                      |  10 +
> > > >    drivers/clocksource/Kconfig                   |   9 +
> > > >    drivers/clocksource/Makefile                  |   1 +
> > > >    drivers/clocksource/timer-rtl8186.c           | 220
> > > > ++++++++++++++++++
> > > >    drivers/irqchip/Kconfig                       |   5 +
> > > >    drivers/irqchip/Makefile                      |   1 +
> > > >    drivers/irqchip/irq-rtl8186.c                 | 107 +++++++++
> > > 
> > > Could you please split this into at least three patches (arch code,
> > > clocksource, irqchip) to ease the review?
> > > 
> > > Thanks,
> > > 
> > > 	M.
> > 
> > Currently the RTL8186_IRQ and the RTL8186_TIMER Kconfig entries depend
> > on
> > MACH_RTL8186 (which is added in the MIPS portion of the same patch).
> > Also, MACH_RTL8186 in MIPS selects these two options.
> > 
> > What is the best way to split that?
> 
> It is absolutely fine to have something depending on a non-selectable 
> config option, which would allow you to split things up as finely as you 
> want. Just have the patch enabling the config option last.
> 
> Thanks,
> 
> 	M.

Good to know, thanks.
I'll send a v2 soon.

Yasha
