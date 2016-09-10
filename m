Return-Path: <kishon@kernel.org>
Date: Sat, 10 Sep 2016 17:27:47 +0530
From: Kishon Vijay Abraham I <kishon@a0393678ub>
Subject: Re: [RESEND PATCH v7 1/4] phy: Add reset callback
Message-ID: <20160910115747.GA10077@a0393678ub>
References: <1473447580-10369-1-git-send-email-ayaka@soulik.info>
 <1473447580-10369-2-git-send-email-ayaka@soulik.info>
 <8774766.IvFq1IoyNk@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8774766.IvFq1IoyNk@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Randy Li <ayaka@soulik.info>, linux-usb@vger.kernel.org, John.Youn@synopsys.com, kishon@ti.com, felipe.balbi@linux.intel.com, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, randy.li@rock-chips.com
List-ID: <devicetree@vger.kernel.org>

Hi,

On Sat, Sep 10, 2016 at 10:51:00AM +0200, Heiko Stuebner wrote:
> Hi Randy,
> 
> Am Samstag, 10. September 2016, 02:59:37 CEST schrieb Randy Li:
> > The only use for this is for solving a hardware design problem in
> > usb of Rockchip RK3288.
> > 
> > Signed-off-by: Randy Li <ayaka@soulik.info>
> 
> When sending new versions, please carry over received Reviewed- / Tested- / 
> Acked-by tags received on old versions.
> 
> So again, to me this looks good.
> 
> Although Kishon suggested earlier to have the init callback do the reset and 
> simply call it again in the reset-case, the whole refcounting done in phy_init 
> and phy_exit (phy->init_count) really shows that init and exit should be 
> called pairwise, so that extra reset callback seems justified, so from my phy-
> noob-pov

yeah, that makes sense. Moreover I see few more users wanting to use reset.

Btw fixed a couple of checkpatch warning before merging this

WARNING: Missing a blank line after declarations
#82: FILE: drivers/phy/phy-core.c:363:
+       int ret;
+       if (!phy || !phy->ops->reset)

WARNING: 'reseting' may be misspelled - perhaps 'resetting'?
#104: FILE: include/linux/phy/phy.h:39:
+ * @reset: reseting the phy

-Kishon
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
> > ---
> >  drivers/phy/phy-core.c  | 14 ++++++++++++++
> >  include/linux/phy/phy.h |  3 +++
> >  2 files changed, 17 insertions(+)
> > 
> > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > index 8eca906..32e838d 100644
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -357,6 +357,20 @@ int phy_set_mode(struct phy *phy, enum phy_mode mode)
> >  }
> >  EXPORT_SYMBOL_GPL(phy_set_mode);
> > 
> > +int phy_reset(struct phy *phy)
> > +{
> > +	int ret;
> > +	if (!phy || !phy->ops->reset)
> > +		return 0;
> > +
> > +	mutex_lock(&phy->mutex);
> > +	ret = phy->ops->reset(phy);
> > +	mutex_unlock(&phy->mutex);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(phy_reset);
> > +
> >  /**
> >   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
> >   * @np: device_node for which to get the phy
> > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > index f08b672..7978df6 100644
> > --- a/include/linux/phy/phy.h
> > +++ b/include/linux/phy/phy.h
> > @@ -36,6 +36,7 @@ enum phy_mode {
> >   * @power_on: powering on the phy
> >   * @power_off: powering off the phy
> >   * @set_mode: set the mode of the phy
> > + * @reset: reseting the phy
> >   * @owner: the module owner containing the ops
> >   */
> >  struct phy_ops {
> > @@ -44,6 +45,7 @@ struct phy_ops {
> >  	int	(*power_on)(struct phy *phy);
> >  	int	(*power_off)(struct phy *phy);
> >  	int	(*set_mode)(struct phy *phy, enum phy_mode mode);
> > +	int	(*reset)(struct phy *phy);
> >  	struct module *owner;
> >  };
> > 
> > @@ -136,6 +138,7 @@ int phy_exit(struct phy *phy);
> >  int phy_power_on(struct phy *phy);
> >  int phy_power_off(struct phy *phy);
> >  int phy_set_mode(struct phy *phy, enum phy_mode mode);
> > +int phy_reset(struct phy *phy);
> >  static inline int phy_get_bus_width(struct phy *phy)
> >  {
> >  	return phy->attrs.bus_width;
> 
> 
