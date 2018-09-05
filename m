From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 1/3] of/fdt: Scan the root node properties earlier
Date: Tue, 4 Sep 2018 18:49:47 -0700
Message-ID: <b86ed9cf-d5fd-09fb-eb82-0143c759f5cf@gmail.com>
References: <20180830190523.31474-1-robh@kernel.org>
 <20180830190523.31474-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830190523.31474-2-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/30/18 12:05, Rob Herring wrote:
> Scan the root node properties (#{size,address}-cells) earlier, 

                                                        ^^^^^^^
                             before mdesc->dt_fixup() is called

> so that
> the dt_root_addr_cells and dt_root_size_cells variables are initialized
> and can be used.
                 by mdesc->dt_fixup()
> 
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/of/fdt.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
Moving early_init_dt_scan_root() to inside early_init_dt_verify()
puts something that has nothing to do with verifying the fdt
into a function whose purpose is the verify.  It hides the side
effect of initializing the dt_root_addr_cells and dt_root_size_cells
variables.

I suggest creating a new function early_init_dt_scan_init_pre_dt_fixup(),
move the chunk of code there instead of to early_init_dt_scan_nodes(),
and call the new function from setup_machine_fdt(), just before
calling  mdesc->dt_fixup().  This would be a little bit more code,
but more clearly showing the intent.

-Frank

> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 800ad252cf9c..49abe18f1bde 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1215,6 +1215,10 @@ bool __init early_init_dt_verify(void *params)
>  	initial_boot_params = params;
>  	of_fdt_crc32 = crc32_be(~0, initial_boot_params,
>  				fdt_totalsize(initial_boot_params));
> +
> +	/* Initialize {size,address}-cells info */
> +	of_scan_flat_dt(early_init_dt_scan_root, NULL);
> +
>  	return true;
>  }
>  
> @@ -1224,9 +1228,6 @@ void __init early_init_dt_scan_nodes(void)
>  	/* Retrieve various information from the /chosen node */
>  	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
>  
> -	/* Initialize {size,address}-cells info */
> -	of_scan_flat_dt(early_init_dt_scan_root, NULL);
> -
>  	/* Setup memory, calling early_init_dt_add_memory_arch */
>  	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
>  }
> 
