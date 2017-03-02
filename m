From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] nvmem: core: Allow allocating several anonymous
 nvmem devices
Date: Thu, 2 Mar 2017 21:03:51 +0100
Message-ID: <20170302210351.1f740ffc@bbrezillon>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
        <1488484223-844-4-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488484223-844-4-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu,  2 Mar 2017 20:50:23 +0100
Alban <albeu-GANU6spQydw@public.gmane.org> wrote:

> Currently the nvmem core expect the config to provide a name and ID
> that are then used to create the device name. When no device name is
> given 'nvmem' is used. However if there is several such anonymous
> devices they all get named 'nvmem0', which doesn't work.
> 
> To fix this problem use the ID from the config only when the config
> also provides a name. When no name is provided take the uinque ID of
> the nvmem device instead.
> 
> Signed-off-by: Alban <albeu-GANU6spQydw@public.gmane.org>

Reviewed-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

> ---
>  drivers/nvmem/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 408b521..8c830a8 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -468,7 +468,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>  	np = config->dev->of_node;
>  	nvmem->dev.of_node = np;
>  	dev_set_name(&nvmem->dev, "%s%d",
> -		     config->name ? : "nvmem", config->id);
> +		     config->name ? : "nvmem",
> +		     config->name ? config->id : nvmem->id);
>  
>  	nvmem->read_only = of_property_read_bool(np, "read-only") |
>  			   config->read_only;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
