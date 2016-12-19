From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 0/3] of/overlay: sysfs based ABI for dt overlays
Date: Mon, 19 Dec 2016 02:10:32 +0100
Message-ID: <1482109835-9000-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>
List-Id: devicetree@vger.kernel.org

Currently the kernel only supplies an internal API for creating
and destroying device tree overlays.

For some boards vendor specific kernel modules exist for
managing device tree overlays but they have not been
upstreamed or upstreaming stalled.
https://lkml.org/lkml/2015/6/12/624
https://lkml.org/lkml/2013/1/7/366

This patch series provides a sysfs based ABI for creation and
destruction of dt overlays in /sys/firmware/devicetree-overlay.

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

Heinrich Schuchardt (3):
  of/overlay: add API function to count and pop last
  of/overlay: sysfs based ABI for dt overlays
  of/overlay: documentation for sysfs ABI

 .../ABI/testing/sysfs-firmware-devicetree-overlays |  24 +++
 Documentation/devicetree/overlay-notes.txt         |   7 +-
 drivers/of/Kconfig                                 |  12 ++
 drivers/of/Makefile                                |   2 +
 drivers/of/ov_sysfs.c                              | 212 +++++++++++++++++++++
 drivers/of/overlay.c                               |  50 +++++
 include/linux/of.h                                 |  12 ++
 7 files changed, 317 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-devicetree-overlays
 create mode 100644 drivers/of/ov_sysfs.c

-- 
2.11.0
