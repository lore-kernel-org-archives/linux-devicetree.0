From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v8 08/11] usb: roles: get usb-role-switch from parent
Date: Wed, 31 Jul 2019 14:29:18 +0800
Message-ID: <1564554558.5579.7.camel@mhfsdcap03>
References: <1563958245-6321-1-git-send-email-chunfeng.yun@mediatek.com>
 <1563958245-6321-9-git-send-email-chunfeng.yun@mediatek.com>
 <20190729142500.GE28600@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190729142500.GE28600@kuha.fi.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>, Badhri Jagan Sridharan <badhri@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Heikki,

On Mon, 2019-07-29 at 17:25 +0300, Heikki Krogerus wrote:
> On Wed, Jul 24, 2019 at 04:50:42PM +0800, Chunfeng Yun wrote:
> > when the USB host controller is the parent of the connector,
> > usually type-B, sometimes don't need the graph, so we should
> > check whether it's parent registers usb-role-switch or not
> > firstly, and get it if exists.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> I don't think I actually wrote the patch. I may have proposed the code
> for you, but I never prepared a patch out out that. Please drop the
> above Signed-off-by line if that is the case. I case I really did
> write the patch, then you are missing the "From: Heikki..." first
> line, but I really don't remember preparing the patch.
> 
> If the idea came from me, you can use for example the suggested-by
> tag: "Suggested-by: Heikki Krogerus <heikki.krogerus...".
Ok, thanks

> 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v8: no changes
> > v7:
> >   add signed-off-by Chunfeng
> > 
> > v6:
> >   new patch
> > ---
> >  drivers/usb/roles/class.c | 25 +++++++++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> > index 5b637aaf311f..87439a84c983 100644
> > --- a/drivers/usb/roles/class.c
> > +++ b/drivers/usb/roles/class.c
> > @@ -114,6 +114,19 @@ static void *usb_role_switch_match(struct device_connection *con, int ep,
> >  	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
> >  }
> >  
> > +static struct usb_role_switch *
> > +usb_role_switch_is_parent(struct fwnode_handle *fwnode)
> > +{
> > +	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
> > +	struct device *dev;
> > +
> > +	if (!parent || !fwnode_property_present(parent, "usb-role-switch"))
> > +		return NULL;
> > +
> > +	dev = class_find_device(role_class, NULL, parent, switch_fwnode_match);
> > +	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
> > +}
> > +
> >  /**
> >   * usb_role_switch_get - Find USB role switch linked with the caller
> >   * @dev: The caller device
> > @@ -125,8 +138,10 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
> >  {
> >  	struct usb_role_switch *sw;
> >  
> > -	sw = device_connection_find_match(dev, "usb-role-switch", NULL,
> > -					  usb_role_switch_match);
> > +	sw = usb_role_switch_is_parent(dev_fwnode(dev));
> > +	if (!sw)
> > +		sw = device_connection_find_match(dev, "usb-role-switch", NULL,
> > +						  usb_role_switch_match);
> >  
> >  	if (!IS_ERR_OR_NULL(sw))
> >  		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> > @@ -146,8 +161,10 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
> >  {
> >  	struct usb_role_switch *sw;
> >  
> > -	sw = fwnode_connection_find_match(fwnode, "usb-role-switch", NULL,
> > -					  usb_role_switch_match);
> > +	sw = usb_role_switch_is_parent(fwnode);
> > +	if (!sw)
> > +		sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
> > +						  NULL, usb_role_switch_match);
> >  	if (!IS_ERR_OR_NULL(sw))
> >  		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> >  
> > -- 
> > 2.21.0
> 
> thanks,
> 
