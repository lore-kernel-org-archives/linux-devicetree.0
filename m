From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 5/7] dt/clock: add a simple provider get function
Date: Fri, 06 Apr 2012 22:26:01 -0600
Message-ID: <20120407042601.7642C3E303C@localhost>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
 <1331680947-29861-6-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1331680947-29861-6-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 13 Mar 2012 18:22:25 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> For simple cases, the clock provider data can simply be the struct clk ptr.
> 
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/of/clock.c |   18 +++++++++++-------
>  1 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/of/clock.c b/drivers/of/clock.c
> index 06fd5ad..f4a0965 100644
> --- a/drivers/of/clock.c
> +++ b/drivers/of/clock.c
> @@ -33,6 +33,12 @@ struct of_clk_provider {
>  static LIST_HEAD(of_clk_providers);
>  static DEFINE_MUTEX(of_clk_lock);
>  
> +static struct clk *of_clk_simple_get(struct of_phandle_args *clkspec,
> +				     void *data)
> +{
> +	return data;
> +}
> +
>  /**
>   * of_clk_add_provider() - Register a clock provider for a node
>   * @np: Device node pointer associated with clock provider
> @@ -52,7 +58,10 @@ int of_clk_add_provider(struct device_node *np,
>  
>  	cp->node = of_node_get(np);
>  	cp->data = data;
> -	cp->get = clk_src_get;
> +	if (clk_src_get)
> +		cp->get = clk_src_get;
> +	else
> +		cp->get = of_clk_simple_get;

Personally, I would prefer callers to be explicit about the
translation functions they need, but it isn't a big enough concern for
me to make a big deal about it.

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

>  
>  	mutex_lock(&of_clk_lock);
>  	list_add(&cp->link, &of_clk_providers);
> @@ -183,11 +192,6 @@ void __init of_clk_init(const struct of_device_id *matches)
>  	}
>  }
>  
> -static struct clk *of_fixed_clk_get(struct of_phandle_args *a, void *data)
> -{
> -	return data;
> -}
> -
>  /**
>   * of_fixed_clk_setup() - Setup function for simple fixed rate clock
>   */
> @@ -204,5 +208,5 @@ void __init of_fixed_clk_setup(struct device_node *node)
>  
>  	clk = clk_register_fixed_rate(NULL, clk_name, NULL, CLK_IS_ROOT, rate);
>  	if (clk)
> -		of_clk_add_provider(node, of_fixed_clk_get, clk);
> +		of_clk_add_provider(node, NULL, clk);
>  }
> -- 
> 1.7.5.4
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies,Ltd.
