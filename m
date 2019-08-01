From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next 1/3] net: dsa: mt7530: Convert to PHYLINK API
Date: Thu, 01 Aug 2019 17:21:04 +0000
Message-ID: <20190801172104.Horde.Cuwt4jywUX_mcO9-n8QpWTN@www.vdorst.com>
References: <20190724192549.24615-1-opensource@vdorst.com>
 <20190724192549.24615-2-opensource@vdorst.com>
 <20190727184828.GT1330@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190727184828.GT1330@shell.armlinux.org.uk>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, Russell King - ARM Linux admin <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

Quoting Russell King - ARM Linux admin <linux@armlinux.org.uk>:

> Hi,
>
> Just a couple of minor points.
>
> On Wed, Jul 24, 2019 at 09:25:47PM +0200, René van Dorst wrote:

<snip>

>> +
>> +static void mt7530_phylink_validate(struct dsa_switch *ds, int port,
>> +				    unsigned long *supported,
>> +				    struct phylink_link_state *state)
>> +{
>> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
>> +
>> +	switch (port) {
>> +	case 0: /* Internal phy */
>> +	case 1:
>> +	case 2:
>> +	case 3:
>> +	case 4:
>> +		if (state->interface != PHY_INTERFACE_MODE_NA &&
>> +		    state->interface != PHY_INTERFACE_MODE_GMII)
>> +			goto unsupported;
>> +		break;
>> +	/* case 5: Port 5 not supported! */
>> +	case 6: /* 1st cpu port */
>> +		if (state->interface != PHY_INTERFACE_MODE_NA &&
>> +		    state->interface != PHY_INTERFACE_MODE_RGMII &&
>> +		    state->interface != PHY_INTERFACE_MODE_TRGMII)
>> +			goto unsupported;
>> +		break;
>> +	default:
>> +		linkmode_zero(supported);
>> +		dev_err(ds->dev, "%s: unsupported port: %i\n", __func__, port);
>
> You could reorder this as:
>
> 	default:
> 		dev_err(ds->dev, "%s: unsupported port: %i\n", __func__, port);
> 	unsupported:
> 		linkmode_zero(supported);
>

Hi David,

> and save having the "unsupported" at the end of the function.  Not sure
> what DaveM would think of it though.

Can you give your option about this?
So I know what to do with it and make a new series.

Greats,

René

>
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> According to speedtest.net: 11.9Mbps down 500kbps up
