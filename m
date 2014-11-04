From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] of: Fix padding in _OF_DECLARE macro definition
Date: Tue, 04 Nov 2014 16:30:21 +0000
Message-ID: <20141104163021.21F9AC423D0@trevor.secretlab.ca>
References: <1412258470-23940-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412258470-23940-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu,  2 Oct 2014 16:01:10 +0200
, Thierry Reding <thierry.reding@gmail.com>
 wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied, thanks.

g.

> ---
>  include/linux/of.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 6c4363b8ddc3..951e9ee7d3e0 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -772,7 +772,7 @@ static inline int of_get_available_child_count(const struct device_node *np)
>  		 = { .compatible = compat,				\
>  		     .data = (fn == (fn_type)NULL) ? fn : fn  }
>  #else
> -#define _OF_DECLARE(table, name, compat, fn, fn_type)					\
> +#define _OF_DECLARE(table, name, compat, fn, fn_type)			\
>  	static const struct of_device_id __of_table_##name		\
>  		__attribute__((unused))					\
>  		 = { .compatible = compat,				\
> -- 
> 2.1.0
> 
