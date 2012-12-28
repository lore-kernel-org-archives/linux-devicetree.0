From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/4] mfd/regulator: tps65090: add DT support and suspend/resume cleanups
Date: Fri, 28 Dec 2012 14:59:37 +0530
Message-ID: <1356686981-4152-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com, sameo@linux.intel.com
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, lrg@ti.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

The patch series add DT support on TPS65090 device.

Also remove the suspend/resume implementation as it duplicates with
irq_suspend/irq_resume().

Laxman Dewangan (4):
  mfd: tps65090: add DT support for tps65090
  regulator: tps65090: add DT support
  mfd: tps65090: Pass irq domain when adding mfd sub devices
  mfd: tps65090: remove suspend/resume callbacks

 .../devicetree/bindings/regulator/tps65090.txt     |  121 ++++++++++++++++++++
 drivers/mfd/tps65090.c                             |   77 ++++++++----
 drivers/regulator/tps65090-regulator.c             |   96 +++++++++++++++-
 include/linux/mfd/tps65090.h                       |    1 +
 4 files changed, 266 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65090.txt

