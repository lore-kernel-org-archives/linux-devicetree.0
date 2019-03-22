From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: use correct function prototype for
 of_overlay_fdt_apply()
Date: Thu, 21 Mar 2019 18:37:34 -0700
Message-ID: <57043d9a-97d0-1d12-4542-8755d5ef998d@gmail.com>
References: <20190322002342.24831-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322002342.24831-1-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, robh+dt@kernel.org
Cc: Hamish Martin <hamish.martin@alliedtelesis.co.nz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 3/21/19 5:23 PM, Chris Packham wrote:
> When CONFIG_OF_OVERLAY is not enabled the fallback stub for
> of_overlay_fdt_apply() does not match the prototype for the case when
> CONFIG_OF_OVERLAY is enabled. Update the stub to use the correct
> function prototype.
> 
> Fixes: commit 39a751a4cb7e ("of: change overlay apply input data from unflattened to FDT")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  include/linux/of.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index e240992e5cb6..28797e1a9982 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1449,7 +1449,8 @@ int of_overlay_notifier_unregister(struct notifier_block *nb);
>  
>  #else
>  
> -static inline int of_overlay_fdt_apply(void *overlay_fdt, int *ovcs_id)
> +static inline int of_overlay_fdt_apply(void *overlay_fdt, u32 overlay_fdt_size,
> +				       int *ovcs_id)
>  {
>  	return -ENOTSUPP;
>  }
> 

Thanks!

Reviewed-by: Frank Rowand <frank.rowand@sony.com>
