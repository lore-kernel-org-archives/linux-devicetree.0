From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/8] net: ethernet: stmmac: update to support all PHY
 config for stm32mp157c.
Date: Thu, 14 Feb 2019 16:15:40 +0100
Message-ID: <20190214151540.GG708@lunn.ch>
References: <1550126763-22669-1-git-send-email-christophe.roullier@st.com>
 <1550126763-22669-3-git-send-email-christophe.roullier@st.com>
 <20190214134040.GA5699@lunn.ch>
 <02cd7773-899f-b28a-ff61-849b17cbe82d@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <02cd7773-899f-b28a-ff61-849b17cbe82d@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe ROULLIER <christophe.roullier@st.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "joabreu@synopsys.com" <joabreu@synopsys.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Peppe CAVALLARO <peppe.cavallaro@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> Sorry, I've misunderstood your question ;-)
> 
> And you spoke about :
> 
> case PHY_INTERFACE_MODE_RGMII:
> case PHY_INTERFACE_MODE_RGMII_ID:
> case PHY_INTERFACE_MODE_RGMII_RXID:
> case PHY_INTERFACE_MODE_RGMII_TXID:
> 
> So in my setup I've only RGMII interface, so I've never tested 3 others 
> interfaces (_ID, _RXID, _TXID).
> 
> So do I need to add cases in my driver ?

Yes. They all indicate the MAC should be using RGMII.

This appears to be an old issue, but now would be a good time to fix
it.

     Andrew
