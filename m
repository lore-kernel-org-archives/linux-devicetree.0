From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 net-next 7/7] net: dsa: Add Lantiq / Intel DSA driver
 for vrx200
Date: Mon, 3 Sep 2018 12:54:32 -0700
Message-ID: <eb5c0815-e80c-7fd7-a14a-ccc3f28a7c93@gmail.com>
References: <20180901114535.9070-1-hauke@hauke-m.de>
 <20180901120511.10112-1-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180901120511.10112-1-hauke@hauke-m.de>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>, davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 9/1/2018 5:05 AM, Hauke Mehrtens wrote:
> This adds the DSA driver for the GSWIP Switch found in the VRX200 SoC.
> This switch is integrated in the DSL SoC, this SoC uses a GSWIP version
> 2.1, there are other SoCs using different versions of this IP block, but
> this driver was only tested with the version found in the VRX200.
> Currently only the basic features are implemented which will forward all
> packages to the CPU and let the CPU do the forwarding. The hardware also
> support Layer 2 offloading which is not yet implemented in this driver.
> 
> The GPHY FW loaded is now done by this driver and not any more by the
> separate driver in drivers/soc/lantiq/gphy.c, I will remove this driver
> is a separate patch. to make use of the GPHY this switch driver is
> needed anyway. Other SoCs have more embedded GPHYs so this driver should
> support a variable number of GPHYs. After the firmware was loaded the
> GPHY can be probed on the MDIO bus and it behaves like an external GPHY,
> without the firmware it can not be probed on the MDIO bus.
> 
> Currently this depends on SOC_TYPE_XWAY because the SoC revision
> detection function ltq_soc_type() is used to load the correct GPHY
> firmware on the VRX200 SoCs.
> 
> The clock names in the sysctrl.c file have to be changed because the
> clocks are now used by a different driver. This should be cleaned up and
> a real common clock driver should provide the clocks instead.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---

Looks great, just a few suggestions below

[snip]

> +static void gswip_adjust_link(struct dsa_switch *ds, int port,
> +			      struct phy_device *phydev)
> +{
> +	struct gswip_priv *priv = ds->priv;
> +	u16 macconf = phydev->mdio.addr & GSWIP_MDIO_PHY_ADDR_MASK;
> +	u16 miirate = 0;
> +	u16 miimode;
> +	u16 lcl_adv = 0, rmt_adv = 0;
> +	u8 flowctrl;
> +
> +	/* do not run this for the CPU port */
> +	if (dsa_is_cpu_port(ds, port))
> +		return;

Typically we expect the adjust_link callback to run for fixed link 
ports, that is inter-switch links (between switches) or between the CPU 
port and the Ethernet MAC attached to the switch. Here you are running 
this for the user facing ports (IIRC), which should really not be 
necessary, most Ethernet switches will be able to look at their built-in 
PHY's state and configure the switch's port automatically. Maybe this is 
not possible here because you had to disable polling?

Can you consider implementing PHYLINK operations which would make the 
driver more future proof, should you consider newer generations of 
switches that support 10G PHY, SGMII, SFP/SFF and so on?

[snip]

> +	if (priv->ds->dst->cpu_dp->index != priv->hw_info->cpu_port) {
> +		dev_err(dev, "wrong CPU port defined, HW only supports port: %i",
> +			priv->hw_info->cpu_port);
> +		err = -EINVAL;
> +		goto mdio_bus;
> +	}

There are a number of switches (b53, qca8k, mt7530) that have this 
requirement, we should probably be moving this check down into the core 
DSA layer and allow either to continue but disable switch tagging, if it 
was requested. Andrew what do you think?
-- 
Florian
