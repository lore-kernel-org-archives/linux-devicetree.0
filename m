From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/2] net:stmmac: dwmac-mediatek: add support for mt2712
Date: Mon, 29 Oct 2018 13:27:31 +0100
Message-ID: <20181029122731.GA9174@lunn.ch>
References: <1540782294-27721-1-git-send-email-biao.huang@mediatek.com>
 <1540782294-27721-2-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1540782294-27721-2-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, robh+dt@kernel.org, honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, sean.wang@mediatek.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com
List-Id: devicetree@vger.kernel.org

> +static int mt2712_config_dt(struct mediatek_dwmac_plat_data *plat)
> +{
> +	u32 mac_timings[4];
> +
> +	plat->peri_regmap = syscon_regmap_lookup_by_compatible("mediatek,mt2712-pericfg");
> +	if (IS_ERR(plat->peri_regmap)) {
> +		dev_err(plat->dev, "Failed to get pericfg syscon\n");
> +		return PTR_ERR(plat->peri_regmap);
> +	}
> +
> +	if (!of_property_read_u32_array(plat->np, "mac-delay", mac_timings,
> +					ARRAY_SIZE(mac_timings))) {
> +		plat->mac_delay.tx_delay = mac_timings[0];
> +		plat->mac_delay.rx_delay = mac_timings[1];
> +		plat->mac_delay.tx_inv = mac_timings[2];
> +		plat->mac_delay.rx_inv = mac_timings[3];
> +	}
> +
> +	plat->fine_tune = of_property_read_bool(plat->np, "fine-tune");
> +
> +	plat->rmii_rxc = of_property_read_bool(plat->np, "rmii-rxc");

Please add document for these properties in the binding.

Ideally, you should reuse the binding that some of the other stmmac
glue layer uses. e.g. there is already allwinner,tx-delay-ps,
allwinner,rx-delay-ps.

       Thanks
              Andrew
