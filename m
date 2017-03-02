From: matthew.gerlach@linux.intel.com
Subject: [PATCH v4 0/4] Altera Partial Reconfiguration IP
Date: Thu,  2 Mar 2017 07:57:08 -0800
Message-ID: <1488470232-20412-1-git-send-email-matthew.gerlach@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: atull@opensource.altera.com, moritz.fischer@ettus.com, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

This set of patches implements a fpga-mgr driver for the Altera Partial
Reconfiguration IP.  The driver depends on a patch from Alan Tull that
adds a config complete timeout.  The driver code itself is divided into
core functions and functions to implement a platform driver. It is
expected that drivers for other buses like PCIe would also use the core
functions.

Alan Tull (1):
  fpga: add config complete timeout

Matthew Gerlach (3):
  fpga pr ip: Core driver support for Altera Partial Reconfiguration IP.
  fpga dt: bindings for Altera Partial Reconfiguration IP.
  fpga pr ip: Platform driver for Altera Partial Reconfiguration IP.

 .../devicetree/bindings/fpga/altera-pr-ip.txt      |  12 ++
 drivers/fpga/Kconfig                               |  12 ++
 drivers/fpga/Makefile                              |   2 +
 drivers/fpga/altera-pr-ip-core-plat.c              |  65 ++++++
 drivers/fpga/altera-pr-ip-core.c                   | 217 +++++++++++++++++++++
 drivers/fpga/altera-pr-ip-core.h                   |  29 +++
 drivers/fpga/fpga-region.c                         |   3 +
 include/linux/fpga/fpga-mgr.h                      |   3 +
 8 files changed, 343 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
 create mode 100644 drivers/fpga/altera-pr-ip-core-plat.c
 create mode 100644 drivers/fpga/altera-pr-ip-core.c
 create mode 100644 drivers/fpga/altera-pr-ip-core.h

-- 
2.7.4
