From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of/platform: Initialise dev->fwnode appropriately
Date: Fri, 16 Sep 2016 12:12:07 +0100
Message-ID: <20160916111207.GA32342@red-moon>
References: <38259ab3716da072fab37f06d034329244491c13.1473865096.git.robin.murphy@arm.com>
 <20160915133657.GB14424@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160915133657.GB14424@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, salil.mehta-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 15, 2016 at 08:36:57AM -0500, Rob Herring wrote:
> On Wed, Sep 14, 2016 at 04:01:24PM +0100, Robin Murphy wrote:
> > Whilst we're some of the way towards a universal firmware property
> > interface, drivers which deal with both OF and ACPI probing end up
> > having to do things like this:
> > 
> >     dev->of_node ? &dev->of_node->fwnode : dev->fwnode
> > 
> > This seems unnecessary, when the OF code could instead simply fill in
> > the device's fwnode when binding the of_node, and let the drivers use
> > dev->fwnode either way. Let's give it a go and see what falls out.
> > 
> > Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  drivers/of/platform.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> I've applied this, but what about non-platform devices such as i2c?

Thanks ! Patch below should do for mfd and i2c (to be confirmed) but
I am pretty certain it is still missing some devices, are we going
to convert them on a case-by-case policy (ie when/if needed) ?

Lorenzo

-- >8 --
diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index da3a02e..667a393 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -1574,6 +1574,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
 
 	info.addr = addr;
 	info.of_node = of_node_get(node);
+	info.fwnode = &node->fwnode;
 	info.archdata = &dev_ad;
 
 	if (of_get_property(node, "wakeup-source", NULL))
diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 3ac486a..c264bf5 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -179,6 +179,7 @@ static int mfd_add_device(struct device *parent, int id,
 		for_each_child_of_node(parent->of_node, np) {
 			if (of_device_is_compatible(np, cell->of_compatible)) {
 				pdev->dev.of_node = np;
+				pdev->dev.fwnode = &np->fwnode;
 				break;
 			}
 		}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
