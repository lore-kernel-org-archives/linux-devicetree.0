From: Jolly Shah <jolly.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 0/4] drivers: firmware: xilinx: Add firmware driver support
Date: Tue, 6 Feb 2018 14:54:19 -0800
Message-ID: <1517957663-16668-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jolly Shah <jollys-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduce firmware driver for ZynqMP core.
This patchset is adding communication layer with firmware.
Firmware driver provides an interface to firmware APIs.
Interface APIs can be used by any driver to communicate to
PMUFW(Platform Management Unit). All requests go through ATF.

v4:
 - Changed clock setrate/getrate API prototype to support 64 bit rate
 - Defined macros for get_node_status return values
 - Moved DT node as a child of firmware
 - Changed debugfs APIs to return data to debugfs buffer instead of dumping to kernel log
 - Minor changes to incorporate other review comments from v3 patch series

v3:
 - added some fixes to firmware-ggs.c
 - updated pinmux get/set function argument names to specify function id instead of node id
 - added new pinctrl query macros
 - incorporated review comments from v2 patch series

v2:
 - change SPDX-License-Identifier license text style
 - split patch into multiple patches
 - Updated copyrights
 - Added ABI documentation
 - incorporated logical review comments from previuos patch. Discussed below:
	https://patchwork.kernel.org/patch/10150665/

Jolly Shah (4):
  dt-bindings: firmware: Add bindings for ZynqMP firmware
  drivers: firmware: xilinx: Add ZynqMP firmware driver
  drivers: firmware: xilinx: Add sysfs interface
  drivers: firmware: xilinx: Add debugfs interface

 Documentation/ABI/stable/sysfs-firmware-zynqmp     |   50 +
 .../firmware/xilinx/xlnx,zynqmp-firmware.txt       |   24 +
 arch/arm64/Kconfig.platforms                       |    1 +
 drivers/firmware/Kconfig                           |    1 +
 drivers/firmware/Makefile                          |    1 +
 drivers/firmware/xilinx/Kconfig                    |    4 +
 drivers/firmware/xilinx/Makefile                   |    4 +
 drivers/firmware/xilinx/zynqmp/Kconfig             |   23 +
 drivers/firmware/xilinx/zynqmp/Makefile            |    5 +
 drivers/firmware/xilinx/zynqmp/firmware-debug.c    |  482 +++++++++
 drivers/firmware/xilinx/zynqmp/firmware-ggs.c      |  297 ++++++
 drivers/firmware/xilinx/zynqmp/firmware.c          | 1025 ++++++++++++++++++++
 .../linux/firmware/xilinx/zynqmp/firmware-debug.h  |   31 +
 include/linux/firmware/xilinx/zynqmp/firmware.h    |  585 +++++++++++
 14 files changed, 2533 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-firmware-zynqmp
 create mode 100644 Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
 create mode 100644 drivers/firmware/xilinx/Kconfig
 create mode 100644 drivers/firmware/xilinx/Makefile
 create mode 100644 drivers/firmware/xilinx/zynqmp/Kconfig
 create mode 100644 drivers/firmware/xilinx/zynqmp/Makefile
 create mode 100644 drivers/firmware/xilinx/zynqmp/firmware-debug.c
 create mode 100644 drivers/firmware/xilinx/zynqmp/firmware-ggs.c
 create mode 100644 drivers/firmware/xilinx/zynqmp/firmware.c
 create mode 100644 include/linux/firmware/xilinx/zynqmp/firmware-debug.h
 create mode 100644 include/linux/firmware/xilinx/zynqmp/firmware.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
