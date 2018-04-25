From: Christophe ROULLIER <christophe.roullier@st.com>
Subject: RE: [PATCH  1/8] net: ethernet: stmmac: add adaptation for
 stm32mp157c.
Date: Wed, 25 Apr 2018 07:12:29 +0000
Message-ID: <fa12bb221b1b4cf380812c0fed03f74d@SFHDAG5NODE3.st.com>
References: <1524582120-4451-1-git-send-email-christophe.roullier@st.com>
 <1524582120-4451-2-git-send-email-christophe.roullier@st.com>
 <20180424153953.GB2360@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180424153953.GB2360@lunn.ch>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Peppe CAVALLARO <peppe.cavallaro@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

For moment, I've only tested with PHY RGMII, RMII, MII, GMII, I do not have other kind of PHY interface.
Normally there is no impact in my glue, the value of syscfg register will be the same for RGMII/ID/TXID/RXID.
Do you think that I should add these interfaces in my case ?

	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
		val = SYSCFG_PMCR_ETH_SEL_RGMII;
		if (dwmac->int_phyclk)
			val |= SYSCFG_PMCR_ETH_CLK_SEL;
		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RGMII\n");
		break;

Christophe.

-----Original Message-----
From: Andrew Lunn [mailto:andrew@lunn.ch] 
Sent: mardi 24 avril 2018 17:40
To: Christophe ROULLIER <christophe.roullier@st.com>
Cc: mark.rutland@arm.com; mcoquelin.stm32@gmail.com; Alexandre TORGUE <alexandre.torgue@st.com>; Peppe CAVALLARO <peppe.cavallaro@st.com>; devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; netdev@vger.kernel.org
Subject: Re: [PATCH 1/8] net: ethernet: stmmac: add adaptation for stm32mp157c.

On Tue, Apr 24, 2018 at 05:01:53PM +0200, Christophe Roullier wrote:

> +	case PHY_INTERFACE_MODE_RGMII:
> +		val = SYSCFG_PMCR_ETH_SEL_RGMII;
> +		if (dwmac->int_phyclk)
> +			val |= SYSCFG_PMCR_ETH_CLK_SEL;
> +		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RGMII\n");
> +		break;

Hi Christophe

What about PHY_INTERFACE_MODE_RGMII_ID, PHY_INTERFACE_MODE_RGMII_RXID and PHY_INTERFACE_MODE_RGMII_TXID.

    Andrew
