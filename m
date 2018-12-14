From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [v7, PATCH 1/2] net:stmmac: dwmac-mediatek: add support for
 mt2712
Date: Thu, 13 Dec 2018 21:11:54 -0800
Message-ID: <f3427cac-88b2-1464-8f92-4692a7125674@gmail.com>
References: <1544666173-5121-1-git-send-email-biao.huang@mediatek.com>
 <1544666173-5121-2-git-send-email-biao.huang@mediatek.com>
 <20181213123346.GF1605@lunn.ch> <1544756477.24219.164.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544756477.24219.164.camel@mhfsdcap03>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: biao huang <biao.huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, nelson.chang@mediatek.com, netdev@vger.kernel.org, liguo.zhang@mediatek.com, joabreu@synopsys.com, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, honghui.zhang@mediatek.com, yt.shen@mediatek.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Le 12/13/18 à 7:01 PM, biao huang a écrit :
> Dear Andrew,
> 	Thanks for your comments.
> 
> On Thu, 2018-12-13 at 13:33 +0100, Andrew Lunn wrote:
>> Hi Biao
>>
>>> +	case PHY_INTERFACE_MODE_RGMII:
>>> +		/* the PHY is not responsible for inserting any internal
>>> +		 * delay by itself in PHY_INTERFACE_MODE_RGMII case,
>>> +		 * so Ethernet MAC will insert delays for both transmit
>>> +		 * and receive path here.
>>> +		 */
>>
>> What if the PCB designed has decided to do a kink in the clock to add
>> the delays? I don't think any of these delays should depend on the PHY
>> interface mode. It is up to the device tree writer to set both the PHY
>> delay and the MAC delay, based on knowledge of the board, including
>> any kicks in the tracks. The driver should then do what it is told.
>>
> Originally, we recommend equal trace length on PCB, which means that
> RGMII delay by PCB traces is not recommended. so only PHY/MAC delay is
> taken into account in the transmit/receive path.
> 
> as you described above, maybe the equal PCB trace length assumption is
> not reasonable, and we'll only handle MAC delay-ps in our driver based
> on the device tree information no matter which rgmii is selected.

Expecting identical PCB traces is something that is hard to enforce with
external customers, for internal reference boards, absolutely they
should have those traces of equal length.

> 
> Since David already applied this patch, I'll send another patch to fix
> this issue.
>>> +	if (!of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps)) {
>>> +		if (tx_delay_ps < plat->variant->tx_delay_max) {
>>> +			mac_delay->tx_delay = tx_delay_ps;
>>> +		} else {
>>> +			dev_err(plat->dev, "Invalid TX clock delay: %dps\n", tx_delay_ps);
>>> +			return -EINVAL;
>>> +		}
>>> +	}
>>> +
>>> +	if (!of_property_read_u32(plat->np, "mediatek,rx-delay-ps", &rx_delay_ps)) {
>>> +		if (rx_delay_ps < plat->variant->rx_delay_max) {
>>> +			mac_delay->rx_delay = rx_delay_ps;
>>> +		} else {
>>> +			dev_err(plat->dev, "Invalid RX clock delay: %dps\n", rx_delay_ps);
>>> +			return -EINVAL;
>>> +		}
>>> +	}
>>> +
>>> +	mac_delay->tx_inv = of_property_read_bool(plat->np, "mediatek,txc-inverse");
>>> +	mac_delay->rx_inv = of_property_read_bool(plat->np, "mediatek,rxc-inverse");
>>> +	mac_delay->fine_tune = of_property_read_bool(plat->np, "mediatek,fine-tune");
>>
>> Why is fine tune needed? If the requested delay can be done using fine
>> tune, it should use fine tune. If not, it should use rough tune. The
>> driver can work this out itself.
> 
> find tune here represents a more accurate delay circuit than coarse
> tune, and it's a parallel circuit of coarse tune.
> For most delay, both fine and coarse tune can meet the requirement.
> It's up to the user to select which one.
> 
> But only one of them can work at the same time, so we need a switch
> flag(fine_tune here) to indicate which one is valid.
> Driver can hardly work out which one is working according to delay-ps.
> 
> Please correct me if any misunderstanding.

You are giving a lot of options for users of this Ethernet controller to
shoot themselves in the feet and spend a good amount of time debugging
why their RGMII connection is not reliable or have timing violations.
-- 
Florian
