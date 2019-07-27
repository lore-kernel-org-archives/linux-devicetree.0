From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next 3/3] net: dsa: mt7530: Add support for port 5
Date: Sat, 27 Jul 2019 18:38:36 +0000
Message-ID: <20190727183836.Horde.B4Y-dcWu5sojGbybcU-O1Qc@www.vdorst.com>
References: <20190724192549.24615-1-opensource@vdorst.com>
 <20190724192549.24615-4-opensource@vdorst.com>
 <f4a9e219-cd03-1512-874d-925c43e3c44f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <f4a9e219-cd03-1512-874d-925c43e3c44f@gmail.com>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Florian Fainelli <f.fainelli@gmail.com>:

> On 7/24/2019 9:25 PM, René van Dorst wrote:
>> Adding support for port 5.
>>
>> Port 5 can muxed/interface to:
>> - internal 5th GMAC of the switch; can be used as 2nd CPU port or as
>>   extra port with an external phy for a 6th ethernet port.
>> - internal PHY of port 0 or 4; Used in most applications so that port 0
>>   or 4 is the WAN port and interfaces with the 2nd GMAC of the SOC.
>>
>> Signed-off-by: René van Dorst <opensource@vdorst.com>
>
> [snip]
>
>> +	/* Setup port 5 */
>> +	priv->p5_intf_sel = P5_DISABLED;
>> +	interface = PHY_INTERFACE_MODE_NA;
>> +
>> +	if (!dsa_is_unused_port(ds, 5)) {
>> +		priv->p5_intf_sel = P5_INTF_SEL_GMAC5;
>> +		interface = of_get_phy_mode(ds->ports[5].dn);
>> +	} else {
>> +		/* Scan the ethernet nodes. Look for GMAC1, Lookup used phy */
>> +		for_each_child_of_node(dn, mac_np) {
>> +			if (!of_device_is_compatible(mac_np,
>> +						     "mediatek,eth-mac"))
>> +				continue;
>> +			_id = of_get_property(mac_np, "reg", NULL);
>> +			if (be32_to_cpup(_id)  != 1)
>> +				continue;
>> +
>> +			interface = of_get_phy_mode(mac_np);
>> +			phy_node = of_parse_phandle(mac_np, "phy-handle", 0);
>> +
>> +			if (phy_node->parent == priv->dev->of_node->parent) {
>> +				_id = of_get_property(phy_node, "reg", NULL);
>> +				id = be32_to_cpup(_id);
>> +				if (id == 0)
>> +					priv->p5_intf_sel = P5_INTF_SEL_PHY_P0;
>> +				if (id == 4)
>> +					priv->p5_intf_sel = P5_INTF_SEL_PHY_P4;
>

Hi Florian,

> Can you use of_mdio_parse_addr() here?

Yes that function be used.

Thanks for mention this function.

I see that I can refactor this scan routine a bit more.
Also I missing a of_node_put(phy_node) at the end.

> --
> Florian

Greats,

René
