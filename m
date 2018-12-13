From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [v7, PATCH 1/2] net:stmmac: dwmac-mediatek: add support for
 mt2712
Date: Thu, 13 Dec 2018 13:33:46 +0100
Message-ID: <20181213123346.GF1605@lunn.ch>
References: <1544666173-5121-1-git-send-email-biao.huang@mediatek.com>
 <1544666173-5121-2-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544666173-5121-2-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, robh+dt@kernel.org, honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com
List-Id: devicetree@vger.kernel.org

Hi Biao

> +	case PHY_INTERFACE_MODE_RGMII:
> +		/* the PHY is not responsible for inserting any internal
> +		 * delay by itself in PHY_INTERFACE_MODE_RGMII case,
> +		 * so Ethernet MAC will insert delays for both transmit
> +		 * and receive path here.
> +		 */

What if the PCB designed has decided to do a kink in the clock to add
the delays? I don't think any of these delays should depend on the PHY
interface mode. It is up to the device tree writer to set both the PHY
delay and the MAC delay, based on knowledge of the board, including
any kicks in the tracks. The driver should then do what it is told.

> +	if (!of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps)) {
> +		if (tx_delay_ps < plat->variant->tx_delay_max) {
> +			mac_delay->tx_delay = tx_delay_ps;
> +		} else {
> +			dev_err(plat->dev, "Invalid TX clock delay: %dps\n", tx_delay_ps);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (!of_property_read_u32(plat->np, "mediatek,rx-delay-ps", &rx_delay_ps)) {
> +		if (rx_delay_ps < plat->variant->rx_delay_max) {
> +			mac_delay->rx_delay = rx_delay_ps;
> +		} else {
> +			dev_err(plat->dev, "Invalid RX clock delay: %dps\n", rx_delay_ps);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	mac_delay->tx_inv = of_property_read_bool(plat->np, "mediatek,txc-inverse");
> +	mac_delay->rx_inv = of_property_read_bool(plat->np, "mediatek,rxc-inverse");
> +	mac_delay->fine_tune = of_property_read_bool(plat->np, "mediatek,fine-tune");

Why is fine tune needed? If the requested delay can be done using fine
tune, it should use fine tune. If not, it should use rough tune. The
driver can work this out itself.

       Thanks
	Andrew
