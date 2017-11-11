From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] of: Document exactly what of_find_node_by_name() puts
Date: Fri, 10 Nov 2017 18:12:44 -0800
Message-ID: <0ef4b415-801c-cb58-5de1-01bcfba1c778@infradead.org>
References: <20171111014536.3592-1-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20171111014536.3592-1-sboyd@codeaurora.org>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/10/2017 05:45 PM, Stephen Boyd wrote:
> It isn't clear if this function of_node_put()s the 'from'
> argument, or the node it finds in the search. Clearly indicate
> which variable is touched.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/of/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 63897531cd75..602c5d65734a 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -866,7 +866,7 @@ EXPORT_SYMBOL(of_find_node_opts_by_path);>   *	@from:	The node to start searching from or NULL, the node

    *	@from:	The node to start searching from or %NULL; the node

>   *		you pass will not be searched, only the next one
>   *		will; typically, you pass what the previous call

    *		will. Typically, you pass what the previous call

> - *		returned. of_node_put() will be called on it
> + *		returned. of_node_put() will be called on @from.
>   *	@name:	The name string to match against
>   *
>   *	Returns a node pointer with refcount incremented, use
> 


-- 
~Randy
