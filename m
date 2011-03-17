From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V4 1/5] arm/dt: add basic mx51 device tree support
Date: Thu, 17 Mar 2011 09:54:35 +0800
Message-ID: <20110317015435.GF11658@S2100-06.ap.freescale.net>
References: <1299733185-2172-1-git-send-email-jason.hui@linaro.org>
	<1299733185-2172-2-git-send-email-jason.hui@linaro.org>
	<20110315070342.GB23050@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110315070342.GB23050-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2011 at 01:03:42AM -0600, Grant Likely wrote:
> Hi Jason,
> 
> Minor comments below.
> 
> On Thu, Mar 10, 2011 at 12:59:41PM +0800, Jason Liu wrote:
> > Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> This looks wrong.  You should only have one s-o-b line.  Use one email
> addr or the other.  Not both.
> 
> > ---
> >  arch/arm/mach-mx5/Kconfig               |    8 ++++
> >  arch/arm/mach-mx5/Makefile              |    1 +
> >  arch/arm/mach-mx5/board-dt.c            |   65 +++++++++++++++++++++++++++++++
> >  arch/arm/mach-mx5/clock-mx51-mx53.c     |   43 ++++++++++++++++++++-
> >  arch/arm/plat-mxc/include/mach/common.h |    1 +
> >  5 files changed, 117 insertions(+), 1 deletions(-)
> > 
> > diff --git a/arch/arm/mach-mx5/Kconfig b/arch/arm/mach-mx5/Kconfig
> > index de4fa99..6438f87 100644
> > --- a/arch/arm/mach-mx5/Kconfig
> > +++ b/arch/arm/mach-mx5/Kconfig
> > @@ -47,6 +47,14 @@ config MACH_MX51_BABBAGE
> >  	  u-boot. This includes specific configurations for the board and its
> >  	  peripherals.
> >  
> > +config MACH_MX51_DT
> > +	bool "Generic MX51 board (FDT support)"
> > +	select USE_OF
> > +	select SOC_IMX51
> > +	help
> > +	 Support for generic Freescale i.MX51 boards using Flattened Device
> > +	 Tree.
> > +
> >  config MACH_MX51_3DS
> >  	bool "Support MX51PDK (3DS)"
> >  	select SOC_IMX51
> > diff --git a/arch/arm/mach-mx5/Makefile b/arch/arm/mach-mx5/Makefile
> > index 0d43be9..540697e 100644
> > --- a/arch/arm/mach-mx5/Makefile
> > +++ b/arch/arm/mach-mx5/Makefile
> > @@ -18,3 +18,4 @@ obj-$(CONFIG_MACH_EUKREA_CPUIMX51SD) += board-cpuimx51sd.o
> >  obj-$(CONFIG_MACH_EUKREA_MBIMXSD51_BASEBOARD) += eukrea_mbimxsd-baseboard.o
> >  obj-$(CONFIG_MACH_MX51_EFIKAMX) += board-mx51_efikamx.o
> >  obj-$(CONFIG_MACH_MX50_RDP) += board-mx50_rdp.o
> > +obj-$(CONFIG_MACH_MX51_DT) += board-dt.o
> > diff --git a/arch/arm/mach-mx5/board-dt.c b/arch/arm/mach-mx5/board-dt.c
> > new file mode 100644
> > index 0000000..19c60a4
> > --- /dev/null
> > +++ b/arch/arm/mach-mx5/board-dt.c
> > @@ -0,0 +1,65 @@
> > +/*
> > + * Copyright 2011 Linaro Ltd.
> > + * Copyright 2011 Freescale Semiconductor, Inc.
> > + *
> > + * The code contained herein is licensed under the GNU General Public
> > + * License. You may obtain a copy of the GNU General Public License
> > + * Version 2 or later at the following locations:
> > + *
> > + * http://www.opensource.org/licenses/gpl-license.html
> > + * http://www.gnu.org/copyleft/gpl.html
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/init.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/of_fdt.h>
> > +
> > +#include <mach/common.h>
> > +#include <mach/hardware.h>
> > +#include <mach/imx-uart.h>
> > +#include <mach/iomux-mx51.h>
> > +
> > +#include <asm/irq.h>
> > +#include <asm/setup.h>
> > +#include <asm/mach-types.h>
> > +#include <asm/mach/arch.h>
> > +#include <asm/mach/time.h>
> > +
> > +#include "devices.h"
> > +
> > +static struct of_device_id mx51_dt_match_table[] __initdata = {
> > +	{ .compatible = "simple-bus", },
> > +	{}
> > +};
> > +
> > +static void __init mx51_dt_board_init(void)
> > +{
> > +	of_platform_bus_probe(NULL, mx51_dt_match_table, NULL);
> > +}
> > +
> > +static void __init mx51_dt_timer_init(void)
> > +{
> > +	mx51_clocks_init(32768, 24000000, 22579200, 0);
> > +	mx5_clk_dt_init();
> > +}
> > +
> > +static struct sys_timer mxc_timer = {
> > +	.init = mx51_dt_timer_init,
> > +};
> > +
> > +static const char *mx51_dt_board_compat[] = {
> > +	"fsl,mx51-babbage",
> > +	NULL
> > +};
> > +
> > +DT_MACHINE_START(MX51_DT, "Freescale MX51 (Flattened Device Tree)")
> > +	.boot_params  = PHYS_OFFSET + 0x100,
> 
> You should be able to drop the .boot_params line.
> 
> > +	.map_io       = mx51_map_io,
> > +	.init_irq     = mx51_init_irq,
> > +	.init_machine = mx51_dt_board_init,
> > +	.dt_compat    = mx51_dt_board_compat,
> > +	.timer        = &mxc_timer,
> > +MACHINE_END
> > diff --git a/arch/arm/mach-mx5/clock-mx51-mx53.c b/arch/arm/mach-mx5/clock-mx51-mx53.c
> > index 0a19e75..dedb7f9 100644
> > --- a/arch/arm/mach-mx5/clock-mx51-mx53.c
> > +++ b/arch/arm/mach-mx5/clock-mx51-mx53.c
> > @@ -15,13 +15,19 @@
> >  #include <linux/clk.h>
> >  #include <linux/io.h>
> >  #include <linux/clkdev.h>
> > -
> > +#include <linux/err.h>
> >  #include <asm/div64.h>
> >  
> >  #include <mach/hardware.h>
> >  #include <mach/common.h>
> >  #include <mach/clock.h>
> >  
> > +#ifdef CONFIG_OF
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_clk.h>
> > +#endif /* CONFIG_OF */
> 
> You can drop the #ifdef CONFIG_OF here.  linux/of*.h is safe to
> include when CONFIG_OF is not selected.
> 
> > +
> >  #include "crm_regs.h"
> >  
> >  /* External clock values passed-in by the board code */
> > @@ -1432,3 +1438,38 @@ int __init mx53_clocks_init(unsigned long ckil, unsigned long osc,
> >  		MX53_INT_GPT);
> >  	return 0;
> >  }
> > +
> > +#ifdef CONFIG_OF
> > +static struct clk *mx5_dt_clk_get(struct device_node *np,
> > +					const char *output_id, void *data)
> > +{
> > +	return data;
> > +}
> > +
> > +static __init void mx5_dt_scan_clks(void)
> > +{
> > +	struct device_node *node;
> > +	struct clk *clk;
> > +	const char *id;
> > +	int rc;
> > +
> > +	for_each_compatible_node(node, NULL, "clock") {
> > +		id = of_get_property(node, "clock-outputs", NULL);
> > +		if (!id)
> > +			continue;
> > +
> > +		clk = clk_get_sys(id, NULL);
> > +		if (IS_ERR(clk))
> > +			continue;
> > +
> > +		rc = of_clk_add_provider(node, mx5_dt_clk_get, clk);
> > +		if (rc)
> > +			pr_err("error adding fixed clk %s\n", node->name);
> > +	}
> > +}
> > +
> > +void __init mx5_clk_dt_init(void)
> > +{
> > +	mx5_dt_scan_clks();
> > +}
> > +#endif
> 
> Nitpick: Would it make sense for these 3 functions to be in a separate .c file?
> 
Sorry for that I'm late on this.  It will not make much sense to do
so if considering that dynamic dt clock codes have to be put in
clock-mx51-mx53.c anyway, since they are referring to existing
enable/disable/get_rate/set_rate/... functions.

-- 
Regards,
Shawn
