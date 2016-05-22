From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 27/54] MAINTAINERS: Add file patterns for dsa device tree bindings
Date: Sun, 22 May 2016 11:06:04 +0200
Message-ID: <1463907991-7916-28-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c87d146377ffc22c..7acb65bb2590a321 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7176,6 +7176,7 @@ F:	Documentation/devicetree/bindings/display/armada/
 MARVELL 88E6352 DSA support
 M:	Guenter Roeck <linux@roeck-us.net>
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/dsa/
 F:	drivers/net/dsa/mv88e6352.c
 
 MARVELL CRYPTO DRIVER
-- 
1.9.1
