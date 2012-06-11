From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: export of_platform_populate()
Date: Mon, 11 Jun 2012 09:26:56 -0500
Message-ID: <4FD60030.8090700@gmail.com>
References: <1339113456-27089-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1339113456-27089-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/07/2012 06:57 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Without this, modules can't use this API, leading to build failures.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---

Applied for 3.5.

Rob

> This is useful in 3.5.
> 
>  drivers/of/platform.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 343ad29..3132ea0 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -462,4 +462,5 @@ int of_platform_populate(struct device_node *root,
>  	of_node_put(root);
>  	return rc;
>  }
> +EXPORT_SYMBOL_GPL(of_platform_populate);
>  #endif /* CONFIG_OF_ADDRESS */
