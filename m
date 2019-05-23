From: richard.gong@linux.intel.com
Subject: [PATCHv3 0/4] add Intel Stratix10 remote system update driver
Date: Thu, 23 May 2019 08:03:26 -0500
Message-ID: <1558616610-499-1-git-send-email-richard.gong@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, richard.gong@linux.intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

From: Richard Gong <richard.gong@intel.com>

Since version 2 submission is too late for kernel 5.2, I submit version 3
of Intel Stratix10 Remote System Update (RSU) drive for kernel 5.3.

There is only one additional change in version 3 patch sets, which updates
kernel version to 5.3 in sysfs interface document.

Intel Stratix10 remote system update driver patches have been reviewed by
Alan Tull and other colleagues at Intel.

The Intel Stratix10 Remote System Update driver exposes interfaces
access through the Intel Stratix10 Service Layer to user space via sysfs
interface. The RSU interfaces report and control some of the optional RSU
features on Intel Stratix 10 SoC.

The RSU feature provides a way for customers to update the boot
configuration of a Intel Stratix 10 SoC device with significantly reduced
risk of corrupting the bitstream storage and bricking the system.

v3: changed kernel version from 5.2 to 5.3 in RSU sysfs interface document
v2: removed compatible = "intel,stratix10-rsu"
    added intel stratix10 RSU device
    changed to support RSU in handling watchdog timeout
    s/attr_group/ATTRIBUTE_GROUPS, use devm_device_add_groups() and
    devm_device_remove_groups()
    added check the return value from rsu_send_msg()
    removed RSU binding text file
    other corrections/changes 

Richard Gong (4):
  firmware: stratix10-svc: extend svc to support RSU notify and WD
    features
  firmware: add Intel Stratix10 remote system update driver
  firmware: rsu: document sysfs interface
  MAINTAINERS: add maintainer for Intel Stratix10 FW drivers

 .../testing/sysfs-devices-platform-stratix10-rsu   | 100 +++++
 MAINTAINERS                                        |  11 +
 drivers/firmware/Kconfig                           |  18 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/stratix10-rsu.c                   | 409 +++++++++++++++++++++
 drivers/firmware/stratix10-svc.c                   |  74 +++-
 include/linux/firmware/intel/stratix10-smc.h       |  48 ++-
 .../linux/firmware/intel/stratix10-svc-client.h    |  12 +-
 8 files changed, 663 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
 create mode 100644 drivers/firmware/stratix10-rsu.c

-- 
2.7.4
