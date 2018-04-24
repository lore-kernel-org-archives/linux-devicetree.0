From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH  0/8] net: ethernet: stmmac: add support for stm32mp1
Date: Tue, 24 Apr 2018 17:01:52 +0200
Message-ID: <1524582120-4451-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, christophe.roullier@st.com
List-Id: devicetree@vger.kernel.org

Patches to have Ethernet support on stm32mp1

Christophe Roullier (8):
  net: ethernet: stmmac: add adaptation for stm32mp157c.
  dt-bindings: stm32-dwmac: add support of MPU families
  ARM: dts: stm32: add ethernet pins to stm32mp157c
  ARM: dts: stm32: Add syscfg on stm32mp1
  ARM: dts: stm32: Add ethernet dwmac on stm32mp1
  net: stmmac: add dwmac-4.20a compatible
  ARM: dts: stm32: add support of ethernet on stm32mp157c-ev1
  dt-bindings: stm32: add compatible for syscon

 Documentation/devicetree/bindings/arm/stm32.txt    |   7 +
 .../devicetree/bindings/net/stm32-dwmac.txt        |  16 +-
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          |  46 ++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts              |  20 ++
 arch/arm/boot/dts/stm32mp157c.dtsi                 |  35 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c  | 267 +++++++++++++++++++--
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |   3 +-
 7 files changed, 376 insertions(+), 18 deletions(-)

-- 
1.9.1
