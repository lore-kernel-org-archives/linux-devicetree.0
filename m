From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH] dt: add of_alias_scan and of_alias_get_id
Date: Mon, 15 Aug 2011 14:47:20 +0800
Message-ID: <20110815064719.GK7244@S2100-06.ap.freescale.net>
References: <20110815060708.GH7244@S2100-06.ap.freescale.net>
 <20110814.230529.611834234177280886.davem@davemloft.net>
 <20110815063643.GI7244@S2100-06.ap.freescale.net>
 <20110814.233559.1395275660949133114.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110814.233559.1395275660949133114.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: shawn.guo@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Sun, Aug 14, 2011 at 11:35:59PM -0700, David Miller wrote:
> From: Shawn Guo <shawn.guo@freescale.com>
> Date: Mon, 15 Aug 2011 14:36:44 +0800
> 
> > @@ -245,4 +245,11 @@ void __init of_pdt_build_devicetree(phandle root_node, struct of_pdt_ops *ops)
> >         nextp = &allnodes->allnext;
> >         allnodes->child = of_pdt_build_tree(allnodes,
> >                         of_pdt_prom_ops->getchild(allnodes->phandle), &nextp);
> > +
> > +       /* Get pointer to "/chosen" and "/aliasas" nodes for use everywhere */
> > +       of_chosen = of_find_node_by_path("/chosen");
> > +       if (of_chosen == NULL)
> > +               of_chosen = of_find_node_by_path("/chosen@0");
> > +       of_aliases = of_find_node_by_path("/aliases");
> > +       of_alias_scan(dt_alloc);
> >  }
> 
> There is no dt_alloc variable visible in this function.
> 
> I didn't need to use a compiler to find this problem, and neither
> do you.
> 
I should have found that before sending it even for comment.  Yeah,
you beat me to that!

-- 
Regards,
Shawn
