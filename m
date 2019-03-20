From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v3 3/3] net: dsa: qca8k: extend slave-bus implementations
Date: Wed, 20 Mar 2019 23:02:47 +0100
Message-ID: <3792532.HfxQciIWxC@debian64>
References: <20190319195419.12746-1-chunkeey@gmail.com> <20190319195419.12746-3-chunkeey@gmail.com> <5cd4b993-d1fa-80a2-a03b-a494a63ae56c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <5cd4b993-d1fa-80a2-a03b-a494a63ae56c@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Sorry. I hit Sent by accident and then I had to run...
This is the full response.

On Wednesday, March 20, 2019 7:27:09 PM CET Florian Fainelli wrote:
> On 3/19/19 12:54 PM, Christian Lamparter wrote:
> > This patch implements accessors for the QCA8337 MDIO access
> > through the MDIO_MASTER register, which makes it possible to
> > access the PHYs on slave-bus through the switch. In cases
> > where the switch ports are already mapped via external
> > "phy-phandles", the internal mdio-bus is disabled in order to
> > prevent a duplicated discovery and enumeration of the same
> > PHYs. Don't use mixed external and internal mdio-bus
> > configurations, as this is not supported by the hardware.
> > 
> > Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> > ---
> > Changes from v2:
> >  - Make it compatible with existing configurations
> >  - make it clear that's sadly a either external or
> >    internal mdio bus access.
> > 
> > Changes from v1:
> >  - drop DT port <-> phy mapping
> >  - added register definitions for the MDIO control register
> >  - implemented new slave-mdio bus accessors
> >  - DT-binding: fix switch's PSEUDO_PHY address. It's 0x10 not 0.
> > 
> > Old patch (+ discussion) for reference:
> > <https://patchwork.ozlabs.org/patch/1036309/>
> 
> LGTM, just a few comments/nits below.
> 
> > 
> > Tested on a Compex WPQ864 (IPQ8064 + QCA8337N)
> > internal bus:
> > qca8k 37000000.mdio-mii:10 lan1 (uninitialized): PHY [!mdio@37000000!switch@10:01] driver [Generic PHY]
> > qca8k 37000000.mdio-mii:10 lan2 (uninitialized): PHY [!mdio@37000000!switch@10:02] driver [Generic PHY]
> > qca8k 37000000.mdio-mii:10 lan3 (uninitialized): PHY [!mdio@37000000!switch@10:03] driver [Generic PHY]
> > qca8k 37000000.mdio-mii:10 lan4 (uninitialized): PHY [!mdio@37000000!switch@10:04] driver [Generic PHY]
> > qca8k 37000000.mdio-mii:10 wan (uninitialized): PHY [!mdio@37000000!switch@10:05] driver [Generic PHY]
> > 
> > external bus:
> > qca8k 37000000.mdio-mii:10 lan1 (uninitialized): PHY [37000000.mdio-mii:00] driver [Generic PHY]
> > qca8k 37000000.mdio-mii:10 lan2 (uninitialized): PHY [37000000.mdio-mii:01] driver [Generic PHY]
> > qca8k 37000000.mdio-mii:10 lan3 (uninitialized): PHY [37000000.mdio-mii:02] driver [Generic PHY]
> > qca8k 37000000.mdio-mii:10 lan4 (uninitialized): PHY [37000000.mdio-mii:03] driver [Generic PHY]
> > qca8k 37000000.mdio-mii:10 wan (uninitialized): PHY [37000000.mdio-mii:04] driver [Generic PHY]
> > ---
> 
> [snip]
> 
> > +static int
> > +qca8k_mdio_write(struct qca8k_priv *priv, int port, int regnum, u16 data)
> > +{
> > +	u32 val;
> > +	int phy;
> > +
> > +	phy = qca8k_port_to_phy(port);
> > +	if (phy < 0 || (regnum < 0 || regnum >= QCA8K_MDIO_MASTER_MAX_REG))
> > +		return -EINVAL;
> 
> Is not the first condition always true? We should fix the signature of
> phy_{read,write} in dsa.h to match what mdiobus_{read,write} takes,
> which is an u32 regnum.

Yes in that case regnum will never be negative so this check can be
futher simplyfied as dsa_slave_phy_{read|write} checks ds->phy_mii_mask.
So port can't be invalid. In the next version this will be:

if (regnum >= QCA8K_MDIO_MASTER_MAX_REG)
	return -EINVAL;

Since regnum > 31 will spill into QCA8K_MDIO_MASTER_PHY_ADDR
and the higher control bits.

> > +
> > +	val = QCA8K_MDIO_MASTER_BUSY | QCA8K_MDIO_MASTER_EN |
> > +	      QCA8K_MDIO_MASTER_WRITE | QCA8K_MDIO_MASTER_PHY_ADDR(phy) |
> > +	      QCA8K_MDIO_MASTER_REG_ADDR(regnum) |
> > +	      QCA8K_MDIO_MASTER_DATA(data);
> > +
> > +	qca8k_write(priv, QCA8K_MDIO_MASTER_CTRL, val);
> > +
> > +	return qca8k_busy_wait(priv, QCA8K_MDIO_MASTER_CTRL,
> > +		QCA8K_MDIO_MASTER_BUSY);
> > +}
> > +
> > +static int
> > +qca8k_mdio_read(struct qca8k_priv *priv, int port, int regnum)
> > +{
> > +	u32 val;
> > +	int phy;
> > +
> > +	phy = qca8k_port_to_phy(port);
> > +	if (phy < 0 || (regnum < 0 || regnum >= QCA8K_MDIO_MASTER_MAX_REG))
> > +		return -EINVAL;
> 
> Likewise.
Yes.
 
> [snip]
> 
> > +static int
> > +qca8k_phy_read(struct dsa_switch *ds, int port, int regnum)
> > +{
> > +	struct qca8k_priv *priv = ds->priv;
> > +	int ret = -EIO;
> > +
> > +	if (ds->slave_mii_bus->phy_mask & BIT(port))
> > +		ret = qca8k_mdio_read(priv, port, regnum);
> 
> I suppose in theory you could also look at the external_mdio_mask and do
> something like this:
> 
> 	if (ds->slave_mii_bus->phy_mask & BIT(port))
> 		ret = qca8k_mdio_read(priv, port, regnum);
> 	else
> 		ret = mdiobus_read_nested(priv->bus, port, regnum);
> 
> Not strictly necessary for now.

Oh, in the external mdio bus scenario, I don't have qca8k_phy_read wired up.
So the else branch would be dead code for now. (but see below)

But there's some other room for improvement:
However since we are always called from dsa_slave_phy_read the 
if (ds->slave_mii_bus->phy_mask & BIT(port))
could be removed since dsa_slave_phy_read does that already.
 
> > +
> > +	return ret;
> > +}
> > +
> > +static int
> > +qca8k_setup_mdio_bus(struct qca8k_priv *priv)
> > +{
> > +	struct device_node *ports, *port;
> > +	struct mii_bus *bus;
> > +	u32 internal_mdio_mask = 0;
> > +	u32 external_mdio_mask = 0;
> > +	u32 reg;
> > +	int err;
> > +
> > +	ports = of_get_child_by_name(priv->dev->of_node, "ports");
> > +	if (!ports)
> > +		return -EINVAL;
> > +
> > +	for_each_available_child_of_node(ports, port) {
> > +		err = of_property_read_u32(port, "reg", &reg);
> > +		if (err)
> > +			return err;
> > +
> > +		if (dsa_is_user_port(priv->ds, reg)) {
> 
> You could reduce indentation a bit with:
> 
> 	if (!dsa_is_user_port(priv->ds, reg))
> 		continue;

Yes. This is nicer.
> 
> > +			if (of_property_read_bool(port, "phy-handle"))
> > +				external_mdio_mask |= BIT(reg);
> > +			else
> > +				internal_mdio_mask |= BIT(reg);
> > +		}
> > +	}
> > +
> > +	if (!external_mdio_mask && !internal_mdio_mask) {
> > +		dev_err(priv->dev, "no PHYs are defined.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* The QCA8K_MDIO_MASTER_EN Bit, which grants access to PHYs through
> > +	 * the MDIO_MASTER register also _disconnects_ the external MDC
> > +	 * passthrough to the internal PHYs. It's not possible to use both
> > +	 * configurations at the same time!
> > +	 */
> 
> Right, but presumably you can do this on a per-port basis and support
> both types of configuration? bcm_sf2 is pretty much the same thing.
per-port? Sadly not that I know of, it's a per-chip (or per-switch) setting
from what I can tell by poking the chip.

I've looked at bcm_sf2 and the best hint seems to be in this commit:

|b8c6cd1d316f net: dsa: bcm_sf2: do not use indirect reads and writes for 7445E0
|
|7445E0 contains an ECO which disconnected the internal SF2 pseudo-PHY which was
|known to conflict with the external pseudo-PHY of BCM53125 switches. This
|motivated the need to utilize the internal SF2 MDIO controller via indirect
|register reads/writes to control external Broadcom switches due to this address
|conflict (both responded at address 30d). [...]

But this seems to involve the pseudo-PHYs (i.e. register access)? Which does not
sound like it what happens on the QCA8337.

For the QCA8337 the QCA8K_MDIO_MASTER_EN bit works as a changeover switch
for just the MDC line (datasheet 5.2.13 MDIO Master Control). So the User-Port
PHYs for LAN1-4 and WAN are moved (as in "mv" not "cp") between the external or
internal bus. This causes some very weird behavior from any PHY access of the
"disabled" bus:

[   17.036963] Generic PHY 37000000.mdio-mii:01: Master/Slave resolution failed, maybe conflicting manual settings?
[   17.116927] Generic PHY 37000000.mdio-mii:02: Master/Slave resolution failed, maybe conflicting manual settings?
[   17.196894] Generic PHY 37000000.mdio-mii:03: Master/Slave resolution failed, maybe conflicting manual settings?

I did investigate this in https://patchwork.ozlabs.org/comment/2086257/ but
I didn't find a viable solution to make this work as from my POV, this
requires synchronization between the qca8k code and the variety of external
mdio-bus driver to pull this off.

In my case: The WPQ864 (IPQ806x) can either use a virtual mdio-gpio driver
(which is what most boards are using) or a some dedicated hardware that's
living in GMAC0's core but has no upstream linux driver (yet).

Note3:
The QCA8337 can be interfaced through either MDIO or UART (share the
same pins, so only one option). Or alternatively through special/
properitary ethernet-frames sent/received on the cpu port (I guess
that's "in-band").

(There's also a SPI interface but it's soley for connecting a
SPI EEPROM that would store VLAN, 802.1p QoS, DiffServ/TOS
settings. So this is probably aimed at standalone switches)

> 
> > +	if (external_mdio_mask && internal_mdio_mask) {
> > +		dev_err(priv->dev, "either internal or external mdio bus configuration is supported.\n");
> > +		return -EINVAL;
> > +	}
> 
> Don't both conditions amount to:
> 
> 	if (external_mdio_mask == internal_mdio_mask)
> 		error()?
I think it is either (!!external_mdio_mask == !!internal_mdio_mask)
or (!external_mdio_mask == !internal_mdio_mask).

if (external_mdio_mask == internal_mdio_mask) will always be false,
because the external_mdio_mask and internal_mdio_mask are bitmasks
on whenever the (enumerated) port has a phy-handle or not. It's not
possible for external_mdio_mask and internal_mdio_mask to be the
same non-null value.

As for why I did it this way: I liked having different, somewhat
descriptive error messages for these cases. Because I have been on
so many -EINVAL wild-goose chases before. So please let me keep the
two distinct messages, OK?

> > +
> > +	if (external_mdio_mask) {
> > +		/* Make sure to disable the internal mdio bus in cases
> > +		 * a dt-overlay and driver reload changed the configuration
> > +		 */
> > +
> > +		qca8k_reg_clear(priv, QCA8K_MDIO_MASTER_CTRL,
> > +				QCA8K_MDIO_MASTER_EN);
> > +		return 0;
> > +	}
> > +
> > +	bus = devm_mdiobus_alloc_size(priv->dev, sizeof(priv));
> > +	if (!bus)
> > +		return -ENOMEM;
> > +	bus->priv = (void *)priv;
> 
> Cast is not necessary.
ACK

Cheers,
Christian
