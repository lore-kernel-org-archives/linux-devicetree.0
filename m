From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH] dt: add of_alias_scan and of_alias_get_id
Date: Mon, 15 Aug 2011 14:45:22 +0800
Message-ID: <20110815064521.GJ7244@S2100-06.ap.freescale.net>
References: <1313371817-5135-1-git-send-email-shawn.guo@linaro.org>
 <20110814.224341.2228974983062837890.davem@davemloft.net>
 <20110815060708.GH7244@S2100-06.ap.freescale.net>
 <20110814.230529.611834234177280886.davem@davemloft.net>
 <20110815063643.GI7244@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110815063643.GI7244@S2100-06.ap.freescale.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 15, 2011 at 02:36:44PM +0800, Shawn Guo wrote:
> On Sun, Aug 14, 2011 at 11:05:29PM -0700, David Miller wrote:
> > From: Shawn Guo <shawn.guo@freescale.com>
> > Date: Mon, 15 Aug 2011 14:07:09 +0800
> > 
> > > Can you please help me a little bit more with the "other places"?
> > 
> > arch/sparc/kernel/prom*.c
> > 
> How about the following changes?  I do not even have a compiler to do
> build test for sparc.  Is it possible for me to get one from somewhere?
> 
> ---8<-----
> diff --git a/drivers/of/pdt.c b/drivers/of/pdt.c
> index 4d87b5d..124280a 100644
> --- a/drivers/of/pdt.c
> +++ b/drivers/of/pdt.c
> @@ -245,4 +245,11 @@ void __init of_pdt_build_devicetree(phandle root_node, struct of_pdt_ops *ops)
>         nextp = &allnodes->allnext;
>         allnodes->child = of_pdt_build_tree(allnodes,
>                         of_pdt_prom_ops->getchild(allnodes->phandle), &nextp);
> +
> +       /* Get pointer to "/chosen" and "/aliasas" nodes for use everywhere */
> +       of_chosen = of_find_node_by_path("/chosen");
> +       if (of_chosen == NULL)
> +               of_chosen = of_find_node_by_path("/chosen@0");
> +       of_aliases = of_find_node_by_path("/aliases");
> +       of_alias_scan(dt_alloc);

dt_alloc here needs to be some wrapper function of prom_early_alloc().

>  }

-- 
Regards,
Shawn
