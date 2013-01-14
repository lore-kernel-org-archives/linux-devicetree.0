From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] OF: Link platform device resources properly.
Date: Mon, 14 Jan 2013 08:57:13 -0600
Message-ID: <50F41CC9.1000105@gmail.com>
References: <1357252284-5990-1-git-send-email-panto@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1357252284-5990-1-git-send-email-panto@antoniou-consulting.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Matt Porter <mporter@ti.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Russ Dill <Russ.Dill@ti.com>
List-Id: devicetree@vger.kernel.org

On 01/03/2013 04:31 PM, Pantelis Antoniou wrote:
> The resources of the platform devices created by the OF core were
> not properly linked. Make sure that they are, so that we don't get
> any crashes when trying to remove the device.
> 
> Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
> ---
>  drivers/of/device.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 4c74e4f..d75fcaf 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -62,6 +62,9 @@ int of_device_add(struct platform_device *ofdev)
>  	if (!ofdev->dev.parent)
>  		set_dev_node(&ofdev->dev, of_node_to_nid(ofdev->dev.of_node));
>  
> +	/* make sure we add the resources to the appropriate lists */
> +	platform_device_link_resources(ofdev);
> +

Submit this with the patch that adds this function or state the
dependency please.

Rob

>  	return device_add(&ofdev->dev);
>  }
>  
> 
