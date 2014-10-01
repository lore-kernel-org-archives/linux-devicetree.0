From: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] arm: socfpga: Enable ECC of L2 and OCRAM on startup.
Date: Wed, 01 Oct 2014 12:13:56 -0500
Message-ID: <542C3654.1070604@gmail.com>
References: <1412181092-27162-1-git-send-email-tthayer@opensource.altera.com> <1412181092-27162-2-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412181092-27162-2-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10/1/14, 11:31 AM, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> This patch enables the ECC for L2 cache and OCRAM on machine
> startup. In both cases, the ECC has to be enabled before data
> is stored in memory otherwise the ECC will fail on reads.
> 
> Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
>  MAINTAINERS                        |    6 +++
>  arch/arm/configs/socfpga_defconfig |    1 +
>  arch/arm/mach-socfpga/Makefile     |    2 +
>  arch/arm/mach-socfpga/l2_cache.c   |   44 +++++++++++++++++++
>  arch/arm/mach-socfpga/l2_cache.h   |   28 ++++++++++++
>  arch/arm/mach-socfpga/ocram.c      |   84 ++++++++++++++++++++++++++++++++++++
>  arch/arm/mach-socfpga/ocram.h      |   28 ++++++++++++
>  arch/arm/mach-socfpga/socfpga.c    |   13 +++++-
>  8 files changed, 205 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/mach-socfpga/l2_cache.c
>  create mode 100644 arch/arm/mach-socfpga/l2_cache.h
>  create mode 100644 arch/arm/mach-socfpga/ocram.c
>  create mode 100644 arch/arm/mach-socfpga/ocram.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5e7866a..9faf1d3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1381,6 +1381,12 @@ M:	Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>  S:	Maintained
>  F:	drivers/clk/socfpga/
>  
> +ARM/SOCFPGA EDAC SUPPORT
> +M:	Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> +S:	Maintained
> +F:	arch/arm/mach-socfpga/l2_cache.*
> +F:	arch/arm/mach-socfpga/ocram.*
> +
>  ARM/STI ARCHITECTURE
>  M:	Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  M:	Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
> diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
> index d7a5855..e757a33 100644
> --- a/arch/arm/configs/socfpga_defconfig
> +++ b/arch/arm/configs/socfpga_defconfig
> @@ -123,3 +123,4 @@ CONFIG_USB=y
>  CONFIG_USB_DWC2=y
>  CONFIG_USB_DWC2_HOST=y
>  CONFIG_USB_DWC2_PLATFORM=y
> +CONFIG_SRAM=y
> \ No newline at end of file
> diff --git a/arch/arm/mach-socfpga/Makefile b/arch/arm/mach-socfpga/Makefile
> index 6dd7a93..851a144 100644
> --- a/arch/arm/mach-socfpga/Makefile
> +++ b/arch/arm/mach-socfpga/Makefile
> @@ -4,3 +4,5 @@
>  
>  obj-y					:= socfpga.o
>  obj-$(CONFIG_SMP)	+= headsmp.o platsmp.o
> +obj-$(CONFIG_EDAC_ALTERA_OCRAM) += ocram.o
> +obj-$(CONFIG_EDAC_ALTERA_L2C) += l2_cache.o
> diff --git a/arch/arm/mach-socfpga/l2_cache.c b/arch/arm/mach-socfpga/l2_cache.c
> new file mode 100644
> index 0000000..8e109f3
> --- /dev/null
> +++ b/arch/arm/mach-socfpga/l2_cache.c
> @@ -0,0 +1,44 @@
> +/*
> + * Copyright Altera Corporation (C) 2014. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <linux/clk-provider.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +
> +#include "l2_cache.h"
> +
> +void socfpga_init_l2_ecc(void)
> +{
> +	struct device_node *np;
> +	void __iomem  *mapped_l2_edac_addr;
> +
> +	np = of_find_compatible_node(NULL, NULL, "altr,l2-edac");
> +	if (!np) {
> +		pr_err("SOCFPGA: Unable to find altr,l2-edac in dtb\n");
> +		return;
> +	}
> +
> +	mapped_l2_edac_addr = of_iomap(np, 0);
> +	if (!mapped_l2_edac_addr) {
> +		pr_err("SOCFPGA: Unable to find L2 ECC mapping in dtb\n");
> +		return;
> +	}
> +
> +	/* Enable ECC */
> +	writel(0x01, mapped_l2_edac_addr);
> +
> +	pr_debug("SOCFPGA: Success Initializing L2 cache ECC\n");
> +}
> +
> diff --git a/arch/arm/mach-socfpga/l2_cache.h b/arch/arm/mach-socfpga/l2_cache.h
> new file mode 100644
> index 0000000..58e140d
> --- /dev/null
> +++ b/arch/arm/mach-socfpga/l2_cache.h
> @@ -0,0 +1,28 @@
> +/*
> + * Copyright Altera Corporation (C) 2014. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef MACH_SOCFPGA_L2_CACHE_H
> +#define MACH_SOCFPGA_L2_CACHE_H
> +
> +#ifdef CONFIG_EDAC_ALTERA_L2C
> +void socfpga_init_l2_ecc(void);
> +#else
> +inline void socfpga_init_l2_ecc(void)
> +{
> +}
> +#endif
> +
> +#endif /* #ifndef MACH_SOCFPGA_L2_CACHE_H */
> diff --git a/arch/arm/mach-socfpga/ocram.c b/arch/arm/mach-socfpga/ocram.c
> new file mode 100644
> index 0000000..26ec113
> --- /dev/null
> +++ b/arch/arm/mach-socfpga/ocram.c
> @@ -0,0 +1,84 @@
> +/*
> + * Copyright Altera Corporation (C) 2014. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <linux/clk-provider.h>
> +#include <linux/genalloc.h>
> +#include <linux/of_platform.h>
> +
> +#include "ocram.h"
> +
> +void socfpga_init_ocram_ecc(void)
> +{
> +	struct device_node *np;
> +	const __be32 *prop;
> +	u32 ocr_edac_addr, iram_addr, len;
> +	void __iomem  *mapped_ocr_edac_addr;
> +	size_t size;
> +	struct gen_pool *gp;
> +
> +	np = of_find_compatible_node(NULL, NULL, "altr,ocram-edac");
> +	if (!np) {
> +		pr_err("SOCFPGA: Unable to find altr,ocram-edac in dtb\n");
> +		return;
> +	}
> +
> +	prop = of_get_property(np, "reg", &size);
> +	ocr_edac_addr = be32_to_cpup(prop++);
> +	len = be32_to_cpup(prop);
> +	if (!prop || size < sizeof(*prop)) {
> +		pr_err("SOCFPGA: Unable to find OCRAM ECC mapping in dtb\n");
> +		return;
> +	}
> +
> +	gp = of_get_named_gen_pool(np, "iram", 0);
> +	if (!gp) {
> +		pr_err("SOCFPGA: OCRAM cannot find gen pool\n");
> +		return;
> +	}
> +
> +	np = of_find_compatible_node(NULL, NULL, "mmio-sram");
> +	if (!np) {
> +		pr_err("SOCFPGA: Unable to find mmio-sram in dtb\n");
> +		return;
> +	}
> +	/* Determine the OCRAM address and size */
> +	prop = of_get_property(np, "reg", &size);
> +	iram_addr = be32_to_cpup(prop++);
> +	len = be32_to_cpup(prop);
> +
> +	if (!prop || size < sizeof(*prop)) {
> +		pr_err("SOCFPGA: Unable to find OCRAM mapping in dtb\n");
> +		return;
> +	}
> +
> +	iram_addr = gen_pool_alloc(gp, len);
> +	if (iram_addr == 0) {
> +		pr_err("SOCFPGA: cannot alloc from gen pool\n");
> +		return;
> +	}
> +
> +	memset((void *)iram_addr, 0, len);
> +
> +	mapped_ocr_edac_addr = ioremap(ocr_edac_addr, 4);
> +
> +	gen_pool_free(gp, iram_addr, len);
> +
> +	/* Clear any pending OCRAM ECC interrupts, then enable ECC */
> +	writel(0x18, mapped_ocr_edac_addr);
> +	writel(0x19, mapped_ocr_edac_addr);
> +
> +	pr_debug("SOCFPGA: Success Initializing OCRAM\n");
> +}
> +
> diff --git a/arch/arm/mach-socfpga/ocram.h b/arch/arm/mach-socfpga/ocram.h
> new file mode 100644
> index 0000000..f93cf84
> --- /dev/null
> +++ b/arch/arm/mach-socfpga/ocram.h
> @@ -0,0 +1,28 @@
> +/*
> + * Copyright Altera Corporation (C) 2014. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef MACH_SOCFPGA_OCRAM_H
> +#define MACH_SOCFPGA_OCRAM_H
> +
> +#ifdef CONFIG_EDAC_ALTERA_OCRAM
> +void socfpga_init_ocram_ecc(void);
> +#else
> +inline void socfpga_init_ocram_ecc(void)
> +{
> +}
> +#endif
> +
> +#endif /* #ifndef MACH_SOCFPGA_OCRAM_H */
> diff --git a/arch/arm/mach-socfpga/socfpga.c b/arch/arm/mach-socfpga/socfpga.c
> index adbf383..fb41aca 100644
> --- a/arch/arm/mach-socfpga/socfpga.c
> +++ b/arch/arm/mach-socfpga/socfpga.c
> @@ -1,5 +1,5 @@
>  /*
> - *  Copyright (C) 2012 Altera Corporation
> + *  Copyright (C) 2012;2014 Altera Corporation
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License as published by
> @@ -25,6 +25,8 @@
>  #include <asm/mach/map.h>
>  
>  #include "core.h"
> +#include "l2_cache.h"
> +#include "ocram.h"
>  
>  void __iomem *socfpga_scu_base_addr = ((void __iomem *)(SOCFPGA_SCU_VIRT_BASE));
>  void __iomem *sys_manager_base_addr;
> @@ -83,6 +85,7 @@ static void __init socfpga_init_irq(void)
>  {
>  	irqchip_init();
>  	socfpga_sysmgr_init();
> +	socfpga_init_l2_ecc();
>  }
>  
>  static void socfpga_cyclone5_restart(enum reboot_mode mode, const char *cmd)
> @@ -98,6 +101,13 @@ static void socfpga_cyclone5_restart(enum reboot_mode mode, const char *cmd)
>  	writel(temp, rst_manager_base_addr + SOCFPGA_RSTMGR_CTRL);
>  }
>  
> +static void __init socfpga_cyclone5_init(void)
> +{
> +	of_platform_populate(NULL, of_default_bus_match_table,
> +			     NULL, NULL);

Why is this needed?

Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
