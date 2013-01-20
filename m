From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: dma.c: fix memory leakage
Date: Sun, 20 Jan 2013 16:24:49 -0600
Message-ID: <50FC6EB1.4050704@gmail.com>
References: <1358600805-20193-1-git-send-email-dinggnu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1358600805-20193-1-git-send-email-dinggnu@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cong Ding <dinggnu@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/19/2013 07:06 AM, Cong Ding wrote:
> The memory allocated to ofdma might be a leakage when error occurs.
> 
> Signed-off-by: Cong Ding <dinggnu@gmail.com>

You need to send this to whomever is working on DMA bindings.

Rob

> ---
>  drivers/of/dma.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/of/dma.c b/drivers/of/dma.c
> index 59631b2..583e50e3 100644
> --- a/drivers/of/dma.c
> +++ b/drivers/of/dma.c
> @@ -107,6 +107,7 @@ int of_dma_controller_register(struct device_node *np,
>  	if (!nbcells) {
>  		pr_err("%s: #dma-cells property is missing or invalid\n",
>  		       __func__);
> +		kfree(ofdma);
>  		return -EINVAL;
>  	}
>  
> 
