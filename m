From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of/fdt: hide of_ftd_match() if unused
Date: Mon, 17 Jun 2019 11:56:09 -0700
Message-ID: <5dfc29c0-0b42-16d9-b850-2cba8938d908@gmail.com>
References: <20190617123840.911593-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617123840.911593-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Thanks for catching this.

The bad news is that you are second in line, Kefeng Wang sent a patch to
do the same last week.

Thanks!

-Frank


On 6/17/19 5:38 AM, Arnd Bergmann wrote:
> The only caller of this function is built conditionally:
> 
> drivers/of/fdt.c:129:19: error: 'of_fdt_match' defined but not used [-Werror=unused-function]
> 
> Move the definition into the same #ifdef block.
> 
> Fixes: 9b4d2b635bd0 ("of/fdt: Remove dead code and mark functions with __init")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/of/fdt.c | 106 +++++++++++++++++++++++------------------------
>  1 file changed, 53 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 3d36b5afd9bd..424981786c79 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -78,38 +78,6 @@ void __init of_fdt_limit_memory(int limit)
>  	}
>  }
>  
> -/**
> - * of_fdt_is_compatible - Return true if given node from the given blob has
> - * compat in its compatible list
> - * @blob: A device tree blob
> - * @node: node to test
> - * @compat: compatible string to compare with compatible list.
> - *
> - * On match, returns a non-zero value with smaller values returned for more
> - * specific compatible values.
> - */
> -static int of_fdt_is_compatible(const void *blob,
> -		      unsigned long node, const char *compat)
> -{
> -	const char *cp;
> -	int cplen;
> -	unsigned long l, score = 0;
> -
> -	cp = fdt_getprop(blob, node, "compatible", &cplen);
> -	if (cp == NULL)
> -		return 0;
> -	while (cplen > 0) {
> -		score++;
> -		if (of_compat_cmp(cp, compat, strlen(compat)) == 0)
> -			return score;
> -		l = strlen(cp) + 1;
> -		cp += l;
> -		cplen -= l;
> -	}
> -
> -	return 0;
> -}
> -
>  static bool of_fdt_device_is_available(const void *blob, unsigned long node)
>  {
>  	const char *status = fdt_getprop(blob, node, "status", NULL);
> @@ -123,27 +91,6 @@ static bool of_fdt_device_is_available(const void *blob, unsigned long node)
>  	return false;
>  }
>  
> -/**
> - * of_fdt_match - Return true if node matches a list of compatible values
> - */
> -static int __init of_fdt_match(const void *blob, unsigned long node,
> -			       const char *const *compat)
> -{
> -	unsigned int tmp, score = 0;
> -
> -	if (!compat)
> -		return 0;
> -
> -	while (*compat) {
> -		tmp = of_fdt_is_compatible(blob, node, *compat);
> -		if (tmp && (score == 0 || (tmp < score)))
> -			score = tmp;
> -		compat++;
> -	}
> -
> -	return score;
> -}
> -
>  static void *unflatten_dt_alloc(void **mem, unsigned long size,
>  				       unsigned long align)
>  {
> @@ -522,6 +469,59 @@ void *initial_boot_params __ro_after_init;
>  
>  static u32 of_fdt_crc32;
>  
> +/**
> + * of_fdt_is_compatible - Return true if given node from the given blob has
> + * compat in its compatible list
> + * @blob: A device tree blob
> + * @node: node to test
> + * @compat: compatible string to compare with compatible list.
> + *
> + * On match, returns a non-zero value with smaller values returned for more
> + * specific compatible values.
> + */
> +static int of_fdt_is_compatible(const void *blob,
> +		      unsigned long node, const char *compat)
> +{
> +	const char *cp;
> +	int cplen;
> +	unsigned long l, score = 0;
> +
> +	cp = fdt_getprop(blob, node, "compatible", &cplen);
> +	if (cp == NULL)
> +		return 0;
> +	while (cplen > 0) {
> +		score++;
> +		if (of_compat_cmp(cp, compat, strlen(compat)) == 0)
> +			return score;
> +		l = strlen(cp) + 1;
> +		cp += l;
> +		cplen -= l;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * of_fdt_match - Return true if node matches a list of compatible values
> + */
> +static int __init of_fdt_match(const void *blob, unsigned long node,
> +			       const char *const *compat)
> +{
> +	unsigned int tmp, score = 0;
> +
> +	if (!compat)
> +		return 0;
> +
> +	while (*compat) {
> +		tmp = of_fdt_is_compatible(blob, node, *compat);
> +		if (tmp && (score == 0 || (tmp < score)))
> +			score = tmp;
> +		compat++;
> +	}
> +
> +	return score;
> +}
> +
>  /**
>   * res_mem_reserve_reg() - reserve all memory described in 'reg' property
>   */
> 
