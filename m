From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] DeviceTree fixes for 4.0-rc
Date: Fri, 13 Mar 2015 11:06:42 -0500
Message-ID: <CAL_JsqJQRDOqdCNLCRBEPkVdcmW+NeouZTJzF1-WdeiUydaHCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DT fixes for 4.0. Details below.

Rob

The following changes since commit 9eccca0843205f87c00404b663188b88eb248051:

  Linux 4.0-rc3 (2015-03-08 16:09:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.0

for you to fetch changes up to a697c2efba03ac7bfdbffbba7f0f1aa294f7dee0:

  of/platform: Fix sparc:allmodconfig build (2015-03-13 09:45:24 -0500)

----------------------------------------------------------------
DeviceTree fixes for 4.0-rc:

- Fix for stdout-path option parsing with added unittest

- Fix for stdout-path interaction with earlycon

- Several DT unittest fixes

- Fix Sparc allmodconfig build error on
  of_platform_register_reconfig_notifier

- Several DT overlay kconfig and build warning fixes

- Several DT binding documentation updates

----------------------------------------------------------------
Arnd Bergmann (1):
      of: unittest: fix I2C dependency

Chunyan Zhang (1):
      Documentation: DT: Renamed of-serial.txt to 8250.txt

Fabio Estevam (1):
      of/overlay: Remove unused variable

Guenter Roeck (1):
      of/platform: Fix sparc:allmodconfig build

Leif Lindholm (1):
      of: fix handling of '/' in options for of_find_node_by_path()

Mark Brown (1):
      of/overlay: Directly include idr.h

Matt Porter (1):
      dt: submitting-patches: clarify that DT maintainers are to be
cced on bindings

Matwey V. Kornilov (2):
      of: Add prompt for OF_OVERLAY config
      of: Drop superfluous dependance for OF_OVERLAY

Michal Simek (1):
      of: Add vendor prefix for Arasan

Niklas Cassel (1):
      serial: add device tree binding documentation for ETRAX FS UART

Peter Hurley (2):
      of: Fix premature bootconsole disable with 'stdout-path'
      of: unittest: Add options string testcase variants

Rob Herring (1):
      Merge tag 'v4.0-rc3' into HEAD

Wang Long (2):
      of/unittest: remove the duplicate of_changeset_init
      of/unittest: Fix the wrong expected value in of_selftest_property_string

 .../bindings/serial/{of-serial.txt => 8250.txt}    |  0
 .../bindings/serial/axis,etraxfs-uart.txt          | 19 +++++++++++++++
 .../devicetree/bindings/submitting-patches.txt     |  3 +++
 .../devicetree/bindings/vendor-prefixes.txt        |  2 ++
 drivers/of/Kconfig                                 |  3 +--
 drivers/of/base.c                                  | 27 ++++++++++++++-------
 drivers/of/overlay.c                               |  3 ++-
 drivers/of/unittest.c                              | 28 +++++++++++++++-------
 include/linux/of_platform.h                        |  2 +-
 9 files changed, 65 insertions(+), 22 deletions(-)
 rename Documentation/devicetree/bindings/serial/{of-serial.txt =>
8250.txt} (100%)
 create mode 100644
Documentation/devicetree/bindings/serial/axis,etraxfs-uart.txt
