From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: unittest: Remove redundant OF_DETACHED flag setting
Date: Fri, 13 Oct 2017 15:12:15 -0700
Message-ID: <59E13A3F.5070509@gmail.com>
References: <20171013074451.14176-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171013074451.14176-1-stephen.boyd@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/13/17 00:44, Stephen Boyd wrote:
> of_fdt_unflatten_tree() already sets the flag on the node to
> OF_DETACHED, because of_fdt_unflatten_tree() calls
> __unflatten_device_tree() with the detached bool set to true.
> 
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---
>  drivers/of/unittest.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 35bf9617ae59..8795478a4754 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -1112,7 +1112,6 @@ static int __init unittest_data_add(void)
>  		pr_warn("%s: No tree to attach; not running tests\n", __func__);
>  		return -ENODATA;
>  	}
> -	of_node_set_flag(unittest_data_node, OF_DETACHED);
>  	rc = of_resolve_phandles(unittest_data_node);
>  	if (rc) {
>  		pr_err("%s: Failed to resolve phandles (rc=%i)\n", __func__, rc);
> @@ -2262,7 +2261,6 @@ static int __init overlay_data_add(int onum)
>  		ret = 0;
>  		goto out_free_data;
>  	}
> -	of_node_set_flag(info->np_overlay, OF_DETACHED);
>  
>  	ret = of_resolve_phandles(info->np_overlay);
>  	if (ret) {
> 

Reviewed-by: Frank Rowand <frowand.list@gmail.com>

Should be no conflict with  my patch series "[PATCH 00/12] of: overlay: clean up
device tree overlay code" [1], just a line offset.

[1] https://lkml.org/lkml/2017/10/2/679
