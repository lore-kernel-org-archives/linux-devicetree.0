From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 02/15] sh: Eliminate unused irq_reg_{readl,writel} accessors
Date: Thu, 30 Oct 2014 10:00:53 +0100
Message-ID: <2294092.AHz8W66sEP@wuerfel>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <1414635488-14137-3-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414635488-14137-3-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Wednesday 29 October 2014 19:17:55 Kevin Cernekee wrote:
> Defining these macros way down in arch/sh/.../irq.c doesn't cause
> kernel/irq/generic-chip.c to use them.  As far as I can tell this code
> has no effect.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

Actually it overrides the 32-bit accessors with 16-bit accessors,
which does seem intentional and certainly has an effect.

	Arnd

>  arch/sh/boards/mach-se/7343/irq.c | 3 ---
>  arch/sh/boards/mach-se/7722/irq.c | 3 ---
>  2 files changed, 6 deletions(-)
> 
> diff --git a/arch/sh/boards/mach-se/7343/irq.c b/arch/sh/boards/mach-se/7343/irq.c
> index 7646bf0..1087dba 100644
> --- a/arch/sh/boards/mach-se/7343/irq.c
> +++ b/arch/sh/boards/mach-se/7343/irq.c
> @@ -14,9 +14,6 @@
>  #define DRV_NAME "SE7343-FPGA"
>  #define pr_fmt(fmt) DRV_NAME ": " fmt
>  
> -#define irq_reg_readl  ioread16
> -#define irq_reg_writel iowrite16
> -
>  #include <linux/init.h>
>  #include <linux/irq.h>
>  #include <linux/interrupt.h>
