From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 0/7] net: Add support for Qualcomm ethqos
Date: Wed,  2 Jan 2019 14:47:22 +0530
Message-ID: <20190102091729.18582-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>
List-Id: devicetree@vger.kernel.org

Some Qualcomm SoCs sport a ethqos controller which use DW ip, so add
the glue driver which uses stmmac driver along with DT bindings for
this device.

This controller supports rgmii mode and doesn't work with existing
phy drivers as they do not remove the phy delay delay in this mode,
so add a DT property and disable the delay when this property is
present, this is done for two phys at803x and qca8k.

Vinod Koul (7):
  dt-bindings: net: Add Qualcomm ethqos binding
  net: stmmac: Add driver for Qualcomm ethqos
  dt-bindings: net: stmmac: Add the bindings documentation for delays
  MAINTAINER: Add entry for Qualcomm ETHQOS ethernet driver
  net: phy: at803x: Rework at803x_config_init()
  net: phy: at803x: Add support to disable tx/rx delays
  net: dsa: qca8k: handle disable tx/rx delay

 .../devicetree/bindings/net/qcom,dwmac.txt    | 129 +++++
 .../devicetree/bindings/net/stmmac.txt        |   2 +
 MAINTAINERS                                   |   8 +
 drivers/net/dsa/qca8k.c                       |  27 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  10 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 545 ++++++++++++++++++
 drivers/net/phy/at803x.c                      |  48 +-
 8 files changed, 758 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,dwmac.txt
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

-- 
2.20.1
