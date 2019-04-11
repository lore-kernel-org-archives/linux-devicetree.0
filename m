From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [v3 PATCH 4/6] usb: roles: add API to get usb_role_switch by node
Date: Thu, 11 Apr 2019 11:11:09 +0800
Message-ID: <1554952269.10179.185.camel@mhfsdcap03>
References: <1554257354-7440-1-git-send-email-chunfeng.yun@mediatek.com>
 <1554257354-7440-5-git-send-email-chunfeng.yun@mediatek.com>
 <20190410102239.GG20058@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190410102239.GG20058@kuha.fi.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Min Guo <min.guo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2019-04-10 at 13:22 +0300, Heikki Krogerus wrote:
> On Wed, Apr 03, 2019 at 10:09:12AM +0800, Chunfeng Yun wrote:
> > Add fwnode_usb_role_switch_get() to make easier to get
> > usb_role_switch by fwnode which register it.
> > It's useful when there is not device_connection registered
> > between two drivers and only knows the fwnode which register
> > usb_role_switch.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v3 changes:
> >   1. use fwnodes instead of node suggested by Andy
> >   2. rebuild the API suggested by Heikki
> > 
> > v2 no changes
> > ---
> >  drivers/usb/roles/class.c | 31 +++++++++++++++++++++++++++++++
> >  include/linux/usb/role.h  |  2 ++
> >  2 files changed, 33 insertions(+)
> > 
> > diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> > index f45d8df5cfb8..5ecb57f8960b 100644
> > --- a/drivers/usb/roles/class.c
> > +++ b/drivers/usb/roles/class.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/device.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > +#include <linux/of.h>
> >  #include <linux/slab.h>
> >  
> >  static struct class *role_class;
> > @@ -135,6 +136,36 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(usb_role_switch_get);
> >  
> > +static int __switch_match_fwnode(struct device *dev, const void *fwnode)
> > +{
> > +	return dev_fwnode(dev->parent) == (const struct fwnode_handle *)fwnode;
> > +}
> 
> I don't think this is actually needed. 
Yes, you are right

> Why not just assign the
> parent's fwnode for the mux as well?
will do it in next version

> 
> I'll add an example to the patch 6/6 in this series.
> 
> > +/**
> > + * fwnode_usb_role_switch_get - Find USB role switch by it's parent fwnode
> > + * @fwnode: The fwnode that register USB role switch
> > + *
> > + * Finds and returns role switch registered by @fwnode. The reference count
> > + * for the found switch is incremented.
> > + */
> > +struct usb_role_switch *
> > +fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
> > +{
> > +	struct usb_role_switch *sw;
> > +	struct device *dev;
> > +
> > +	dev = class_find_device(role_class, NULL, fwnode,
> > +				__switch_match_fwnode);
> 
> So here you can then reuse switch_fwnode_match():
> 
> 	dev = class_find_device(role_class, NULL, fwnode, switch_fwnode_match);
I make a fast test, it works, thanks a lot Heikki

> 
> > +	if (!dev)
> > +		return ERR_PTR(-EPROBE_DEFER);
> > +
> > +	sw = to_role_switch(dev);
> > +	WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> > +
> > +	return sw;
> > +}
> > +EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
> > +
> >  /**
> >   * usb_role_switch_put - Release handle to a switch
> >   * @sw: USB Role Switch
> > diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
> > index c05ffa6abda9..d21cd55d9e45 100644
> > --- a/include/linux/usb/role.h
> > +++ b/include/linux/usb/role.h
> > @@ -46,6 +46,8 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role);
> >  enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw);
> >  struct usb_role_switch *usb_role_switch_get(struct device *dev);
> >  void usb_role_switch_put(struct usb_role_switch *sw);
> > +struct usb_role_switch *
> > +fwnode_usb_role_switch_get(struct fwnode_handle *fwnode);
> >  
> >  struct usb_role_switch *
> >  usb_role_switch_register(struct device *parent,
> > -- 
> > 2.20.1
> 
> thanks,
> 
