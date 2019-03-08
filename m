From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH V3 0/6] stmmac: add some fixes for stm32
Date: Fri, 08 Mar 2019 11:48:33 -0800 (PST)
Message-ID: <20190308.114833.2009759493574418516.davem@davemloft.net>
References: <1551774568-11732-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551774568-11732-1-git-send-email-christophe.roullier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: christophe.roullier@st.com
Cc: robh@kernel.org, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

From: Christophe Roullier <christophe.roullier@st.com>
Date: Tue, 5 Mar 2019 09:29:22 +0100

> For common stmmac:
> 	- Add support to set CSR Clock range selection in DT
> For stm32mpu:
> 	- Glue codes to support magic packet
> 	- Glue codes to support all PHY config :
> 		PHY_MODE (MII,GMII, RMII, RGMII) and in normal,
> 		PHY wo crystal (25Mhz),
> 		PHY wo crystal (50Mhz), No 125Mhz from PHY config
> For stm32mcu:
> 	- Add Ethernet support for stm32h7
> 
> Changes in V3:
> 	- Reverse for syscfg management because it is manage by these patches
> 	  https://lkml.org/lkml/2018/12/12/133
> 	  https://lkml.org/lkml/2018/12/12/134
> 	  https://lkml.org/lkml/2018/12/12/131
> 	  https://lkml.org/lkml/2018/12/12/132

Series applied, thanks.
