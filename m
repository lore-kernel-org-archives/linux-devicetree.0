From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drivers: of: check input parameter name for
 __of_find_property
Date: Tue, 15 Sep 2015 10:56:28 -0500
Message-ID: <55F83FAC.5080002@kernel.org>
References: <1441979043-19694-1-git-send-email-van.freenix@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441979043-19694-1-git-send-email-van.freenix@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <van.freenix@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On 09/11/2015 08:44 AM, Peng Fan wrote:
> Check input parameter 'name' for __of_find_property. If name is NULL,
> of_prop_cmp->strcasecmp may trigger panic.

Arguably that could be a feature. Do you have a usecase where name being
NULL is valid and panicking is a problem?

Rob

> 
> Signed-off-by: Peng Fan <van.freenix@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Grant Likely <grant.likely@linaro.org>
> ---
>  drivers/of/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 8b5a187..e41436d 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -215,7 +215,7 @@ static struct property *__of_find_property(const struct device_node *np,
>  {
>  	struct property *pp;
>  
> -	if (!np)
> +	if (!np || !name)
>  		return NULL;
>  
>  	for (pp = np->properties; pp; pp = pp->next) {
> 
