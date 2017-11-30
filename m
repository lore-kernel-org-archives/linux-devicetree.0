From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: overlay: fix memory leak of ovcs on error exit path
Date: Thu, 30 Nov 2017 07:14:45 -0500
Message-ID: <dcb4e2a4-707b-0ccc-e12b-c6fa4ef251b7@gmail.com>
References: <20171129191750.25254-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171129191750.25254-1-colin.king@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/29/17 14:17, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if the call to of_resolve_phandles fails then then ovcs
> is not kfree'd on the error exit path.  Rather than try and make
> the clean up exit path more convoluted, fix this by just kfree'ing
> ovcs at the point of error detection and exit via the same exit
> path.
> 
> Detected by CoverityScan, CID#1462296 ("Resource Leak")
> 
> Fixes: f948d6d8b792 ("of: overlay: avoid race condition between applying multiple overlays")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/of/overlay.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 53bc9e3f0b98..6c8efe7d8cbb 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -708,8 +708,10 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
>  	of_overlay_mutex_lock();
>  
>  	ret = of_resolve_phandles(tree);
> -	if (ret)
> +	if (ret) {
> +		kfree(ovcs);
>  		goto err_overlay_unlock;
> +	}
>  
>  	mutex_lock(&of_mutex);
>  
> 

False coverity warning.  ovcs is freed in free_overlay_changeset().
