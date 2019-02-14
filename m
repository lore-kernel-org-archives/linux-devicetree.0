From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH  2/8] net: ethernet: stmmac: update to support all PHY
 config for stm32mp157c.
Date: Thu, 14 Feb 2019 14:40:40 +0100
Message-ID: <20190214134040.GA5699@lunn.ch>
References: <1550126763-22669-1-git-send-email-christophe.roullier@st.com>
 <1550126763-22669-3-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550126763-22669-3-git-send-email-christophe.roullier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Roullier <christophe.roullier@st.com>
Cc: robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

 On Thu, Feb 14, 2019 at 07:45:57AM +0100, Christophe Roullier wrote:
> @@ -131,19 +185,19 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_RGMII:
>  		val = SYSCFG_PMCR_ETH_SEL_RGMII;
> -		if (dwmac->int_phyclk)
> +		if (dwmac->eth_clk_sel_reg)
>  			val |= SYSCFG_PMCR_ETH_CLK_SEL;
>  		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RGMII\n");
>  		break;

Hi Christophe

This code should handle all 4 PHY_INTERFACE_MODE_RGMII* values.

     Andrew
