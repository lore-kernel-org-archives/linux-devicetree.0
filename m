From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH  1/8] net: ethernet: stmmac: add adaptation for
 stm32mp157c.
Date: Tue, 24 Apr 2018 17:39:53 +0200
Message-ID: <20180424153953.GB2360@lunn.ch>
References: <1524582120-4451-1-git-send-email-christophe.roullier@st.com>
 <1524582120-4451-2-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524582120-4451-2-git-send-email-christophe.roullier@st.com>
Sender: netdev-owner@vger.kernel.org
To: Christophe Roullier <christophe.roullier@st.com>
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2018 at 05:01:53PM +0200, Christophe Roullier wrote:

> +	case PHY_INTERFACE_MODE_RGMII:
> +		val = SYSCFG_PMCR_ETH_SEL_RGMII;
> +		if (dwmac->int_phyclk)
> +			val |= SYSCFG_PMCR_ETH_CLK_SEL;
> +		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RGMII\n");
> +		break;

Hi Christophe

What about PHY_INTERFACE_MODE_RGMII_ID, PHY_INTERFACE_MODE_RGMII_RXID
and PHY_INTERFACE_MODE_RGMII_TXID.

    Andrew
