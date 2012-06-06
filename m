From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 0/2] EDAC support for Calxeda Highbank
Date: Wed,  6 Jun 2012 17:02:03 -0500
Message-ID: <1339020125-20198-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Doug Thompson <dougthompson@xmission.com>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

This series adds EDAC support for Calxeda Highbank platform L2 and
memory ECC hardware.

Rob

Rob Herring (2):
  edac: add support for Calxeda highbank memory controller
  edac: add support for Calxeda highbank L2 cache ecc

 .../devicetree/bindings/arm/calxeda/l2ecc.txt      |   17 ++
 .../devicetree/bindings/arm/calxeda/mem-ctrlr.txt  |   17 ++
 arch/arm/boot/dts/highbank.dts                     |   12 +
 drivers/edac/Kconfig                               |   16 +-
 drivers/edac/Makefile                              |    4 +
 drivers/edac/highbank_l2_edac.c                    |  149 ++++++++++++
 drivers/edac/highbank_mc_edac.c                    |  238 ++++++++++++++++++++
 7 files changed, 452 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/calxeda/l2ecc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/calxeda/mem-ctrlr.txt
 create mode 100644 drivers/edac/highbank_l2_edac.c
 create mode 100644 drivers/edac/highbank_mc_edac.c

-- 
1.7.9.5
