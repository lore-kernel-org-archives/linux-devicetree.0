From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [RFC 5/5] MIPS: Add Realtek RTL8186 SoC support
Date: Mon, 1 Oct 2018 09:19:50 +0100
Message-ID: <a7bba9bd-dab3-4f92-465f-e05beee2b9e3@arm.com>
References: <20180930141510.2690-1-yasha.che3@gmail.com>
 <20180930141510.2690-6-yasha.che3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180930141510.2690-6-yasha.che3@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Yasha Cherikovsky <yasha.che3@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Yasha,

On 30/09/18 15:15, Yasha Cherikovsky wrote:
> The Realtek RTL8186 SoC is a MIPS based SoC
> used in some home routers [1][2].
> 
> The hardware includes Lexra LX5280 CPU with a TLB,
> two Ethernet controllers, a WLAN controller and more.
> 
> With this patch, it is possible to successfully boot
> the kernel and load userspace on the Edimax BR-6204Wg
> router.
> Network drivers support will come in future patches.
> 
> This patch includes:
> - New MIPS rtl8186 platform
>      - Core platform setup code (mostly DT based)
>      - New Kconfig option
>      - defconfig file
>      - MIPS zboot UART support
> - RTL8186 interrupt controller driver
> - RTL8186 timer driver
> - Device tree files for the RTL8186 SoC and Edimax BR-6204Wg
>    router
> 
> [1] https://www.linux-mips.org/wiki/Realtek_SOC#Realtek_RTL8186
> [2] https://wikidevi.com/wiki/Realtek_RTL8186
> 
> Signed-off-by: Yasha Cherikovsky <yasha.che3@gmail.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-mips@linux-mips.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   arch/mips/Kbuild.platforms                    |   1 +
>   arch/mips/Kconfig                             |  17 ++
>   arch/mips/boot/compressed/uart-16550.c        |   5 +
>   arch/mips/boot/dts/Makefile                   |   1 +
>   arch/mips/boot/dts/realtek/Makefile           |   4 +
>   arch/mips/boot/dts/realtek/rtl8186.dtsi       |  86 +++++++
>   .../dts/realtek/rtl8186_edimax_br_6204wg.dts  |  45 ++++
>   arch/mips/configs/rtl8186_defconfig           | 112 +++++++++
>   arch/mips/include/asm/mach-rtl8186/rtl8186.h  |  37 +++
>   arch/mips/rtl8186/Makefile                    |   2 +
>   arch/mips/rtl8186/Platform                    |   7 +
>   arch/mips/rtl8186/irq.c                       |   8 +
>   arch/mips/rtl8186/prom.c                      |  15 ++
>   arch/mips/rtl8186/setup.c                     |  80 +++++++
>   arch/mips/rtl8186/time.c                      |  10 +
>   drivers/clocksource/Kconfig                   |   9 +
>   drivers/clocksource/Makefile                  |   1 +
>   drivers/clocksource/timer-rtl8186.c           | 220 ++++++++++++++++++
>   drivers/irqchip/Kconfig                       |   5 +
>   drivers/irqchip/Makefile                      |   1 +
>   drivers/irqchip/irq-rtl8186.c                 | 107 +++++++++

Could you please split this into at least three patches (arch code, 
clocksource, irqchip) to ease the review?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
