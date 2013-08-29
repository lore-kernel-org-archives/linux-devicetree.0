From: Wladislav Wiebe <wladislav.kw@gmail.com>
Subject: Re: [PATCH] of/fdt: Remove duplicate memory clearing on FDT unflattening
Date: Thu, 29 Aug 2013 18:47:00 +0200
Message-ID: <521F7B04.6040200@gmail.com>
References: <1377783892-13226-1-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377783892-13226-1-git-send-email-grant.likely@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 29/08/13 15:44, Grant Likely wrote:
> Patch 9e4012752, "of: fdt: fix memory initialization for expanded DT"
> fixed incomplete clearing of memory when unflattening the device tree.
> However the code was already clearing some of the memory, it just wasn't
> doing so for all allocations. Now that the memory is cleared right at
> the point of allocation, the memset after unflatten_dt_alloc() is
> redundant. Remove it.

Acked-by: Wladislav Wiebe <wladislav.kw@gmail.com>

> 
> Signed-off-by: Grant Likely <grant.likely@linaro.org>
> Cc: Wladislav Wiebe <wladislav.kw@gmail.com>
> ---
>  drivers/of/fdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 55b028f..9d9be9617 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -202,7 +202,6 @@ static void * unflatten_dt_node(struct boot_param_header *blob,
>  				__alignof__(struct device_node));
>  	if (allnextpp) {
>  		char *fn;
> -		memset(np, 0, sizeof(*np));
>  		np->full_name = fn = ((char *)np) + sizeof(*np);
>  		if (new_format) {
>  			/* rebuild full path for new format */
> 
