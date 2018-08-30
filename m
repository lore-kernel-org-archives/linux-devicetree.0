From: Hanjie Lin <hanjie.lin@amlogic.com>
Subject: [PATCH v3 0/2] add the Amlogic Meson PCIe controller driver
Date: Thu, 30 Aug 2018 16:13:47 +0800
Message-ID: <1535616829-167936-1-git-send-email-hanjie.lin@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Hanjie Lin <hanjie.lin@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Yixun Lan <yixun.lan@amlogic.com>, Liang Yang <liang.yang@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Amlogic Meson PCIe host controller is based on the Synopsys DesignWare
PCI core. This patchset add the driver and dt-bindings of the controller.

Till patch v2, we have a dedicated phy driver which only process reset job.
It's too overkill so we integrate phy driver into the controller.

Changes since v2: [1]
 - abandon phy driver, move reset to the controller
 - use devm_add_action_or_reset() to use clock res
 - format correcting

Changes since v1: [0]
 - use gpio lib instead open code 
 - move 'apb' and 'port' reset from phy driver
 - format correcting

[0] :  https://lkml.kernel.org/r/1534227522-186798-1-git-send-email-hanjie.lin@amlogic.com
[1] :  https://lkml.kernel.org/r/1535096165-45827-1-git-send-email-hanjie.lin@amlogic.com 

Yue Wang (2):
  dt-bindings: PCI: meson: add DT bindings for Amlogic Meson PCIe
    controller
  PCI: meson: add the Amlogic Meson PCIe controller driver

 .../devicetree/bindings/pci/amlogic,meson-pcie.txt |  70 +++
 drivers/pci/controller/dwc/Kconfig                 |  12 +
 drivers/pci/controller/dwc/Makefile                |   1 +
 drivers/pci/controller/dwc/pci-meson.c             | 617 +++++++++++++++++++++
 4 files changed, 700 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
 create mode 100644 drivers/pci/controller/dwc/pci-meson.c

-- 
2.7.4
