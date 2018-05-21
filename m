From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH V3 0/8] net: ethernet: stmmac: add support for stm32mp1
Date: Mon, 21 May 2018 10:07:18 +0200
Message-ID: <1526890046-10565-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, christophe.roullier@st.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

Patches to have Ethernet support on stm32mp1
Changelog:
Remark from Rob Herring
In Documentation/devicetree/bindings/arm/stm32.txt:
In arch/arm/boot/dts/stm32mp157c.dtsi:
Add "st,stm32mp157-syscfg" compatible

Christophe Roullier (8):
  net: ethernet: stmmac: add adaptation for stm32mp157c.
  dt-bindings: stm32-dwmac: add support of MPU families
  ARM: dts: stm32: add ethernet pins to stm32mp157c
  ARM: dts: stm32: Add syscfg on stm32mp1
  ARM: dts: stm32: Add ethernet dwmac on stm32mp1
  net: stmmac: add dwmac-4.20a compatible
  ARM: dts: stm32: add support of ethernet on stm32mp157c-ev1
  dt-bindings: stm32: add compatible for syscon

 Documentation/devicetree/bindings/arm/stm32.txt    |   5 +
 .../devicetree/bindings/net/stm32-dwmac.txt        |  18 +-
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          |  46 ++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts              |  20 ++
 arch/arm/boot/dts/stm32mp157c.dtsi                 |  35 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c  | 270 +++++++++++++++++++--
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |   3 +-
 7 files changed, 379 insertions(+), 18 deletions(-)

-- 
1.9.1
