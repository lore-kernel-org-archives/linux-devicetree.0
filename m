From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 10/10] net: mscc: ocelot: make use of SerDes
 PHYs for handling their configuration
Date: Mon, 30 Jul 2018 15:50:18 +0200
Message-ID: <20180730135018.GF13198@lunn.ch>
References: <cover.aa759035f6eefdd0bb2a5ae335dab5bd5399bd46.1532954208.git-series.quentin.schulz@bootlin.com>
 <0ce1b3e8466064741dc6e484f87bbe48542cb978.1532954208.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0ce1b3e8466064741dc6e484f87bbe48542cb978.1532954208.git-series.quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, f.fainelli@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, allan.nielsen@microsemi.com, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

 On Mon, Jul 30, 2018 at 02:43:55PM +0200, Quentin Schulz wrote:

> +		err = of_get_phy_mode(portnp);
> +		if (err < 0)
> +			ocelot->ports[port]->phy_mode = PHY_INTERFACE_MODE_NA;
> +		else
> +			ocelot->ports[port]->phy_mode = err;
> +
> +		if (ocelot->ports[port]->phy_mode == PHY_INTERFACE_MODE_NA)
> +			continue;
> +
> +		if (ocelot->ports[port]->phy_mode == PHY_INTERFACE_MODE_SGMII)
> +			phy_mode = PHY_MODE_SGMII;
> +		else
> +			phy_mode = PHY_MODE_QSGMII;

Hi Quentin

Say somebody puts RGMII as the phy-mode? It would be better to verify
it is only SGMII or QSGMII and return -EINVAL otherwise.

> +
> +		serdes = devm_of_phy_get(ocelot->dev, portnp, NULL);
> +		if (IS_ERR(serdes)) {
> +			if (PTR_ERR(serdes) == -EPROBE_DEFER) {
> +				dev_err(ocelot->dev, "deferring probe\n");

dev_dbg() ? It is not really an error.

> +				err = -EPROBE_DEFER;
> +				goto err_probe_ports;
> +			}
> +
> +			dev_err(ocelot->dev, "missing SerDes phys for port%d\n",
> +				port);
> +			err = -ENODEV;

err = PTR_ERR(serdes) so we get the actual error?

>  			goto err_probe_ports;
>  		}
> +
> +		ocelot->ports[port]->serdes = serdes;
>  	}
>  
>  	register_netdevice_notifier(&ocelot_netdevice_nb);


	Andrew
