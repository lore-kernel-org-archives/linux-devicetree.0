From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH] dma: of-dma: check OF pointer property before dereferencing
 it
Date: Mon, 15 Apr 2013 17:22:51 +0200
Message-ID: <516C1B4B.2070806@metafoo.de>
References: <1366015193-6627-1-git-send-email-paolo.pisati@canonical.com> <1366015193-6627-2-git-send-email-paolo.pisati@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1366015193-6627-2-git-send-email-paolo.pisati@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Pisati <paolo.pisati@canonical.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Dan Williams <djbw@fb.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 04/15/2013 10:39 AM, Paolo Pisati wrote:
> Signed-off-by: Paolo Pisati <paolo.pisati@canonical.com>

That should already be fixed in the DMA tree. See commit 7362f04c28 ("DMA:
OF: Check properties value before running be32_to_cpup() on it").

- Lars


> ---
>  drivers/dma/of-dma.c |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
> index 69d04d2..9628298 100644
> --- a/drivers/dma/of-dma.c
> +++ b/drivers/dma/of-dma.c
> @@ -91,6 +91,7 @@ int of_dma_controller_register(struct device_node *np,
>  				(struct of_phandle_args *, struct of_dma *),
>  				void *data)
>  {
> +	void 	*parent;
>  	struct of_dma	*ofdma;
>  	int		nbcells;
>  
> @@ -103,8 +104,10 @@ int of_dma_controller_register(struct device_node *np,
>  	if (!ofdma)
>  		return -ENOMEM;
>  
> -	nbcells = be32_to_cpup(of_get_property(np, "#dma-cells", NULL));
> -	if (!nbcells) {
> +	parent = of_get_property(np, "#dma-cells", NULL);
> +	if (parent)
> +		nbcells = be32_to_cpup(parent);
> +	if (!parent || !nbcells) {
>  		pr_err("%s: #dma-cells property is missing or invalid\n",
>  		       __func__);
>  		kfree(ofdma);
