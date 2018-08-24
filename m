From: Hanjie Lin <hanjie.lin@amlogic.com>
Subject: [PATCH v2 0/2] add the Amlogic Meson PCIe phy driver
Date: Fri, 24 Aug 2018 15:33:24 +0800
Message-ID: <1535096006-152091-1-git-send-email-hanjie.lin@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Liang Yang <liang.yang@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-pci@vger.kernel.org, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patcheset add the driver and dt-bindings for
the Meson-PCIE-PHY controller.

Changes since v1: [0]
 - move 'apb' and 'port' reset to ctrl driver
 - format correcting

[0] : https://lkml.org/lkml/2018/8/14/66 

Yue Wang (2):
  dt-bindings: phy: add DT bindings for Amlogic Meson PCIe Phy
    controller
  PCI: meson: add the Amlogic Meson PCIe phy driver

 .../bindings/phy/amlogic,meson-pcie-phy.txt        |  21 ++++
 drivers/phy/amlogic/Kconfig                        |   8 ++
 drivers/phy/amlogic/Makefile                       |   1 +
 drivers/phy/amlogic/phy-meson-axg-pcie.c           | 124 +++++++++++++++++++++
 4 files changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-pcie-phy.txt
 create mode 100644 drivers/phy/amlogic/phy-meson-axg-pcie.c

-- 
2.7.4
