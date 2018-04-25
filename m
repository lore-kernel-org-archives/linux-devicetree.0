From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH  1/8] net: ethernet: stmmac: add adaptation for
 stm32mp157c.
Date: Wed, 25 Apr 2018 14:40:06 +0200
Message-ID: <20180425124006.GB13486@lunn.ch>
References: <1524582120-4451-1-git-send-email-christophe.roullier@st.com>
 <1524582120-4451-2-git-send-email-christophe.roullier@st.com>
 <20180424153953.GB2360@lunn.ch>
 <fa12bb221b1b4cf380812c0fed03f74d@SFHDAG5NODE3.st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fa12bb221b1b4cf380812c0fed03f74d@SFHDAG5NODE3.st.com>
Sender: netdev-owner@vger.kernel.org
To: Christophe ROULLIER <christophe.roullier@st.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Peppe CAVALLARO <peppe.cavallaro@st.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 25, 2018 at 07:12:29AM +0000, Christophe ROULLIER wrote:
> Hi Andrew,
> 
> For moment, I've only tested with PHY RGMII, RMII, MII, GMII, I do not have other kind of PHY interface.
> Normally there is no impact in my glue, the value of syscfg register will be the same for RGMII/ID/TXID/RXID.
> Do you think that I should add these interfaces in my case ?
> 
> 	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:

Yes

	Andrew
