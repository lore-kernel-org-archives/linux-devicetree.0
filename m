From: Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH] ARM: BCM5301X: Add back handler ignoring external
 imprecise aborts
Date: Mon, 31 Oct 2016 11:08:47 -0700
Message-ID: <a491509e-5cfc-fc7d-0011-dfcab3c884ea@broadcom.com>
References: <20161029111229.26875-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20161029111229.26875-1-zajec5@gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, Lucas Stach <l.stach@pengutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Jon Mason <jonmason@broadcom.com>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org

Hi Rafal,


On 16-10-29 04:12 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
>
> Since early BCM5301X days we got abort handler that was removed by
> commit 937b12306ea79 ("ARM: BCM5301X: remove workaround imprecise abort
> fault handler"). It assumed we need to deal only with pending aborts
> left by the bootloader. Unfortunately this isn't true for BCM5301X.
>
> When probing PCI config space (device enumeration) it is expected to
> have master aborts on the PCI bus. Most bridges don't forward (or they
> allow disabling it) these errors onto the AXI/AMBA bus but not the
> Northstar (BCM5301X) one.
Should we only add this workaround code if CONFIG_PCI is on then?

>
> iProc PCIe controller on Northstar seems to be some older one, without
> a control register for errors forwarding. It means we need to workaround
> this at platform level. All newer platforms are not affected by this
> issue.
>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  arch/arm/mach-bcm/bcm_5301x.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm/mach-bcm/bcm_5301x.c b/arch/arm/mach-bcm/bcm_5301x.c
> index c8830a2..fe067f6 100644
> --- a/arch/arm/mach-bcm/bcm_5301x.c
> +++ b/arch/arm/mach-bcm/bcm_5301x.c
> @@ -9,14 +9,42 @@
>  #include <asm/hardware/cache-l2x0.h>
>
>  #include <asm/mach/arch.h>
> +#include <asm/siginfo.h>
> +#include <asm/signal.h>
> +
> +#define FSR_EXTERNAL		(1 << 12)
> +#define FSR_READ		(0 << 10)
> +#define FSR_IMPRECISE		0x0406
>
>  static const char *const bcm5301x_dt_compat[] __initconst = {
>  	"brcm,bcm4708",
>  	NULL,
>  };
>
> +static int bcm5301x_abort_handler(unsigned long addr, unsigned int fsr,
> +				  struct pt_regs *regs)
> +{
> +	/*
> +	 * We want to ignore aborts forwarded from the PCIe bus that are
> +	 * expected and shouldn't really be passed by the PCIe controller.
> +	 * The biggest disadvantage is the same FSR code may be reported when
> +	 * reading non-existing APB register and we shouldn't ignore that.
> +	 */
> +	if (fsr == (FSR_EXTERNAL | FSR_READ | FSR_IMPRECISE))
> +		return 0;
> +
> +	return 1;
> +}
> +
> +static void __init bcm5301x_init_early(void)
> +{
> +	hook_fault_code(16 + 6, bcm5301x_abort_handler, SIGBUS, BUS_OBJERR,
> +			"imprecise external abort");
> +}
> +
>  DT_MACHINE_START(BCM5301X, "BCM5301X")
>  	.l2c_aux_val	= 0,
>  	.l2c_aux_mask	= ~0,
>  	.dt_compat	= bcm5301x_dt_compat,
> +	.init_early	= bcm5301x_init_early,
>  MACHINE_END
>

Regards,
Scott
