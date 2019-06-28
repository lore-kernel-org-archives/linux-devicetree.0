From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v6 2/3] fdt: add support for rng-seed
Date: Fri, 28 Jun 2019 10:35:30 +0100
Message-ID: <20190628093529.GB36437@lakrids.cambridge.arm.com>
References: <20190612043258.166048-1-hsinyi@chromium.org>
 <20190612043258.166048-3-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190612043258.166048-3-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2019 at 12:33:00PM +0800, Hsin-Yi Wang wrote:
> Introducing a chosen node, rng-seed, which is an entropy that can be
> passed to kernel called very early to increase initial device
> randomness. Bootloader should provide this entropy and the value is
> read from /chosen/rng-seed in DT.

Could you please elaborate on this?

* What is this initial entropy used by, and why is this important? I
  assume that devices which can populate this will have a HW RNG that
  the kernel will eventually make use of.

* How much entropy is necessary or sufficient?

* Why is the DT the right mechanism for this?

Thanks,
Mark.

> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> change log v5->v6:
> * remove Documentation change
> ---
>  drivers/of/fdt.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 3d36b5afd9bd..369130dbd42c 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -24,6 +24,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/serial_core.h>
>  #include <linux/sysfs.h>
> +#include <linux/random.h>
>  
>  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
>  #include <asm/page.h>
> @@ -1052,6 +1053,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  {
>  	int l;
>  	const char *p;
> +	const void *rng_seed;
>  
>  	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
>  
> @@ -1086,6 +1088,14 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  
>  	pr_debug("Command line is: %s\n", (char*)data);
>  
> +	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
> +	if (rng_seed && l > 0) {
> +		add_device_randomness(rng_seed, l);
> +
> +		/* try to clear seed so it won't be found. */
> +		fdt_nop_property(initial_boot_params, node, "rng-seed");
> +	}
> +
>  	/* break now */
>  	return 1;
>  }
> -- 
> 2.20.1
> 
