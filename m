From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of/fdt: pass early_init_dt_reserve_memory_arch() with
 bool type nomap
Date: Fri, 31 May 2019 10:03:08 -0700
Message-ID: <8ebc80b7-edab-c72a-9a6f-aab00318bd20@gmail.com>
References: <20190530103927.20952-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530103927.20952-1-yamada.masahiro@socionext.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/30/19 3:39 AM, Masahiro Yamada wrote:
> The third argument 'nomap' of early_init_dt_reserve_memory_arch() is
> bool. It is preferred to pass it with a bool type parameter.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/of/fdt.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index de893c9616a1..b165e8b3a347 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -551,7 +551,8 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
>  	phys_addr_t base, size;
>  	int len;
>  	const __be32 *prop;
> -	int nomap, first = 1;
> +	int first = 1;
> +	bool nomap;
>  
>  	prop = of_get_flat_dt_prop(node, "reg", &len);
>  	if (!prop)
> @@ -666,7 +667,7 @@ void __init early_init_fdt_scan_reserved_mem(void)
>  		fdt_get_mem_rsv(initial_boot_params, n, &base, &size);
>  		if (!size)
>  			break;
> -		early_init_dt_reserve_memory_arch(base, size, 0);
> +		early_init_dt_reserve_memory_arch(base, size, false);
>  	}
>  
>  	of_scan_flat_dt(__fdt_scan_reserved_mem, NULL);
> @@ -684,7 +685,7 @@ void __init early_init_fdt_reserve_self(void)
>  	/* Reserve the dtb region */
>  	early_init_dt_reserve_memory_arch(__pa(initial_boot_params),
>  					  fdt_totalsize(initial_boot_params),
> -					  0);
> +					  false);
>  }
>  
>  /**
> 

Reviewed-by: Frank Rowand <frank.rowand@sony.com>
