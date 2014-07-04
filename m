Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH v7 0/9] Device Tree Overlays; the neverending saga
Date: Fri,  4 Jul 2014 19:59:19 +0300
Message-Id: <1404493168-8980-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

The following patchset introduces Device Tree overlays, a method
of dynamically altering the kernel's live Device Tree, along with
a generic interface to use it in a board agnostic manner.

It is against linux mainline as of today 24/7/2014
"88b5a850c88a3fd0e9d050d35962259e029e43f4
 Merge tag 'sound-3.16-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound"

It relies on the following previously submitted patches/patchsets:

* Generic OF infrastructure fixes
* configfs: Implement binary attributes (v2)
* Transaction DT support (v2)

To compile overlays you need the DTC compiler patch

* "dtc: Dynamic symbols & fixup support (v2)"

The full patchset is applied to the following tree/branch:

git:    git@github.com:pantoniou/linux-beagle-track-mainline.git
branch: dt-ng/bbb
http:   https://github.com/pantoniou/linux-beagle-track-mainline/tree/dt-ng/bbb

Changes since V6:
* Now using the updated transaction API.

Changes since V5:
* Rely on transactions for affecting changes to the live tree.
This makes the patchset considerably smaller, and easier to grok.
* Removed the internal API, simplyfing the interface.

Changes since V4:
* New API of_overlay_create/destroy being able to support stacked
overlays correctly.
* Removed use of notifiers internally.
* Removed own-grown bus handler notifiers; using already in-place DT
notification infrastructure.
* Split SPI notifier patch to one patch of generic changes and one
for DT overlay notifier.
* Removed unused overlay depth feature.
* Updated documentation.
* Moved configfs based interface to using the new API.
* Added overlay removal stacking tests.

Changes since V3:
* Added overlay self-tests.
* Fix bug in of_init_overlay_info (wrong sizeof)
* Platform bus handler handles parent_pdev == NULL
* of_resolve fixes according to comments by robh
  + changed if (foo == NULL) to if (!foo)
  + changed if (foo != NULL) to if (foo)
  + drivers/of/Kconfig added dep on OF && !SPARC
  + convert to using be32_to_cpup
  + u32 -> __be32 when modifying property values
  + cosmetic fixes

Changes since V2:
* Use of a configfs board agnostic overlay method
* Use of per bus handlers instead of hardcoded behaviour
* Optional target-path overlay target, which allows one to use standard
DTBs without resolution options.

Changes since V1:

* Removal of any bits related to a specific board (beaglebone).
* Introduced a platform agnostic interface using /proc/device-tree-overlay
* Various bug fixes related to i2c device handling have been squashed in.

Pantelis Antoniou (9):
  OF: Introduce Device Tree resolve support.
  OF: Introduce DT overlay support.
  OF: selftest: Add overlay self-test support.
  OF: DT-Overlay configfs interface
  OF: platform: Add OF notifier handler
  of: i2c: Export single device registration method
  OF: i2c: Add OF notifier handler
  of: spi: Export single device registration method and accessors
  OF: spi: Add OF notifier handler

 Documentation/devicetree/bindings/selftest.txt     |  14 +
 .../devicetree/dynamic-resolution-notes.txt        |  25 +
 Documentation/devicetree/overlay-notes.txt         | 137 ++++
 drivers/base/platform.c                            |  18 +-
 drivers/i2c/i2c-core.c                             | 164 +++--
 drivers/of/Kconfig                                 |  20 +
 drivers/of/Makefile                                |   3 +
 drivers/of/configfs.c                              | 340 ++++++++++
 drivers/of/overlay.c                               | 690 +++++++++++++++++++++
 drivers/of/platform.c                              |  62 ++
 drivers/of/resolver.c                              | 403 ++++++++++++
 drivers/of/selftest.c                              | 481 ++++++++++++++
 drivers/of/testcase-data/testcases.dtsi            |   1 +
 drivers/of/testcase-data/tests-overlay.dtsi        | 180 ++++++
 drivers/spi/spi.c                                  | 320 +++++++---
 include/linux/i2c.h                                |  10 +
 include/linux/of.h                                 |  49 ++
 include/linux/of_platform.h                        |  10 +
 18 files changed, 2779 insertions(+), 148 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/selftest.txt
 create mode 100644 Documentation/devicetree/dynamic-resolution-notes.txt
 create mode 100644 Documentation/devicetree/overlay-notes.txt
 create mode 100644 drivers/of/configfs.c
 create mode 100644 drivers/of/overlay.c
 create mode 100644 drivers/of/resolver.c
 create mode 100644 drivers/of/testcase-data/tests-overlay.dtsi

-- 
1.7.12
