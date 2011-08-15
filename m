From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH] dt: add of_alias_scan and of_alias_get_id
Date: Mon, 15 Aug 2011 14:07:09 +0800
Message-ID: <20110815060708.GH7244@S2100-06.ap.freescale.net>
References: <1313371817-5135-1-git-send-email-shawn.guo@linaro.org>
 <20110814.224341.2228974983062837890.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110814.224341.2228974983062837890.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: shawn.guo@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Sun, Aug 14, 2011 at 10:43:41PM -0700, David Miller wrote:
> From: Shawn Guo <shawn.guo@linaro.org>
> Date: Mon, 15 Aug 2011 09:30:17 +0800
> 
> >  	*allnextp = NULL;
> >  
> > +	/* Get pointer to "/chosen" and "/aliasas" nodes for use everywhere */
> > +	of_chosen = of_find_node_by_path("/chosen");
> > +	if (of_chosen == NULL)
> > +		of_chosen = of_find_node_by_path("/chosen@0");
> > +	of_aliases = of_find_node_by_path("/aliases");
> > +	of_alias_scan(dt_alloc);
> > +
> >  	pr_debug(" <- unflatten_device_tree()\n");
> >  }
> 
> You need to add invocations of the scan to other places in the
> tree that build the in-kernel device tree.

Can you please help me a little bit more with the "other places"?
I'm still pretty new to device tree beyond ARM platform.

-- 
Regards,
Shawn
