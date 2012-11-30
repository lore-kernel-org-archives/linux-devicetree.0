From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH -next] of: export "allnodes" to fixx w1-gpio.c modular build
Date: Fri, 30 Nov 2012 09:54:33 +0000
Message-ID: <20121130095433.9F4743E070C@localhost>
References: <20121129174057.99da02b15426c76054d05592@canb.auug.org.au> <50B7F30C.1060105@infradead.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50B7F30C.1060105@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Rob Herring <rob.herring@calxeda.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Ville Syrjala <syrjala@sci.fi>
List-Id: devicetree@vger.kernel.org

On Thu, 29 Nov 2012 15:43:08 -0800, Randy Dunlap <rdunlap@infradead.org> wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix build when CONFIG_W1_MASTER_GPIO=m by exporting "allnodes".
> 
> ERROR: "allnodes" [drivers/w1/masters/w1-gpio.ko] undefined!
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Ville Syrjala <syrjala@sci.fi>
> ---
>  drivers/of/base.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20121129.orig/drivers/of/base.c
> +++ linux-next-20121129/drivers/of/base.c
> @@ -46,6 +46,7 @@ struct alias_prop {
>  static LIST_HEAD(aliases_lookup);
>  
>  struct device_node *allnodes;
> +EXPORT_SYMBOL(allnodes);

Makes sense, but I don't like exporting such a generic name. I'm picking
up the patch but renaming s/allnodes/of_allnodes/ in the process.

g.
