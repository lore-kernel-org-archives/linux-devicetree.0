From: frowand.list@gmail.com
Subject: [PATCH] MAINTAINERS: add device tree ABI documentation file
Date: Tue, 13 Jun 2017 15:51:23 -0700
Message-ID: <1497394283-3766-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

sysfs-firmware-ofw describes the /sys/firmware/devicetree/ hierarchy
and /proc/device-tree so add a file line for it to the entry
OPEN FIRMWARE AND FLATTENED DEVICE TREE

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f7d568b8f133..4189954250ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9461,6 +9461,7 @@ S:	Maintained
 F:	drivers/of/
 F:	include/linux/of*.h
 F:	scripts/dtc/
+F:	Documentation/ABI/testing/sysfs-firmware-ofw
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 M:	Rob Herring <robh+dt@kernel.org>
-- 
Frank Rowand <frank.rowand@sony.com>
