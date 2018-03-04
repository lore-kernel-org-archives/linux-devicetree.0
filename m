From: Frank Rowand <frowand.list@gmail.com>
Subject: [GIT PULL] of_overlay_fdt_apply() v7 for 4.17
Date: Sun, 4 Mar 2018 00:48:33 -0800
Message-ID: <617f14dc-63f7-e59c-4fa8-813b4ebd3c34@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ivan Gorinov <ivan.gorinov@intel.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Please pull the changes to create the overlay FDT apply API.

This is the v7 changes.

-Frank

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frowand/linux.git tags/overlay_apply_fdt_v7-for-4.17

for you to fetch changes up to e547c0031697a0cb5ff7f4a66754fb3e082754ff:

  of: improve reporting invalid overlay target path (2018-03-04 00:29:40 -0800)

----------------------------------------------------------------
Move duplicating and unflattening of an overlay flattened devicetree
(FDT) into the overlay application code.  To accomplish this,
of_overlay_apply() is replaced by of_overlay_fdt_apply().

----------------------------------------------------------------
Frank Rowand (5):
      x86: devicetree: fix config option around x86_flattree_get_config()
      of: change overlay apply input data from unflattened to FDT
      of: Documentation: of_overlay_apply() replaced by of_overlay_fdt_apply()
      of: convert unittest overlay devicetree source to sugar syntax
      of: improve reporting invalid overlay target path

 Documentation/devicetree/overlay-notes.txt       |   4 +-
 arch/x86/kernel/devicetree.c                     |   2 +-
 drivers/of/Kconfig                               |   1 +
 drivers/of/overlay.c                             | 134 ++++++++--
 drivers/of/resolver.c                            |   6 -
 drivers/of/unittest-data/Makefile                |  28 ++-
 drivers/of/unittest-data/overlay.dts             | 101 ++++----
 drivers/of/unittest-data/overlay_0.dts           |  14 ++
 drivers/of/unittest-data/overlay_1.dts           |  14 ++
 drivers/of/unittest-data/overlay_10.dts          |  27 ++
 drivers/of/unittest-data/overlay_11.dts          |  28 +++
 drivers/of/unittest-data/overlay_12.dts          |  14 ++
 drivers/of/unittest-data/overlay_13.dts          |  14 ++
 drivers/of/unittest-data/overlay_15.dts          |  30 +++
 drivers/of/unittest-data/overlay_2.dts           |   9 +
 drivers/of/unittest-data/overlay_3.dts           |   9 +
 drivers/of/unittest-data/overlay_4.dts           |  18 ++
 drivers/of/unittest-data/overlay_5.dts           |   9 +
 drivers/of/unittest-data/overlay_6.dts           |  10 +
 drivers/of/unittest-data/overlay_7.dts           |  10 +
 drivers/of/unittest-data/overlay_8.dts           |  10 +
 drivers/of/unittest-data/overlay_9.dts           |  10 +
 drivers/of/unittest-data/overlay_bad_phandle.dts |  23 +-
 drivers/of/unittest-data/overlay_bad_symbol.dts  |  25 +-
 drivers/of/unittest-data/tests-overlay.dtsi      | 217 +---------------
 drivers/of/unittest.c                            | 300 +++++++++++------------
 include/linux/of.h                               |   6 +-
 27 files changed, 586 insertions(+), 487 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay_0.dts
 create mode 100644 drivers/of/unittest-data/overlay_1.dts
 create mode 100644 drivers/of/unittest-data/overlay_10.dts
 create mode 100644 drivers/of/unittest-data/overlay_11.dts
 create mode 100644 drivers/of/unittest-data/overlay_12.dts
 create mode 100644 drivers/of/unittest-data/overlay_13.dts
 create mode 100644 drivers/of/unittest-data/overlay_15.dts
 create mode 100644 drivers/of/unittest-data/overlay_2.dts
 create mode 100644 drivers/of/unittest-data/overlay_3.dts
 create mode 100644 drivers/of/unittest-data/overlay_4.dts
 create mode 100644 drivers/of/unittest-data/overlay_5.dts
 create mode 100644 drivers/of/unittest-data/overlay_6.dts
 create mode 100644 drivers/of/unittest-data/overlay_7.dts
 create mode 100644 drivers/of/unittest-data/overlay_8.dts
 create mode 100644 drivers/of/unittest-data/overlay_9.dts
