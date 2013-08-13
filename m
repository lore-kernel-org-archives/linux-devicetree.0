Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:32847 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755934Ab3HMJJH (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Tue, 13 Aug 2013 05:09:07 -0400
Date: Tue, 13 Aug 2013 10:08:51 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V5 4/6] of: call __of_parse_phandle_with_args from
 of_parse_phandle
Message-ID: <20130813090851.GG27165@e106331-lin.cambridge.arm.com>
References: <1376328992-3115-1-git-send-email-swarren@wwwdotorg.org>
 <1376328992-3115-4-git-send-email-swarren@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376328992-3115-4-git-send-email-swarren@wwwdotorg.org>
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Aug 12, 2013 at 06:36:30PM +0100, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> The simplest case of __of_parse_phandle_with_args() implements
> of_parse_phandle(), except that it doesn't return the node referenced by
> the phandle. Modify it to do so, and then rewrite of_parse_phandle() to
> call __of_parse_phandle_with_args() rather than open-coding the simple
> case.

That commit message doesn't seem to match the patch (which doesn't
modify __of_parse_phandle_with_args).

Rather, now that __of_parse_phandle_with_args can handle parsing with a
fixed number of argument cells, it's possible to write of_parse_phandle
in terms of it.

What's the overhead over the old of_parse_phandle? It looks like this is
going to do a lot of pointless work beyond what it already does --
parsing each prior entry in the list, and for each prior entry walking
the tree in of_find_node_by_phandle. Maybe we don't use long enough
phandle lists anywhere for that to be noticeable.

Thanks,
Mark.

> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> v5: New patch.
> ---
>  drivers/of/base.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 2f92522..79ed82c 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1202,14 +1202,16 @@ static int __of_parse_phandle_with_args(const struct device_node *np,
>  struct device_node *of_parse_phandle(const struct device_node *np,
>  				     const char *phandle_name, int index)
>  {
> -	const __be32 *phandle;
> -	int size;
> +	struct of_phandle_args args;
>  
> -	phandle = of_get_property(np, phandle_name, &size);
> -	if ((!phandle) || (size < sizeof(*phandle) * (index + 1)))
> +	if (index < 0)
> +		return NULL;
> +
> +	if (__of_parse_phandle_with_args(np, phandle_name, NULL, 0,
> +					 index, &args))
>  		return NULL;
>  
> -	return of_find_node_by_phandle(be32_to_cpup(phandle + index));
> +	return args.np;
>  }
>  EXPORT_SYMBOL(of_parse_phandle);
>  
> -- 
> 1.8.1.5
> 
> 
