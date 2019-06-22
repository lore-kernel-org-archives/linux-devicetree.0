From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: dts: rockchip: add ethernet phy node for tinker
 board
Date: Sat, 22 Jun 2019 19:55:08 +0200
Message-ID: <20190622175508.GE8497@lunn.ch>
References: <20190621180017.29646-1-katsuhiro@katsuster.net>
 <1871177.hjLhdHVgcu@phil>
 <ccf5ad2c-bd56-2d77-4728-d7906045e302@katsuster.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ccf5ad2c-bd56-2d77-4728-d7906045e302@katsuster.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>, Jose Abreu <joabreu@synopsys.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jun 22, 2019 at 11:50:10PM +0900, Katsuhiro Suzuki wrote:
> Hello,

Hi Katsuhiro

Please also report this to netdev, and the stmmac maintainers.

./scripts/get_maintainer.pl -f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
Giuseppe Cavallaro <peppe.cavallaro@st.com> (supporter:STMMAC ETHERNET DRIVER)
Alexandre Torgue <alexandre.torgue@st.com> (supporter:STMMAC ETHERNET DRIVER)
Jose Abreu <joabreu@synopsys.com> (supporter:STMMAC ETHERNET DRIVER)
"David S. Miller" <davem@davemloft.net> (odd fixer:NETWORKING DRIVERS)
Maxime Coquelin <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32 ARCHITECTURE)
netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER)
linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
linux-kernel@vger.kernel.org (open list)

> I have not bisect commit of root cause yet... Is it better to bisect
> and find problem instead of sending this patch?

My guess is that it is one of these three which broken it:

74371272f97f net: stmmac: Convert to phylink and remove phylib logic
eeef2f6b9f6e net: stmmac: Start adding phylink support
9ad372fc5aaf net: stmmac: Prepare to convert to phylink

	     Andrew
