From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCHv6 2/5] arm: socfpga: Enable OCRAM ECC on startup.
Date: Fri, 6 Feb 2015 18:45:44 +0000
Message-ID: <20150206184544.GC10324@leverpostej>
References: <1420772036-3112-1-git-send-email-tthayer@opensource.altera.com>
 <1420772036-3112-3-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1420772036-3112-3-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: "tthayer@opensource.altera.com" <tthayer@opensource.altera.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "dougthompson@xmission.com" <dougthompson@xmission.com>, "m.chehab@samsung.com" <m.chehab@samsung.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tthayer.linux@gmail.com" <tthayer.linux@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 09, 2015 at 02:53:53AM +0000, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> This patch enables the ECC for On-Chip RAM on machine
> startup.  The ECC has to be enabled before data is
> is stored in memory otherwise the ECC will fail on
> reads.

Where else is this OCRAM used?

If we need the ECC to be enabled before use, a module_init call that
seems to be unrelated to any other usage doesn't seem right to me.
Hopefully I've just misunderstood something here.

> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
> v2: Split OCRAM ECC portion separately. Addition of iounmap()
>     and reorganization of gen_pool_free. Remove defconfig from patch.
> 
> v3/4: No change
> 
> v5: Remove ocram.h, use io.h instead of clk-provider.h
>     Check prop in correct place. Add ECC EN defines.
> 
> v6: Implement OCRAM discovery changes from community. Add
>     of_node_put(). Remove be32_to_cpup(). Use __init() which
>     allows removal of .init_machine(). Update year in header.
> ---
>  arch/arm/mach-socfpga/Makefile |    1 +
>  arch/arm/mach-socfpga/ocram.c  |   97 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 arch/arm/mach-socfpga/ocram.c
> 
> diff --git a/arch/arm/mach-socfpga/Makefile b/arch/arm/mach-socfpga/Makefile
> index 142609e..1552ca5 100644
> --- a/arch/arm/mach-socfpga/Makefile
> +++ b/arch/arm/mach-socfpga/Makefile
> @@ -5,3 +5,4 @@
>  obj-y					:= socfpga.o
>  obj-$(CONFIG_SMP)	+= headsmp.o platsmp.o
>  obj-$(CONFIG_EDAC_ALTERA_L2C) += l2_cache.o
> +obj-$(CONFIG_EDAC_ALTERA_OCRAM) += ocram.o
> diff --git a/arch/arm/mach-socfpga/ocram.c b/arch/arm/mach-socfpga/ocram.c
> new file mode 100644
> index 0000000..1f12a38
> --- /dev/null
> +++ b/arch/arm/mach-socfpga/ocram.c
> @@ -0,0 +1,97 @@
> +/*
> + * Copyright Altera Corporation (C) 2015. All rights reserved.
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
> +#include <linux/io.h>
> +#include <linux/genalloc.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +
> +#define ALTR_OCRAM_CLEAR_ECC          0x00000018
> +#define ALTR_OCRAM_ECC_EN             0x00000019
> +
> +static int __init socfpga_init_ocram_ecc(void)
> +{
> +	struct device_node *np;
> +	struct resource    res;
> +	u32                iram_addr;
> +	void __iomem       *mapped_ocr_edac_addr;
> +	resource_size_t    size;
> +	struct gen_pool    *gp;
> +	int                ret;
> +
> +	/* Get the size of the on-chip RAM */
> +	np = of_find_compatible_node(NULL, NULL, "mmio-sram");
> +	if (!np) {
> +		pr_err("%s: Unable to find mmio-sram in dtb\n", __func__);
> +		return -ENODEV;
> +	}
> +
> +	ret = of_address_to_resource(np, 0, &res);
> +	if (ret) {
> +		of_node_put(np);
> +		pr_err("%s: Problem getting SRAM address in dtb\n", __func__);
> +		return -ENODEV;
> +	}
> +	size = resource_size(&res);
> +	of_node_put(np);
> +
> +	/* Find the OCRAM EDAC device tree node */
> +	np = of_find_compatible_node(NULL, NULL, "altr,ocram-edac");
> +	if (!np) {
> +		pr_err("%s: Unable to find altr,ocram-edac\n", __func__);
> +		return -ENODEV;
> +	}
> +
> +	mapped_ocr_edac_addr = of_iomap(np, 0);
> +	if (!mapped_ocr_edac_addr) {
> +		of_node_put(np);
> +		pr_err("%s: Unable to map OCRAM ecc regs.\n", __func__);
> +		return -ENODEV;
> +	}
> +
> +	gp = of_get_named_gen_pool(np, "iram", 0);
> +	if (!gp) {
> +		of_node_put(np);
> +		pr_err("%s: OCRAM cannot find gen pool\n", __func__);
> +		return -ENODEV;
> +	}
> +	of_node_put(np);
> +
> +	iram_addr = gen_pool_alloc(gp, size / sizeof(size_t));

Why divide by sizeof(size_t) here? As far as I am aware, resource_size
gives you a size in bytes...

> +	if (iram_addr == 0) {
> +		pr_err("%s: cannot alloc from gen pool\n", __func__);
> +		return -ENODEV;
> +	}
> +
> +	/* Clear any pending OCRAM ECC interrupts, then enable ECC */
> +	writel(ALTR_OCRAM_CLEAR_ECC, mapped_ocr_edac_addr);
> +	writel(ALTR_OCRAM_ECC_EN, mapped_ocr_edac_addr);
> +
> +	memset((void *)iram_addr, 0, size);

...and here we write size bytes, not (size / sizeof(size_t)) bytes, so
we're poking memory we weren't allocated.

How is this memory mapped exactly? Is memset safe?

Thanks,
Mark.

> +
> +	gen_pool_free(gp, iram_addr, size / sizeof(size_t));
> +
> +	iounmap(mapped_ocr_edac_addr);
> +
> +	return 0;
> +}
> +
> +static void __exit socfpga_exit_ocram_ecc(void)
> +{
> +}
> +
> +module_init(socfpga_init_ocram_ecc);
> +module_exit(socfpga_exit_ocram_ecc);
> -- 
> 1.7.9.5
> 
> 
