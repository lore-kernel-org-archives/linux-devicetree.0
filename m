From: Libo Chen <clbchenlibo.chen@huawei.com>
Subject: Re: [PATCH] bestcomm: no need to free when kzalloc fail
Date: Wed, 22 May 2013 12:49:17 +0800
Message-ID: <519C4E4D.1060101@huawei.com>
References: <1367743104-3448-1-git-send-email-libo.chen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1367743104-3448-1-git-send-email-libo.chen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, grant.likely@linaro.org, rob.herring@calxeda.com, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Libo Chen <libo.chen@huawei.com>, agust@denx.de, phdm@macqel.be, benh@kernel.crashing.org, Li Zefan <lizefan@huawei.com>
List-Id: devicetree@vger.kernel.org


ping...

On 2013/5/5 16:38, chenlibo.3@gmail.com wrote:
> From: Libo Chen <libo.chen@huawei.com>
> 
> There is no need to free bcom_eng if kzalloc fail
> 
> Signed-off-by: Libo Chen <libo.chen@huawei.com>
> ---
>  drivers/dma/bestcomm/bestcomm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
> index a8c2e29..300ee2d 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
> @@ -400,7 +400,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
>  		printk(KERN_ERR DRIVER_NAME ": "
>  			"Can't allocate state structure\n");
>  		rv = -ENOMEM;
> -		goto error_sramclean;
> +		goto error_kzalloc;
>  	}
>  
>  	/* Save the node */
> @@ -449,6 +449,7 @@ error_release:
>  	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
>  error_sramclean:
>  	kfree(bcom_eng);
> +error_kzalloc:
>  	bcom_sram_cleanup();
>  error_ofput:
>  	of_node_put(op->dev.of_node);
> 
