From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v4 3/6] of: release node fix for of_parse_phandle_with_args
Date: Fri, 25 May 2012 18:09:57 -0600
Message-ID: <20120526000957.ED6BD3E13EF@localhost>
References: <1337952980-14621-1-git-send-email-b29396@freescale.com> <1337952980-14621-3-git-send-email-b29396@freescale.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1337952980-14621-3-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, b29396@freescale.com
List-Id: devicetree@vger.kernel.org

On Fri, 25 May 2012 21:36:17 +0800, Dong Aisheng <b29396@freescale.com> wrote:
> From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> Since this API requires user to call of_node_put for the node
> it returned via outargs, if no outargs provided, user have no
> chance to release it, so release it internally if no outargs
> provided.
> 
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>

Applied, thanks.

g.

> ---
>  drivers/of/base.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d9bfd49..91c1fb4 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -961,6 +961,8 @@ int of_parse_phandle_with_args(struct device_node *np, const char *list_name,
>  				out_args->args_count = count;
>  				for (i = 0; i < count; i++)
>  					out_args->args[i] = be32_to_cpup(list++);
> +			} else {
> +				of_node_put(node);
>  			}
>  			return 0;
>  		}
> -- 
> 1.7.0.4
> 
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
