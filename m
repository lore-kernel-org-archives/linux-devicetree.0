Return-Path: <SRS0=56P5=TX=nvidia.com=nkristam@kernel.org>
Subject: Re: [Patch V3 2/8] phy: tegra: xusb: t210: add usb3 port fake support
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-3-git-send-email-nkristam@nvidia.com>
 <20190523100120.GB30331@ulmo>
From: Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <1856de7e-1b28-a5c6-8141-505ae0236575@nvidia.com>
Date: Thu, 23 May 2019 16:54:48 +0530
MIME-Version: 1.0
In-Reply-To: <20190523100120.GB30331@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 23-05-2019 15:31, Thierry Reding wrote:
> On Thu, May 16, 2019 at 12:09:26PM +0530, Nagarjuna Kristam wrote:
>> On Tegra210, usb2 only otg/peripheral ports dont work in device mode.
>> They need an assosciated usb3 port to work in device mode. Identify
>> an unused usb3 port and assign it as a fake USB3 port to USB2 only
>> port whose mode is otg/peripheral.
>>
>> Based on work by BH Hsieh <bhsieh@nvidia.com>.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>>  drivers/phy/tegra/xusb-tegra210.c | 56 +++++++++++++++++++++++++++++++
>>  drivers/phy/tegra/xusb.c          | 69 +++++++++++++++++++++++++++++++++++++++
>>  drivers/phy/tegra/xusb.h          |  2 ++
>>  3 files changed, 127 insertions(+)
>>
>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
>> index 4beebcc..829aca5 100644
>> --- a/drivers/phy/tegra/xusb-tegra210.c
>> +++ b/drivers/phy/tegra/xusb-tegra210.c
>> @@ -58,6 +58,7 @@
>>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_SHIFT(x) ((x) * 5)
>>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(x) (0x7 << ((x) * 5))
>>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(x, v) (((v) & 0x7) << ((x) * 5))
>> +#define XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED 0x7
>>  
>>  #define XUSB_PADCTL_ELPG_PROGRAM1 0x024
>>  #define XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN (1 << 31)
>> @@ -952,6 +953,34 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
>>  
>>  	priv = to_tegra210_xusb_padctl(padctl);
>>  
>> +	if (port->usb3_port_fake != -1) {
>> +		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
>> +		value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(
>> +					port->usb3_port_fake);
>> +		value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(
>> +					port->usb3_port_fake, index);
>> +		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
>> +
>> +		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
>> +		value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(
>> +					port->usb3_port_fake);
>> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
>> +
>> +		usleep_range(100, 200);
>> +
>> +		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
>> +		value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
>> +					port->usb3_port_fake);
>> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
>> +
>> +		usleep_range(100, 200);
>> +
>> +		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
>> +		value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(
>> +					port->usb3_port_fake);
>> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
>> +	}
>> +
>>  	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
>>  	value &= ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_MASK <<
>>  		    XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_SHIFT) |
>> @@ -1086,6 +1115,32 @@ static int tegra210_usb2_phy_power_off(struct phy *phy)
>>  
>>  	mutex_lock(&padctl->lock);
>>  
>> +	if (port->usb3_port_fake != -1) {
>> +		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
>> +		value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
>> +					port->usb3_port_fake);
>> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
>> +
>> +		usleep_range(100, 200);
>> +
>> +		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
>> +		value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(
>> +					port->usb3_port_fake);
>> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
>> +
>> +		usleep_range(250, 350);
>> +
>> +		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
>> +		value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(
>> +					port->usb3_port_fake);
>> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
>> +
>> +		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
>> +		value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(port->usb3_port_fake,
>> +					XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED);
>> +		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
>> +	}
>> +
>>  	if (WARN_ON(pad->enable == 0))
>>  		goto out;
>>  
>> @@ -2051,6 +2106,7 @@ const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc = {
>>  		},
>>  	},
>>  	.ops = &tegra210_xusb_padctl_ops,
>> +	.need_fake_usb3_port = true,
>>  };
>>  EXPORT_SYMBOL_GPL(tegra210_xusb_padctl_soc);
>>  
>> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
>> index 0417213..6618db7 100644
>> --- a/drivers/phy/tegra/xusb.c
>> +++ b/drivers/phy/tegra/xusb.c
>> @@ -808,9 +808,66 @@ static void __tegra_xusb_remove_ports(struct tegra_xusb_padctl *padctl)
>>  	}
>>  }
>>  
>> +static int tegra_xusb_find_unused_usb3_port(struct tegra_xusb_padctl *padctl)
>> +{
>> +	struct device_node *np;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < padctl->soc->ports.usb3.count; i++) {
>> +		np = tegra_xusb_find_port_node(padctl, "usb3", i);
>> +		if (!np || !of_device_is_available(np))
>> +			return i;
>> +	}
>> +
>> +	return -ENODEV;
>> +}
>> +
>> +static bool tegra_xusb_usb3_port_has_companion(struct tegra_xusb_padctl *padctl,
>> +							     unsigned int index)
>> +{
>> +	unsigned int i;
>> +	struct tegra_xusb_usb3_port *usb3;
>> +
>> +	for (i = 0; i < padctl->soc->ports.usb3.count; i++) {
>> +		usb3 = tegra_xusb_find_usb3_port(padctl, i);
>> +		if (usb3 && usb3->port == index)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static int tegra_xusb_update_usb3_fake_port(struct tegra_xusb_usb2_port *usb2)
>> +{
>> +	int fake;
>> +
>> +	/* Disable usb3_port_fake usage by default and assign if needed */
>> +	usb2->usb3_port_fake = -1;
>> +
>> +	if ((usb2->mode == USB_DR_MODE_OTG ||
>> +	     usb2->mode == USB_DR_MODE_PERIPHERAL) &&
>> +		!tegra_xusb_usb3_port_has_companion(usb2->base.padctl,
>> +						    usb2->base.index)) {
> 
> This port is still a bit confusing to me. It's not entirely obvious
> what's going on here. What I think this is doing is this: for OTG or
> peripheral USB 2.0 ports that are not companion ports themselves (i.e.
> only standalone OTG/peripheral USB 2.0 ports) find an unused USB 3.0
> port that can be used as fake for the hardware workaround.
> 
> Correct me if I'm wrong.
> 

Yes, understanding is correct

> I find the tegra_xusb_usb3_port_has_companion() confusing in that case
> because you seem to be testing a USB 3.0 port (_usb3_ in the function
> name) for a USB 2.0 index (passed as second parameter). So what you're
> basically trying to do is find a USB 3.0 port for which the USB 2.0 port
> identified by the given index is a companion. It seems to me like that
> would be a lot easier to understand if you did this:
> 
> 	!tegra_xusb_usb2_port_is_companion(usb2)
> 
> with:
> 
> 	static bool tegra_xusb_port_is_companion(struct tegra_xusb_usb2_port *port)
> 	{
> 		struct tegra_xusb_padctl *padctl = port->base.padctl;
> 		struct tegra_xusb_usb3_port *usb3;
> 		unsigned int i;
> 
> 		for (i = 0; i < padctl->soc->ports.usb3.count; i++) {
> 			usb3 = tegra_xusb_find_usb3_port(padctl, i);
> 			if (usb3 && usb3->port == port->base.index)
> 				return true;
> 		}
> 
> 		return false;
> 	}
> 

Will update accordingly

>> +
>> +		fake = tegra_xusb_find_unused_usb3_port(usb2->base.padctl);
>> +
>> +		if (fake < 0) {
> 
> This is one of the few exceptions where the blank line is not useful. It
> makes sense here to keep the above two lines close together because you
> assign the value and then check it. So the blank line rule doesn't apply
> to this general pattern:
> 
> 	value = foobar(...);
> 	if (value < 0) {
> 		...
> 	}
> 
> That is, if the value that you check is the same that you just assigned,
> you should avoid the blank line as separator because the two lines are
> closely related.
> 

Will update accordingly

>> +			dev_err(&usb2->base.dev, "no unused USB3 ports available\n");
>> +			return -ENODEV;
>> +		}
>> +
>> +		dev_dbg(&usb2->base.dev, "Found unused usb3 port: %d\n",
>> +					 fake);
> 
> Nit: the above fits on a single line.
> 

> Otherwise looks good.
> 
> Thierry
> 

Will update accordingly

-Nagarjuna
>> +		usb2->usb3_port_fake = fake;
>> +		tegra_xusb_find_unused_usb3_port(usb2->base.padctl);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int tegra_xusb_setup_ports(struct tegra_xusb_padctl *padctl)
>>  {
>>  	struct tegra_xusb_port *port;
>> +	struct tegra_xusb_usb2_port *usb2;
>>  	unsigned int i;
>>  	int err = 0;
>>  
>> @@ -840,6 +897,18 @@ static int tegra_xusb_setup_ports(struct tegra_xusb_padctl *padctl)
>>  			goto remove_ports;
>>  	}
>>  
>> +	if (padctl->soc->need_fake_usb3_port) {
>> +		for (i = 0; i < padctl->soc->ports.usb2.count; i++) {
>> +			usb2 = tegra_xusb_find_usb2_port(padctl, i);
>> +			if (!usb2)
>> +				continue;
>> +
>> +			err = tegra_xusb_update_usb3_fake_port(usb2);
>> +			if (err < 0)
>> +				goto remove_ports;
>> +		}
>> +	}
>> +
>>  	list_for_each_entry(port, &padctl->ports, list) {
>>  		err = port->ops->enable(port);
>>  		if (err < 0)
>> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
>> index e0028b9f..26dd6d2 100644
>> --- a/drivers/phy/tegra/xusb.h
>> +++ b/drivers/phy/tegra/xusb.h
>> @@ -299,6 +299,7 @@ struct tegra_xusb_usb2_port {
>>  	struct regulator *supply;
>>  	enum usb_dr_mode mode;
>>  	bool internal;
>> +	int usb3_port_fake;
>>  };
>>  
>>  static inline struct tegra_xusb_usb2_port *
>> @@ -397,6 +398,7 @@ struct tegra_xusb_padctl_soc {
>>  
>>  	const char * const *supply_names;
>>  	unsigned int num_supplies;
>> +	bool need_fake_usb3_port;
>>  };
>>  
>>  struct tegra_xusb_padctl {
>> -- 
>> 2.7.4
>>
