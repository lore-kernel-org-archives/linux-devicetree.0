From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCHv5 1/2] ARM: socfpga: support suspend to ram
Date: Thu, 28 May 2015 22:15:16 -0500
Message-ID: <5567D9C4.7090903@opensource.altera.com>
References: <1432847977-18880-1-git-send-email-atull@opensource.altera.com>
 <1432847977-18880-2-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432847977-18880-2-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>
Cc: Pavel Machek <pavel@denx.de>, Arnd Bergmann <arnd@arndb.de>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Delicious Quinoq <delicious.quinoa@gmail.com>
List-Id: devicetree@vger.kernel.org



On 5/28/15 4:19 PM, Alan Tull wrote:
> Add code that requests that the sdr controller go into
> self-refresh mode.  This code is run from ocram.
> 
> Suspend-to-RAM and EDAC support are mutually exclusive on
> SOCFPGA.  If the EDAC is enabled, it will prevent the
> platform from going into suspend.
> 
> Example of how to request to suspend to ram:
>  $ echo enabled > \
> /sys/devices/soc/ffc02000.serial0/tty/ttyS0/power/wakeup
> 
>  $ echo -n mem > /sys/power/state
> 
> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> Cc: Pavel Machek <pavel@denx.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
> Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> v2: use Generic on-chip SRAM driver to allocate ocram
>     rm fncpy_align since generic allocator handles alignment
>     check __arm_ioremap_exec return code
>     check for NULL pointers
>     add a comment regarding sdram controller configuration
> v3: fix renamed #define
>     propagate socfpga_setup_ocram_self_refresh error code
> v4: Kconfig: don't need to select GENERIC_ALLOCATER
>     add CONFIG_SOCFPGA_SUSPEND
>     make s2r and EDAC support mutually exclusive
>     socfpga.c: add sdr_ctl_base_addr
>     return error if ocram not available in device tree
>     update copyright years
> v5: remove compile time dependency
>     edac driver will prevent suspend
>     don't configure scu standby mode; done in enable_scu().
>     fix comments about required sdram controller configuration
> ---
>  arch/arm/mach-socfpga/Kconfig        |   10 ++-
>  arch/arm/mach-socfpga/Makefile       |    1 +
>  arch/arm/mach-socfpga/core.h         |    6 +-
>  arch/arm/mach-socfpga/pm.c           |  149 ++++++++++++++++++++++++++++++++++
>  arch/arm/mach-socfpga/self-refresh.S |  136 +++++++++++++++++++++++++++++++
>  arch/arm/mach-socfpga/socfpga.c      |    6 +-
>  drivers/edac/altera_edac.c           |   20 +++++
>  7 files changed, 325 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/mach-socfpga/pm.c
>  create mode 100644 arch/arm/mach-socfpga/self-refresh.S
> 

Which branch are you basing this patch on? I got a trivial patch
conflict in Kconfig when I applied to arm-soc/for-next and v4.1-rc5.

Also, I'm getting these sparse warnings:

arch/arm/mach-socfpga/pm.c:86:25: warning: incorrect type in argument 1
(different address spaces)
arch/arm/mach-socfpga/pm.c:86:25:    expected void *<noident>
arch/arm/mach-socfpga/pm.c:86:25:    got void [noderef]
<asn:2>*[assigned] suspend_ocram_base
arch/arm/mach-socfpga/pm.c:108:52: warning: cast removes address space
of expression

Dinh
