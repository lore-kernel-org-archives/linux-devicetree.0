From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCHv2] of: Document exactly what of_find_node_by_name() puts
Date: Fri, 17 Nov 2017 09:19:09 -0800
Message-ID: <771577e8-688e-6d5e-a32f-90bf592437d4@infradead.org>
References: <20171117165321.18591-1-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20171117165321.18591-1-sboyd@codeaurora.org>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/17/2017 08:53 AM, Stephen Boyd wrote:
> It isn't clear if this function of_node_put()s the 'from'
> argument, or the node it searches. Clearly indicate which
> variable is touched. Fold in some more fixes from Randy too
> because we're in the area.
> 
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
> 
> Changes from v1:
>  * Fold in Randy's fixes
> 
>  drivers/of/base.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 63897531cd75..4368a878df88 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -863,10 +863,10 @@ EXPORT_SYMBOL(of_find_node_opts_by_path);
>  
>  /**
>   *	of_find_node_by_name - Find a node by its "name" property
> - *	@from:	The node to start searching from or NULL, the node
> + *	@from:	The node to start searching from or NULL; the node
>   *		you pass will not be searched, only the next one
> - *		will; typically, you pass what the previous call
> - *		returned. of_node_put() will be called on it
> + *		will. Typically, you pass what the previous call
> + *		returned. of_node_put() will be called on @from.
>   *	@name:	The name string to match against
>   *
>   *	Returns a node pointer with refcount incremented, use
> 

Looks good. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


-- 
~Randy
