From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 0/3] DW9714 DT support
Date: Thu, 17 Aug 2017 16:42:53 +0300
Message-ID: <1502977376-22836-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, rajmohan.mani@intel.com
List-Id: devicetree@vger.kernel.org

Hi all,

This patchset adds DT bindings as well as DT support for DW9714. The
unused ACPI match table is removed.

Sakari Ailus (3):
  dt-bindings: Add bindings for Dongwoon DW9714 voice coil
  dw9714: Add Devicetree support
  dw9714: Remove ACPI match tables, convert to use probe_new

 .../bindings/media/i2c/dongwoon,dw9714.txt         |  9 ++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 drivers/media/i2c/dw9714.c                         | 26 +++++++++-------------
 3 files changed, 21 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt

-- 
2.7.4
