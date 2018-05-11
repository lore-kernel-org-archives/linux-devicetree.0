From: Yao Chen <chenyao11@huawei.com>
Subject: [PATCH v3 0/2] Add MSI support
Date: Fri, 11 May 2018 17:15:47 +0800
Message-ID: <1526030149-23985-1-git-send-email-chenyao11@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: songxiaowei@hisilicon.com, wangbinghui@hisilicon.com, lorenzo.pieralisi@arm.com, bhelgaas@google.com, xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: dimitrysh@google.com, guodong.xu@linaro.org, chenyao11@huawei.com, suzhuangluan@hisilicon.com, kongfei@hisilicon.com
List-Id: devicetree@vger.kernel.org

Before Version Patches
======================
patch v2
https://www.spinics.net/lists/kernel/msg2797610.html

patch v1
https://www.spinics.net/lists/kernel/msg2796410.html

Changes between V3 and V2
=========================
1. fix issues according to review comments
   (1)from Bjorn Helgaas: Check for 'pci->pp.msi_irq < 0'.
   (2)from Bjorn Helgaas: Update the message of 'msi irq' in dev_err().

Changes between V2 and V1
=========================
1. seperate DT binding patch.
2. fix issues according to review comments
   (1)from Bjorn Helgaas: Update the style of subject and changelog.
   (2)from Bjorn Helgaas: Add msi irq number in the message.
   (3)from Bjorn Helgaas: Delete unnecessary code 'pci->pp.root_bus_nr = -1'.
   (4)from Dmitry Shmidt: Fix typing error. Replace 'interrupts-names' of 'interrupt-names'.

Yao Chen (2):
  PCI: kirin: Add MSI support
  arm64: dts: hi3660: Add pcie msi interrupt attribute

 arch/arm64/boot/dts/hisilicon/hi3660.dtsi |  2 ++
 drivers/pci/dwc/pcie-kirin.c              | 39 +++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

-- 
1.9.1
