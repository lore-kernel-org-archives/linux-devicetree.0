From: Stefani Seibold <stefani@seibold.net>
Subject: Re: [PATCH] external references for device tree overlays
Date: Tue, 06 Jun 2017 21:17:44 +0200
Message-ID: <1496776664.3821.3.camel@seibold.net>
References: <1496667567-13266-1-git-send-email-stefani.seibold.ext@huawei.com>
         <1496688186.12947.10.camel@hp800z>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496688186.12947.10.camel@hp800z>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Stefani Seibold <stefani.seibold.ext@huawei.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Holm Rauchfuss <holm.rauchfuss@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

thanks for the suggestion. This feature is not very well documented. I
tried this on my rasp1 running 4.12.0-rc3 and it doesn't work. My
source is:

// rapsi example
/dts-v1/;
/plugin/;

/ {
    compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";

    fragment@0 {
        target-path = "/soc/i2s@7e203000";
        __overlay__ {
            #address-cells = <0x00000001>;
            #size-cells = <0x00000001>;
            test = "test";
            timer = <&{/soc/timer@7e0030000}>;
        };
    };
};


The resulting overlay is (decompiled with fdtdump):

/dts-v1/;
// magic:		0xd00dfeed
// totalsize:		0x19a (410)
// off_dt_struct:	0x38
// off_dt_strings:	0x148
// off_mem_rsvmap:	0x28
// version:		17
// last_comp_version:	16
// boot_cpuid_phys:	0x0
// size_dt_strings:	0x52
// size_dt_struct:	0x110

/ {
    compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
    fragment@0 {
        target-path = "/soc/i2s@7e203000";
        __overlay__ {
            #address-cells = <0x00000001>;
            #size-cells = <0x00000001>;
            test = "test";
            timer = <0xdeadbeef>;
        };
    };
    __fixups__ {
        /soc/timer@7e0030000 = "/fragment@0/__overlay__:timer:0";
    };
};

But this will not apply:

OF: resolver: overlay phandle fixup failed: -22
create_overlay: Failed to resolve tree


Anyway, the reason for my patch is that i can reference to nodes which
lacks a phandle. The phandle will be created on the fly and also
destroyed when the overlay is unloaded.

I have a real use case for this patch:

I have a BIOS on some ARM64 servers which provides broken device tree.
It also lacks some devices in this tree which needs references to other
devices which lacks a phandle.

Since the BIOSes are closed source i need a way to work arround this
problem without patching all the drivers involved to this devices.

Hope this helps to understand the reason for this patch.

- Stefani

Am Montag, den 05.06.2017, 21:43 +0300 schrieb Pantelis Antoniou:
> Hi Stefani,
> 
> On Mon, 2017-06-05 at 14:59 +0200, Stefani Seibold wrote:
> > From: Stefani Seibold <stefani@seibold.net>
> > 
> > This patch enables external references for symbols which are not
> > exported by the current device tree. For example
> > 
> > // RASPI example (only for testing)
> > /dts-v1/;
> > /plugin/;
> > 
> > / {
> >     compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
> > 
> >     fragment@0 {
> >         target-path = "/soc/i2s@7e203000";
> >         __overlay__ {
> >             #address-cells = <0x00000001>;
> >             #size-cells = <0x00000001>;
> >             test = "test";
> >             timer = <&timer>;
> >         };
> >     };
> > 
> >     __external_symbols__ {
> >         timer = "/soc/timer@7e003000";
> >     };
> > };
> > 
> 
> I understand the problem. I am just not fond of the
> __external_symbols__
> solution.
> 
> There's a facility in the DT source language that allows to declare
> pathspec labels.
> 
> The 'timer = <&timer>;' statement could be rewritten as 
> 'timer = <&{/soc/timer@7e0030000}>;'
> 
> Internally you can 'catch' that this refers to a symbol in the base
> tree
> and then do the same symbol insertion as the patch you've submitted.
> 
> The benefit to the above is that you don't introduce manually edited
> special nodes.
> 
> Regards
> 
> -- Pantelis
> 
> > The "timer" symbol is not exported by the RASPI device tree,
> > because it is
> > missing in the __symbols__ section of the device tree.
> > 
> > In case of the RASPI device tree this could be simple fixed by
> > modifing
> > the device tree source, but when the device tree is provided by a
> > closed
> > source BIOS this kind of missing symbol could not be fixed.
> > 
> > An additional benefit is to override a (possible broken) symbol
> > exported
> > by the currect live device tree.
> > 
> > The patch is based and tested on linux 4.12-rc3.
> > 
> > Signed-off-by: Stefani Seibold <stefani.seibold.ext@huawei.com>
> > Signed-off-by: Stefani Seibold <stefani@seibold.net>
> > ---
> >  drivers/of/overlay.c  | 19 +++++++++++++++++++
> >  drivers/of/resolver.c | 27 ++++++++++++++++++++++-----
> >  2 files changed, 41 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> > index 7827786718d8..de6516ea0fcd 100644
> > --- a/drivers/of/overlay.c
> > +++ b/drivers/of/overlay.c
> > @@ -50,6 +50,7 @@ struct of_overlay {
> >  	int id;
> >  	struct list_head node;
> >  	int count;
> > +	struct device_node *tree;
> >  	struct of_overlay_info *ovinfo_tab;
> >  	struct of_changeset cset;
> >  };
> > @@ -422,6 +423,8 @@ int of_overlay_create(struct device_node *tree)
> >  	/* add to the tail of the overlay list */
> >  	list_add_tail(&ov->node, &ov_list);
> >  
> > +	ov->tree = tree;
> > +
> >  	of_overlay_notify(ov, OF_OVERLAY_POST_APPLY);
> >  
> >  	mutex_unlock(&of_mutex);
> > @@ -524,6 +527,7 @@ int of_overlay_destroy(int id)
> >  {
> >  	struct of_overlay *ov;
> >  	int err;
> > +	phandle phandle;
> >  
> >  	mutex_lock(&of_mutex);
> >  
> > @@ -540,6 +544,8 @@ int of_overlay_destroy(int id)
> >  		goto out;
> >  	}
> >  
> > +	phandle = ov->tree->phandle;
> > +
> >  	of_overlay_notify(ov, OF_OVERLAY_PRE_REMOVE);
> >  	list_del(&ov->node);
> >  	__of_changeset_revert(&ov->cset);
> > @@ -549,6 +555,19 @@ int of_overlay_destroy(int id)
> >  	of_changeset_destroy(&ov->cset);
> >  	kfree(ov);
> >  
> > +	if (phandle) {
> > +		struct device_node *node;
> > +		unsigned long flags;
> > +
> > +		raw_spin_lock_irqsave(&devtree_lock, flags);
> > +		for_each_of_allnodes(node) {
> > +			if (node->phandle >= phandle)
> > +				node->phandle = 0;
> > +		}
> > +		raw_spin_unlock_irqrestore(&devtree_lock, flags);
> > +	}
> > +
> > +
> >  	err = 0;
> >  
> >  out:
> > diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
> > index 771f4844c781..31b5f32c9b27 100644
> > --- a/drivers/of/resolver.c
> > +++ b/drivers/of/resolver.c
> > @@ -286,13 +286,14 @@ static int
> > adjust_local_phandle_references(struct device_node *local_fixups,
> >  int of_resolve_phandles(struct device_node *overlay)
> >  {
> >  	struct device_node *child, *local_fixups, *refnode;
> > -	struct device_node *tree_symbols, *overlay_fixups;
> > +	struct device_node *tree_symbols, *ext_symbols,
> > *overlay_fixups;
> >  	struct property *prop;
> >  	const char *refpath;
> >  	phandle phandle, phandle_delta;
> >  	int err;
> >  
> >  	tree_symbols = NULL;
> > +	ext_symbols = NULL;
> >  
> >  	if (!overlay) {
> >  		pr_err("null overlay\n");
> > @@ -321,6 +322,9 @@ int of_resolve_phandles(struct device_node
> > *overlay)
> >  	for_each_child_of_node(overlay, child) {
> >  		if (!of_node_cmp(child->name, "__fixups__"))
> >  			overlay_fixups = child;
> > +		else
> > +		if (!of_node_cmp(child->name,
> > "__external_symbols__"))
> > +			ext_symbols = child;
> >  	}
> >  
> >  	if (!overlay_fixups) {
> > @@ -329,20 +333,30 @@ int of_resolve_phandles(struct device_node
> > *overlay)
> >  	}
> >  
> >  	tree_symbols = of_find_node_by_path("/__symbols__");
> > -	if (!tree_symbols) {
> > -		pr_err("no symbols in root of device tree.\n");
> > +	if (!tree_symbols && !ext_symbols) {
> > +		pr_err("no symbols for resolve in device
> > tree.\n");
> >  		err = -EINVAL;
> >  		goto out;
> >  	}
> >  
> > +	phandle_delta = live_tree_max_phandle() + 1;
> > +
> >  	for_each_property_of_node(overlay_fixups, prop) {
> >  
> >  		/* skip properties added automatically */
> >  		if (!of_prop_cmp(prop->name, "name"))
> >  			continue;
> >  
> > -		err = of_property_read_string(tree_symbols,
> > -				prop->name, &refpath);
> > +		err = -1;
> > +
> > +		if (ext_symbols)
> > +			err = of_property_read_string(ext_symbols,
> > +					prop->name, &refpath);
> > +
> > +		if (err && tree_symbols)
> > +			err =
> > of_property_read_string(tree_symbols,
> > +					prop->name, &refpath);
> > +
> >  		if (err)
> >  			goto out;
> >  
> > @@ -352,6 +366,9 @@ int of_resolve_phandles(struct device_node
> > *overlay)
> >  			goto out;
> >  		}
> >  
> > +		if (!refnode->phandle)
> > +			refnode->phandle = ++phandle_delta;
> > +
> >  		phandle = refnode->phandle;
> >  		of_node_put(refnode);
> >  
> 
> 
