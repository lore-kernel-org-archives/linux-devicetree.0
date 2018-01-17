From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v2 0/4] drivers: firmware: xilinx: Add firmware driver support
Date: Wed, 17 Jan 2018 12:20:30 -0800
Message-ID: <1516220434-22204-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rajanv@xilinx.com, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

Introduce firmware driver for ZynqMP core.
This patchset is adding communication layer with firmware.
Firmware driver provides an interface to firmware APIs.
Interface APIs can be used by any driver to communicate to
PMUFW(Platform Management Unit). All requests go through ATF.

v2:
 - change SPDX-License-Identifier license text style
 - split patch into multiple patches
 - Updated copyrights
 - Added ABI documentation
 - incorporated logical review comments from previuos patch. Discussed belo=
w:
        https://patchwork.kernel.org/patch/10150665/

Jolly Shah (4):
  dt-bindings: firmware: Add bindings for ZynqMP firmware
  drivers: firmware: xilinx: Add ZynqMP firmware driver
  drivers: firmware: xilinx: Add sysfs interface
  drivers: firmware: xilinx: Add debugfs interface

 .../ABI/stable/sysfs-driver-zynqmp-firmware        |   33 +
 .../firmware/xilinx/xlnx,zynqmp-firmware.txt       |   16 +
 arch/arm64/Kconfig.platforms                       |    1 +
 drivers/firmware/Kconfig                           |    1 +
 drivers/firmware/Makefile                          |    1 +
 drivers/firmware/xilinx/Kconfig                    |    4 +
 drivers/firmware/xilinx/Makefile                   |    4 +
 drivers/firmware/xilinx/zynqmp/Kconfig             |   23 +
 drivers/firmware/xilinx/zynqmp/Makefile            |    5 +
 drivers/firmware/xilinx/zynqmp/firmware-debug.c    |  524 ++++++++++
 drivers/firmware/xilinx/zynqmp/firmware-ggs.c      |  298 ++++++
 drivers/firmware/xilinx/zynqmp/firmware.c          | 1022 ++++++++++++++++=
++++
 .../linux/firmware/xilinx/zynqmp/firmware-debug.h  |   31 +
 include/linux/firmware/xilinx/zynqmp/firmware.h    |  572 +++++++++++
 14 files changed, 2535 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-zynqmp-firmware
 create mode 100644 Documentation/devicetree/bindings/firmware/xilinx/xlnx,=
zynqmp-firmware.txt
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

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
