From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 0/4 v2] of/overlay: sysfs based ABI for dt overlays
Date: Tue, 20 Dec 2016 20:04:51 +0100
Message-ID: <20161220190455.25115-1-xypron.glpk@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>
List-Id: devicetree@vger.kernel.org

Currently the kernel only supplies an internal API for creating
and destroying device tree overlays.

For some boards vendor specific kernel modules exist for
managing device tree overlays but they have not been
upstreamed or upstreaming stalled.
https://lkml.org/lkml/2015/6/12/624
https://lkml.org/lkml/2013/1/7/366

This patch series provides a sysfs based ABI for creation and
destruction of dt overlays in /sys/firmware/devicetree/overlays.

The following files are provided:

load:   This is a write only file.
        A string written to it is interpreted as the path to a
        flattened device tree overlay file. It is used to create
        and apply the contained overlays.

loaded: This is a read only file.
        It provides the count of loaded overlays as a decimal
        number.

unload: This is a write only file.
        If a positive number n is wrtten to this file the n
        most recent overlays are destroyed.
        If a negative number is written to this file all
        overlays are destroyed.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

version 2:
	change sysfs path to
	/sys/firmware/devicetree/overlays

	Fix errors indicated by kbuild robot:
	Add missing inline attribute to of_overlay_count
	in patch 1.
	Add 'select CONFIG_OF_EARLY_FLATTREE' to Kconfig
	in patch 2.

	Change unit test cases to check new functions
	of_overlay_count and of_overlay_destroy_last.

Heinrich Schuchardt (4):
  of/overlay: add API function to count and pop last
  of/overlay: sysfs based ABI for dt overlays
  of/overlay: documentation for sysfs ABI 
  of/overlay: test count and destroy_last

 .../ABI/testing/sysfs-firmware-devicetree-overlays |  24 +++ 
 Documentation/devicetree/overlay-notes.txt         |   7 +-
 drivers/of/Kconfig                                 |  15 ++
 drivers/of/Makefile                                |   2 + 
 drivers/of/base.c                                  |   1 + 
 drivers/of/ov_sysfs.c                              | 223 +++++++++++++++++++++
 drivers/of/overlay.c                               |  50 +++++
 drivers/of/unittest.c                              |  15 +-
 include/linux/of.h                                 |  12 ++
 9 files changed, 346 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-devicetree-overlays
 create mode 100644 drivers/of/ov_sysfs.c

-- 
2.11.0
