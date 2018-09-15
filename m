From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v3 11/11] net: mscc: ocelot: make use of SerDes
 PHYs for handling their configuration
Date: Sat, 15 Sep 2018 14:25:05 -0700
Message-ID: <0f762d63-a392-d2fe-a121-a013a13a8584@gmail.com>
References: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
 <00989856964175eafbe1435a70862c2ac66cffc0.1536912834.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <00989856964175eafbe1435a70862c2ac66cffc0.1536912834.git-series.quentin.schulz@bootlin.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>, alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org



On 09/14/18 01:16, Quentin Schulz wrote:
> Previously, the SerDes muxing was hardcoded to a given mode in the MAC
> controller driver. Now, the SerDes muxing is configured within the
> Device Tree and is enforced in the MAC controller driver so we can have
> a lot of different SerDes configurations.
> 
> Make use of the SerDes PHYs in the MAC controller to set up the SerDes
> according to the SerDes<->switch port mapping and the communication mode
> with the Ethernet PHY.

This looks good, just a few comments below:

[snip]

> +		err = of_get_phy_mode(portnp);
> +		if (err < 0)
> +			ocelot->ports[port]->phy_mode = PHY_INTERFACE_MODE_NA;
> +		else
> +			ocelot->ports[port]->phy_mode = err;
> +
> +		switch (ocelot->ports[port]->phy_mode) {
> +		case PHY_INTERFACE_MODE_NA:
> +			continue;

Would not you want to issue a message indicating that the Device Tree
must be updated here? AFAICT with your patch series, this should no
longer be a condition that you will hit unless you kept the old DTB
around, right?

> +		case PHY_INTERFACE_MODE_SGMII:
> +			phy_mode = PHY_MODE_SGMII;
> +			break;
> +		case PHY_INTERFACE_MODE_QSGMII:
> +			phy_mode = PHY_MODE_QSGMII;
> +			break;
> +		default:
> +			dev_err(ocelot->dev,
> +				"invalid phy mode for port%d, (Q)SGMII only\n",
> +				port);
> +			return -EINVAL;
> +		}
> +
> +		serdes = devm_of_phy_get(ocelot->dev, portnp, NULL);
> +		if (IS_ERR(serdes)) {
> +			err = PTR_ERR(serdes);
> +			if (err == -EPROBE_DEFER) {

This can be simplified into:

			if (err == -EPROBE_DEFER)
				dev_dbg();
			else
				dev_err();
			goto err_probe_ports;

> +				dev_dbg(ocelot->dev, "deferring probe\n");
> +				goto err_probe_ports;
> +			}
> +
> +			dev_err(ocelot->dev, "missing SerDes phys for port%d\n",
> +				port);
>  			goto err_probe_ports;
>  		}
> +
> +		ocelot->ports[port]->serdes = serdes;
>  	}
>  
>  	register_netdevice_notifier(&ocelot_netdevice_nb);
> 

-- 
Florian
