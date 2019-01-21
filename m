From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 0/5] net: Add support for Qualcomm ethqos
Date: Mon, 21 Jan 2019 14:43:13 +0530
Message-ID: <20190121091318.20079-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David S Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>
List-Id: devicetree@vger.kernel.org

Some Qualcomm SoCs sport a ethqos controller which use DW ip, so add
the glue driver which uses stmmac driver along with DT bindings for
this device.

This controller supports rgmii mode and doesn't work with existing
phy drivers as they do not remove the phy delay delay in this mode,
so fix the two phy drivers tested with this.

Changes in v3:
 - Add description in DT and rename the file and compatible as suggested by
   Rob
 - Update changelog for QCA8K driver
 - Update AT803x phy disable delay for all RGMxx modes

Changes in v2:
 - Fix the example in dt-binding
 - Remove DT property for disable the delay and disable delay for RGMII mode
   in AT803x and QCA8K PHY drivers

Vinod Koul (5):
  dt-bindings: net: Add Qualcomm ethqos binding
  net: stmmac: Add driver for Qualcomm ethqos
  MAINTAINER: Add entry for Qualcomm ETHQOS ethernet driver
  net: phy: at803x: Disable phy delay for RGMII mode
  net: dsa: qca8k: disable delay for RGMII mode

 .../devicetree/bindings/net/qcom,ethqos.txt   |  64 ++
 MAINTAINERS                                   |   8 +
 drivers/net/dsa/qca8k.c                       |  16 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  10 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 545 ++++++++++++++++++
 drivers/net/phy/at803x.c                      |  22 +-
 7 files changed, 644 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.txt
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

-- 
2.20.1
