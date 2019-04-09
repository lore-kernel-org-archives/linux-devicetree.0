From: richard.gong@linux.intel.com
Subject: [PATCHv1 0/6] add Intel Stratix10 remote system update driver
Date: Tue,  9 Apr 2019 13:45:56 -0500
Message-ID: <1554835562-25056-1-git-send-email-richard.gong@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, richard.gong@linux.intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

From: Richard Gong <richard.gong@intel.com>

This is the 1st submission of Intel Stratix10 remote system update (RSU)
driver, which includes 6 patches below:
	patch #1 - extend Intel Stratix10 service layer to support RSU
		   notify feature.
	patch #2 - add Intel Stratix10 remote system update binding
	patch #3 - add Intel Stratix10 remote system update to the device
		   tree
	patch #4 - add Intel Stratix10 remote system update driver
	patch #5 - RSU document sysfs interface
	patch #6 - add maintainer for Intel Stratix10 firmware drivers

Intel Stratix10 remote system update driver patches have been reviewed by
Alan Tull and other colleagues at Intel.

The Intel Stratix10 Remote System Update (RSU) driver exposes interfaces
access through the Intel Stratix10 Service Layer to user space via sysfs
interface. The RSU interfaces report and control some of the optional RSU
features on Intel Stratix 10 SoC.

The RSU feature provides a way for customers to update the boot
configuration of a Intel Stratix 10 SoC device with significantly reduced
risk of corrupting the bitstream storage and bricking the system.

Richard Gong (6):
  firmware: stratix10-svc: add to support RSU notify
  dt-bindings, firmware: add Intel Stratix10 remote system update
    binding
  arm64: dts: stratix10: add remote system update
  firmware: add Intel Stratix10 remote system update driver
  firmware: rsu: document sysfs interface
  MAINTAINERS: add maintainer for Intel Stratix10 FW drivers

 .../testing/sysfs-devices-platform-stratix10-rsu   |  78 ++++
 .../bindings/firmware/intel,stratix10-rsu.txt      |  31 ++
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   4 +
 drivers/firmware/Kconfig                           |  18 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/stratix10-rsu.c                   | 428 +++++++++++++++++++++
 drivers/firmware/stratix10-svc.c                   |  43 ++-
 include/linux/firmware/intel/stratix10-smc.h       |  17 +
 .../linux/firmware/intel/stratix10-svc-client.h    |   6 +-
 10 files changed, 622 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
 create mode 100644 Documentation/devicetree/bindings/firmware/intel,stratix10-rsu.txt
 create mode 100644 drivers/firmware/stratix10-rsu.c

-- 
2.7.4
