From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 0/3] PCIE support for i.MX8MQ
Date: Wed,  5 Dec 2018 23:35:42 -0800
Message-ID: <20181206073545.10967-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, bhelgaas@google.com, Fabio Estevam <fabio.estevam@nxp.com>, cphealy@gmail.com, l.stach@pengutronix.de, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Everyone:

This series contains changes I made in order to enable support of PCIE
IP block on i.MX8MQ SoCs (full tree can be found at [github-v2]).

NOTE: The last patch have a Kconfig symbol depenency on [imx8mq-kconfig].

Changes since [v1]:

 - Driver changed to use single "fsl,controller-id" property to
   distinguish between two intances of PCIE IP block

 - All code pertaining to L1SS was dropped to simplify the patch

 - Documented additions to DT bindings

Feedback is welcome!

Thanks,
Andrey Smirnov

[v1] https://lore.kernel.org/linux-arm-kernel/20181117181225.10737-1-andrew.smirnov@gmail.com/
[github-v2] https://github.com/ndreys/linux/commits/imx8mq-pcie-v2
[imx8mq-kconfig] https://lore.kernel.org/linux-arm-kernel/20181114175242.12468-1-l.stach@pengutronix.de/

Andrey Smirnov (3):
  PCI: imx: No-op imx6_setup_phy_mpll() on i.MX7D
  PCI: imx: No-op imx6_pcie_reset_phy() on i.MX7D
  PCI: imx: Add support for i.MX8MQ

 .../bindings/pci/fsl,imx6q-pcie.txt           |  6 +-
 drivers/pci/controller/dwc/Kconfig            |  2 +-
 drivers/pci/controller/dwc/pci-imx6.c         | 87 ++++++++++++++++++-
 3 files changed, 90 insertions(+), 5 deletions(-)

-- 
2.19.1
