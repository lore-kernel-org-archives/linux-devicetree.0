From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/4] drm: zte: add VGA driver support
Date: Fri, 7 Apr 2017 11:02:33 +0800
Message-ID: <20170407030231.GH3394@dragon>
References: <1491490870-6330-1-git-send-email-shawnguo@kernel.org>
 <1491490870-6330-5-git-send-email-shawnguo@kernel.org>
 <20170406171251.qlzdjmzalunplbdt@art_vandelay>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170406171251.qlzdjmzalunplbdt@art_vandelay>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Baoyou Xie <xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Xin Zhou <zhou.xin8-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 06, 2017 at 01:12:51PM -0400, Sean Paul wrote:
> On Thu, Apr 06, 2017 at 11:01:10PM +0800, Shawn Guo wrote:
> > +static int zx_vga_connector_get_modes(struct drm_connector *connector)
> > +{
> > +	struct zx_vga *vga = to_zx_vga(connector);
> > +	unsigned long flags;
> > +	struct edid *edid;
> > +	int ret;
> > +
> > +	/*
> > +	 * Clear both detection bits to switch I2C bus from device
> > +	 * detecting to EDID reading.
> > +	 */
> > +	spin_lock_irqsave(&vga->lock, flags);
> > +	zx_writel(vga->mmio + VGA_AUTO_DETECT_SEL, 0);
> > +	spin_unlock_irqrestore(&vga->lock, flags);
> > +
> > +	edid = drm_get_edid(connector, &vga->ddc->adap);
> > +	if (!edid)
> > +		return 0;
> > +
> > +	/*
> > +	 * As edid reading succeeds, device must be connected, so we set
> > +	 * up detection bit for unplug interrupt here.
> > +	 */
> > +	spin_lock_irqsave(&vga->lock, flags);
> > +	zx_writel(vga->mmio + VGA_AUTO_DETECT_SEL, VGA_DETECT_SEL_HAS_DEVICE);
> > +	spin_unlock_irqrestore(&vga->lock, flags);
> > +
> > +	drm_mode_connector_update_edid_property(connector, edid);
> > +	ret = drm_add_edid_modes(connector, edid);
> > +	kfree(edid);
> > +
> > +	return ret;
> > +}

<snip>

> > +static irqreturn_t zx_vga_irq_handler(int irq, void *dev_id)
> > +{
> > +	struct zx_vga *vga = dev_id;
> > +	u32 status;
> > +
> > +	status = zx_readl(vga->mmio + VGA_I2C_STATUS);
> > +
> > +	/* Clear interrupt status */
> > +	zx_writel_mask(vga->mmio + VGA_I2C_STATUS, VGA_CLEAR_IRQ,
> > +		       VGA_CLEAR_IRQ);
> > +
> > +	if (status & VGA_DEVICE_CONNECTED) {
> > +		/*
> > +		 * Since VGA_DETECT_SEL bits need to be reset for switching DDC
> > +		 * bus from device detection to EDID read, rather than setting
> > +		 * up HAS_DEVICE bit here, we need to do that in .get_modes
> > +		 * hook for unplug detecting after EDID read succeeds.
> > +		 */
> > +		vga->connected = true;
> > +		return IRQ_WAKE_THREAD;
> > +	}
> > +
> > +	if (status & VGA_DEVICE_DISCONNECTED) {
> > +		spin_lock(&vga->lock);
> > +		zx_writel(vga->mmio + VGA_AUTO_DETECT_SEL,
> > +			  VGA_DETECT_SEL_NO_DEVICE);
> > +		spin_unlock(&vga->lock);
> 
> I think you still have the race here. If you get a disconnect between get_edid
> successfully finishing, and resetting the DETECT_SEL register, you will end up
> with the device being disconnected and DETECT_SEL == VGA_DETECT_SEL_HAS_DEVICE.
> 
> In order to close this, you'll need to hold the lock across the edid read.

We cannot hold a spin lock across the EDID read procedure, which does
sleep.

When you suggested to have a lock for DETECT_SEL register access, I
thought we are accessing it in a read-modify-write way and thus agreed
to add a lock.  However, I just found that it's not the case actually.
All the accesses to the register are single direct write.

And here is my understanding about the condition you described above.
Once DETECT_SEL register gets reset (both bits cleared), the hardware
switches DDC bus for EDID read, and hotplug detection will stop working
right away (this is how ZTE hardware works).  That said, if we get a
disconnect before drm_get_edid() successfully finishes, two points:

- The irq handler will not be triggered, so it will not get a chance to
  update DETECT_SEL register.
- The drm_get_edid() fails, and .get_modes returns with both detect bits
  kept cleared.

I think what we can do better in this case is that we should set the
device state into disconnected, before returning from .get_modes,
something like the code below.  But still, I do not see we need a lock
for that.

Shawn

static int zx_vga_connector_get_modes(struct drm_connector *connector)
{
        struct zx_vga *vga = to_zx_vga(connector);
        unsigned long flags;
        struct edid *edid;
        int ret;

        /*
         * Clear both detection bits to switch I2C bus from device
         * detecting to EDID reading.
         */
        zx_writel(vga->mmio + VGA_AUTO_DETECT_SEL, 0);

        edid = drm_get_edid(connector, &vga->ddc->adap);
        if (!edid) {
                /*
                 * If EDID reading fails, we set the device state into
                 * disconnected.
                 */
                zx_writel(vga->mmio + VGA_AUTO_DETECT_SEL,
                          VGA_DETECT_SEL_NO_DEVICE);
                vga->connected = false;
                return 0;
        }

        /*
         * As edid reading succeeds, device must be connected, so we set
         * up detection bit for unplug interrupt here.
         */
        zx_writel(vga->mmio + VGA_AUTO_DETECT_SEL, VGA_DETECT_SEL_HAS_DEVICE);

        drm_mode_connector_update_edid_property(connector, edid);
        ret = drm_add_edid_modes(connector, edid);
        kfree(edid);

        return ret;
}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
