From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH  0/5] net: ethernet: stmmac: some fixes and optimization
Date: Fri, 20 Sep 2019 07:38:12 +0200
Message-ID: <20190920053817.13754-1-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, christophe.roullier@st.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

Some improvements (manage syscfg as optional clock, update slew rate of
ETH_MDIO pin, Enable gating of the MAC TX clock during TX low-power mode)
Fix warning build message when W=1

Christophe Roullier (5):
  net: ethernet: stmmac: Add support for syscfg clock
  net: ethernet: stmmac: fix warning when w=1 option is used during
    build
  ARM: dts: stm32: remove syscfg clock on stm32mp157c ethernet
  ARM: dts: stm32: adjust slew rate for Ethernet
  ARM: dts: stm32: Enable gating of the MAC TX clock during TX low-power
    mode on stm32mp157c

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi     |  9 +++-
 arch/arm/boot/dts/stm32mp157c.dtsi            |  7 ++--
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 42 ++++++++++++-------
 3 files changed, 38 insertions(+), 20 deletions(-)

-- 
2.17.1
