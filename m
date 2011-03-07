From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2 1/3] arm/dt: add basic mx51 device tree support
Date: Mon, 7 Mar 2011 22:23:55 +0800
Message-ID: <20110307142354.GA9978@S2101-09.ap.freescale.net>
References: <1299503160-9910-1-git-send-email-jason.hui@linaro.org>
	<1299503160-9910-2-git-send-email-jason.hui@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1299503160-9910-2-git-send-email-jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 07, 2011 at 09:05:58PM +0800, Jason Liu wrote:
> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
[...]
> diff --git a/arch/arm/mach-mx5/board-dt.c b/arch/arm/mach-mx5/board-dt.c
> new file mode 100644
> index 0000000..90593f5
> --- /dev/null
> +++ b/arch/arm/mach-mx5/board-dt.c
> @@ -0,0 +1,64 @@
> +/*
> + * Copyright 2011 Freescale Semiconductor, Inc. All Rights Reserved.
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_fdt.h>
> +
> +#include <mach/common.h>
> +#include <mach/hardware.h>
> +#include <mach/imx-uart.h>
> +#include <mach/iomux-mx51.h>
> +
> +#include <asm/irq.h>
> +#include <asm/setup.h>
> +#include <asm/mach-types.h>
> +#include <asm/mach/arch.h>
> +#include <asm/mach/time.h>
> +
> +#include "devices.h"
> +
> +static struct of_device_id mx51_dt_match_table[] __initdata = {
> +	{ .compatible = "simple-bus", },
> +	{}
> +};
> +
> +static void __init mx51_dt_board_init(void)
> +{
> +	of_platform_bus_probe(NULL, mx51_dt_match_table, NULL);
> +}
> +
> +static void __init mx51_dt_timer_init(void)
> +{
> +	mx51_clocks_init(32768, 24000000, 22579200, 0);
> +	mx5_clk_dt_init();
> +}
> +
> +static struct sys_timer mxc_timer = {
> +	.init = mx51_dt_timer_init,
> +};
> +
> +static const char * const mx51_dt_board_compat[] = {

The extra 'const' is introducing the warning below.

arch/arm/mach-mx5/board-dt.c:69: warning: initialization discards qualifiers from pointer target type

> +	"fsl,mx51-babbage",
> +	NULL
> +};
> +
> +DT_MACHINE_START(MX51_DT, "Freescale MX51 (Flattened Device Tree)")
> +	.boot_params  = PHYS_OFFSET + 0x100,
> +	.map_io       = mx51_map_io,
> +	.init_irq     = mx51_init_irq,
> +	.init_machine = mx51_dt_board_init,
> +	.dt_compat    = mx51_dt_board_compat,
> +	.timer        = &mxc_timer,
> +MACHINE_END

-- 
Regards,
Shawn
