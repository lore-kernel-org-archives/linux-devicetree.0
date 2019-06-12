From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH next] of/fdt: Fix defined but not used compiler warning
Date: Wed, 12 Jun 2019 09:45:15 -0700
Message-ID: <0702fa2d-1952-e9fc-8e17-a93f3b90a958@gmail.com>
References: <20190612010011.90185-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612010011.90185-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kefeng Wang <wangkefeng.wang@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Kefeng,

If Rob agrees, I'd like to see one more change in this patch.

Since the only caller of of_fdt_match() is of_flat_dt_match(),
can you move the body of of_fdt_match() into  of_flat_dt_match()
and eliminate of_fdt_match()?

(Noting that of_flat_dt_match() consists only of the call to
of_fdt_match().)

-Frank


On 6/11/19 6:00 PM, Kefeng Wang wrote:
> When CONFIG_OF_EARLY_FLATTREE is disabled, there is a compiler warning,
> 
> drivers/of/fdt.c:129:19: warning: ‘of_fdt_match’ defined but not used [-Wunused-function]
>  static int __init of_fdt_match(const void *blob, unsigned long node,
> 
> Move of_fdt_match() and of_fdt_is_compatible() under CONFIG_OF_EARLY_FLATTREE
> to fix it.
> 
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  drivers/of/fdt.c | 106 +++++++++++++++++++++++------------------------
>  1 file changed, 53 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 3d36b5afd9bd..d6afd5b22940 100644
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
> -static int __init of_fdt_match(const void *blob, unsigned long node,> -			       const char *const *compat)
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
> @@ -764,6 +711,59 @@ const void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
>  	return fdt_getprop(initial_boot_params, node, name, size);
>  }
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
>   * of_flat_dt_is_compatible - Return true if given node has compat in compatible list
>   * @node: node to test
> 
