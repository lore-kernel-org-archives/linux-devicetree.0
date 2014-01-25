From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v4 01/18] ARM: Introduce atomic MMIO modify
Date: Sat, 25 Jan 2014 15:32:31 -0500
Message-ID: <20140125203231.GG29184@titan.lakedaemon.net>
References: <1390431915-5115-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390431915-5115-2-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1390431915-5115-2-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Russell,

On Wed, Jan 22, 2014 at 08:04:58PM -0300, Ezequiel Garcia wrote:
> Some SoC have MMIO regions that are shared across orthogonal
> subsystems. This commit implements a possible solution for the
> thread-safe access of such regions through a spinlock-protected API.
> 
> Concurrent access is protected with a single spinlock for the
> entire MMIO address space. While this protects shared-registers,
> it also serializes access to unrelated/unshared registers.
> 
> We add relaxed and non-relaxed variants, by using writel_relaxed and writel,
> respectively. The rationale for this is that some users may not require
> register write completion but only thread-safe access to a register.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/include/asm/io.h |  6 ++++++
>  arch/arm/kernel/io.c      | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)

This has been in your patch tracker for a while:

  http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7930/1

When you requested Acks, we sent them:

  http://www.spinics.net/lists/arm-kernel/msg300250.html

Is there anything more you need from us?  The rest of this series
depends on this patch.  Could you place it in a topic branch so we can
base the rest of the series off of it?  Or, if you prefer, Ack it and
drop it from your patch tracker?  I'm fine either way.

thx,

Jason.

> 
> diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
> index fbeb39c..8aa4cca 100644
> --- a/arch/arm/include/asm/io.h
> +++ b/arch/arm/include/asm/io.h
> @@ -38,6 +38,12 @@
>  #define isa_bus_to_virt phys_to_virt
>  
>  /*
> + * Atomic MMIO-wide IO modify
> + */
> +extern void atomic_io_modify(void __iomem *reg, u32 mask, u32 set);
> +extern void atomic_io_modify_relaxed(void __iomem *reg, u32 mask, u32 set);
> +
> +/*
>   * Generic IO read/write.  These perform native-endian accesses.  Note
>   * that some architectures will want to re-define __raw_{read,write}w.
>   */
> diff --git a/arch/arm/kernel/io.c b/arch/arm/kernel/io.c
> index dcd5b4d..9203cf8 100644
> --- a/arch/arm/kernel/io.c
> +++ b/arch/arm/kernel/io.c
> @@ -1,6 +1,41 @@
>  #include <linux/export.h>
>  #include <linux/types.h>
>  #include <linux/io.h>
> +#include <linux/spinlock.h>
> +
> +static DEFINE_RAW_SPINLOCK(__io_lock);
> +
> +/*
> + * Generic atomic MMIO modify.
> + *
> + * Allows thread-safe access to registers shared by unrelated subsystems.
> + * The access is protected by a single MMIO-wide lock.
> + */
> +void atomic_io_modify_relaxed(void __iomem *reg, u32 mask, u32 set)
> +{
> +	unsigned long flags;
> +	u32 value;
> +
> +	raw_spin_lock_irqsave(&__io_lock, flags);
> +	value = readl_relaxed(reg) & ~mask;
> +	value |= (set & mask);
> +	writel_relaxed(value, reg);
> +	raw_spin_unlock_irqrestore(&__io_lock, flags);
> +}
> +EXPORT_SYMBOL(atomic_io_modify_relaxed);
> +
> +void atomic_io_modify(void __iomem *reg, u32 mask, u32 set)
> +{
> +	unsigned long flags;
> +	u32 value;
> +
> +	raw_spin_lock_irqsave(&__io_lock, flags);
> +	value = readl_relaxed(reg) & ~mask;
> +	value |= (set & mask);
> +	writel(value, reg);
> +	raw_spin_unlock_irqrestore(&__io_lock, flags);
> +}
> +EXPORT_SYMBOL(atomic_io_modify);
>  
>  /*
>   * Copy data from IO memory space to "real" memory space.
> -- 
> 1.8.1.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
