From: Daniel Morsing <daniel.morsing-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] net: dm9000: add support for device tree probing
Date: Wed, 10 Aug 2011 13:30:06 +0200
Message-ID: <1312975806.9870.37.camel@morsingpad>
References: <1312919849-4979-1-git-send-email-daniel.morsing@gmail.com>
	<1312919849-4979-2-git-send-email-daniel.morsing@gmail.com>
	<20110809205155.GC11568@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110809205155.GC11568-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2011-08-09 at 14:51 -0600, Grant Likely wrote:
> On Tue, Aug 09, 2011 at 09:57:29PM +0200, Daniel Morsing wrote:
> > This patch adds support for probing the dm9000 driver through device
> > trees.
> > 
> > The patch works by supplying its own platform_data struct when probed
> > via device tree. This allows us to rely on the existing options parsing
> > in the driver and avoid ifdeffery in the probe function.
> > 
> > Signed-off-by: Daniel Morsing <daniel.morsing-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/net/dm9000.txt |   46 ++++++++++++
> >  drivers/net/dm9000.c                             |   85 ++++++++++++++++++++++
> >  2 files changed, 131 insertions(+), 0 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/net/dm9000.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/net/dm9000.txt b/Documentation/devicetree/bindings/net/dm9000.txt
> > new file mode 100644
> > index 0000000..f13ce20
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/dm9000.txt
> > @@ -0,0 +1,46 @@
> > +Davicom DM9000 ethernet controller
> > +
> > +Required properties:
> > +
> > + - compatible : Should be "davicom,dm9000"
> > +
> > + - interrupts : Interrupt controller specific encoding, which specifies 1
> > +   or 2 interrupts. The first interrupt is for rx/tx received and is required
> > +   by the driver to function. The second interrupt is for wake on lan support
> > +   and is optional.
> > +
> > + - interrupt-flags : A one cell value which specifies the flag values for
> > +   the first interrupt, corresponding to the IORESOURCE_IRQ_* flags. An
> > +   example is using the value <8> for specifying the IORESOURCE_IRQ_LOWLEVEL
> > +   flag
> 
> Don't do this.  First of all, the interrupt specifier should be
> sufficient for specifying properties of the irq.  Second, this is
> encoding Linux internal implementation details into the device tree.
> It is fine for a property to correspond with the numbers used by
> Linux, but they must be explicitly specified.  Don't simply say "the
> same numbers as used by Linux".

I originally based this patch on 3.0 and through code inspection, I saw
no way to set sense information on the arm architecture. I must have
assumed that it was general for device tree and added this property.

The property has been removed in the new version.

As an aside, looking through the code, a couple of architectures still
implement a create_of_irq_mapping function that just returns the first
index of the original array. Is this valid behavior?
> 
> > +
> > + - reg : 2 Physical address specifiers, where the first specifies the address
> > +   register of device, and the second specifies the data register of the device
> > +
> > +Optional properties:
> > +
> > + - local-mac-address : Binary data specifying a mac address override
> > +
> > + - The following properties are all empty properties and specify one of the
> > +   flags that can be passed with the platform data to the driver. For specifics
> > +   about what the flags mean, see Documentation/networking/dm9000.txt
> 
> Ditto here on Linux values.
> 
> > +
> > +   8bitonly:	DM9000_PLATF_8BITONLY
> > +   16bitonly:	DM9000_PLATF_16BITONLY
> > +   32bitonly:	DM9000_PLATF_32BITONLY
> 
> You should probably use the reg-io-width property similar to the ns16550
> driver.
> 
> > +   ext-phy:	DM9000_PLATF_EXT_PHY
> > +   no-eeprom:	DM9000_PLATF_NO_EEPROM
> > +   simple-phy:	DM9000_PLATF_SIMPLE_PHY
> 
> Can you use the phy-device binding used by other ethernet controllers
> to specify an external phy?

The only option for external phy is if it exists or not. Is it valid to
just find out if there is a valid phy-handle phandle in the DT, then set
the flag and throw away the resulting node?

simple-phy is not an option for the external phy. It specifies a mode
where the link change status for the internal phy is read through a
simple register read instead of using expensive MDIO accesses. That
property will stay, but more thoroughly documented :).

> 
> > +
> > +Example:
> > +
> > +ethernet0@2c000000 {
> 
> ethernet@2c000000 (drop the '0').  If you want to enumerate it, use a
> property in the /aliases node.
> 
> > +	compatible = "davicom,dm9000";
> > +	reg = <0x2c000000 0x04>,
> > +	      <0x2c000400 0x04>;
> > +	interrupts = <185>;
> > +	interrupt-flags = <8>; /* IORESOURCE_IRQ_LOWLEVEL */
> > +	local-mac-address = [02 65 16 01 c0 09];
> > +	16bitonly;
> > +	no-eeprom;
> > +};
> > diff --git a/drivers/net/dm9000.c b/drivers/net/dm9000.c
> > index 8ef31dc..4ad5043 100644
> > --- a/drivers/net/dm9000.c
> > +++ b/drivers/net/dm9000.c
> > @@ -35,6 +35,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/irq.h>
> >  #include <linux/slab.h>
> > +#include <linux/of.h>
> >  
> >  #include <asm/delay.h>
> >  #include <asm/irq.h>
> > @@ -1350,6 +1351,77 @@ static const struct net_device_ops dm9000_netdev_ops = {
> >  #endif
> >  };
> >  
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id dm9000_of_match[] = {
> > +	{ .compatible = "davicom,dm9000" },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, dm9000_of_match);
> > +
> > +static const struct {
> > +	const char *property;
> > +	unsigned int flag;
> > +} property_lookup[] __devinitconst = {
> > +	{ "8bitonly", DM9000_PLATF_8BITONLY},
> > +	{ "16bitonly", DM9000_PLATF_16BITONLY},
> > +	{ "32bitonly", DM9000_PLATF_32BITONLY},
> > +	{ "ext-phy", DM9000_PLATF_EXT_PHY},
> > +	{ "no-eeprom", DM9000_PLATF_NO_EEPROM},
> > +	{ "simple-phy", DM9000_PLATF_SIMPLE_PHY},
> > +	{},
> > +};
> > +
> > +static int __devinit
> > +dm9000_dt_fill_platdata(struct platform_device *pdev,
> > +			struct dm9000_plat_data *pdata)
> > +{
> > +	struct resource *irq_res;
> > +	struct device_node *of_node = pdev->dev.of_node;
> > +	const u8 *mac_addr;
> > +
> > +	u32 intflags;
> > +	int i;
> > +
> > +	if (of_property_read_u32(of_node, "interrupt-flags", &intflags)) {
> > +		dev_err(&pdev->dev,
> > +			"interrupt-flags property not found in device tree\n");
> > +		return -EINVAL;
> > +	}
> 
> Is this really a fatal error?

The driver complains if passed an IRQ resource without sense flags. This
makes sense in the original usage of the driver where the interrupt
probably hadn't been set up to a particular irq_type before requesting
it.

With the removal of interrupt-flags, there's no fatal error here
anymore, but the driver will start complaining (though not failing)
about no sense flags.

> 
> > +
> > +	irq_res  = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> > +	if (!irq_res) {
> > +		dev_err(&pdev->dev, "No irq found in device tree\n");
> > +		return -EINVAL;
> > +	}
> > +	irq_res->flags |= intflags;
> > +
> > +	for (i = 0; property_lookup[i].property; i++) {
> > +		struct property *prop;
> > +		prop = of_find_property(of_node, property_lookup[i].property,
> > +					NULL);
> > +		if (prop) {
> > +			pdata->flags |= property_lookup[i].flag;
> > +			dev_dbg(&pdev->dev, "%s property found in device tree\n",
> > +					property_lookup[i].property);
> > +		}
> > +	}
> > +
> > +	mac_addr = of_get_property(of_node, "local-mac-address", NULL);
> > +	if (mac_addr)
> > +		memcpy(pdata->dev_addr, mac_addr, 6);
> > +
> > +	return 0;
> > +}
> > +
> > +#else
> > +#define dm9000_of_match NULL
> > +static inline int dm9000_dt_fill_platdata(struct platform_device *pdev,
> > +					   struct dm9000_plat_data *pdata)
> > +{
> > +	return 0;
> > +}
> > +#endif /* CONFIG_OF */
> > +
> >  /*
> >   * Search DM9000 board, allocate space and register it
> >   */
> > @@ -1359,12 +1431,24 @@ dm9000_probe(struct platform_device *pdev)
> >  	struct dm9000_plat_data *pdata = pdev->dev.platform_data;
> >  	struct board_info *db;	/* Point a board information structure */
> >  	struct net_device *ndev;
> > +	struct dm9000_plat_data pdata_of;
> >  	const unsigned char *mac_src;
> >  	int ret = 0;
> >  	int iosize;
> >  	int i;
> >  	u32 id_val;
> >  
> > +	if (pdev->dev.of_node) {
> > +		if (!pdata) {
> > +			memset(&pdata_of, 0, sizeof(pdata_of));
> > +			pdata = &pdata_of;
> > +		}
> > +
> > +		ret = dm9000_dt_fill_platdata(pdev, pdata);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> >  	/* Init network device */
> >  	ndev = alloc_etherdev(sizeof(struct board_info));
> >  	if (!ndev) {
> > @@ -1677,6 +1761,7 @@ static struct platform_driver dm9000_driver = {
> >  		.name    = "dm9000",
> >  		.owner	 = THIS_MODULE,
> >  		.pm	 = &dm9000_drv_pm_ops,
> > +		.of_match_table = dm9000_of_match,
> >  	},
> >  	.probe   = dm9000_probe,
> >  	.remove  = __devexit_p(dm9000_drv_remove),
> 
> Otherwise, looks pretty good.
> 
> g.
> 
