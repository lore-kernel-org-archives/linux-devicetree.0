From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH] mux: Convert to using %pOF instead of full_name
Date: Mon, 31 Jul 2017 11:12:01 +0200
Message-ID: <334b45ae-b4a6-12a8-66cd-6aadba07de2c@axentia.se>
References: <20170718214339.7774-38-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170718214339.7774-38-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Works for me. I'll pass it on with the following subject nit fixed:

s/mux: Convert/mux: convert/

Cheers,
Peter

On 2017-07-18 23:43, Rob Herring wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> ---
>  drivers/mux/mux-core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mux/mux-core.c b/drivers/mux/mux-core.c
> index 90b8995f07cb..bef3fe1df670 100644
> --- a/drivers/mux/mux-core.c
> +++ b/drivers/mux/mux-core.c
> @@ -452,8 +452,8 @@ struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
>  					 "mux-controls", "#mux-control-cells",
>  					 index, &args);
>  	if (ret) {
> -		dev_err(dev, "%s: failed to get mux-control %s(%i)\n",
> -			np->full_name, mux_name ?: "", index);
> +		dev_err(dev, "%pOF: failed to get mux-control %s(%i)\n",
> +			np, mux_name ?: "", index);
>  		return ERR_PTR(ret);
>  	}
> 
> @@ -464,8 +464,8 @@ struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
> 
>  	if (args.args_count > 1 ||
>  	    (!args.args_count && (mux_chip->controllers > 1))) {
> -		dev_err(dev, "%s: wrong #mux-control-cells for %s\n",
> -			np->full_name, args.np->full_name);
> +		dev_err(dev, "%pOF: wrong #mux-control-cells for %pOF\n",
> +			np, args.np);
>  		return ERR_PTR(-EINVAL);
>  	}
> 
> @@ -474,8 +474,8 @@ struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
>  		controller = args.args[0];
> 
>  	if (controller >= mux_chip->controllers) {
> -		dev_err(dev, "%s: bad mux controller %u specified in %s\n",
> -			np->full_name, controller, args.np->full_name);
> +		dev_err(dev, "%pOF: bad mux controller %u specified in %pOF\n",
> +			np, controller, args.np);
>  		return ERR_PTR(-EINVAL);
>  	}
> 
> --
> 2.11.0
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
