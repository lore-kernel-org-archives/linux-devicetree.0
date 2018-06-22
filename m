From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4] MAINTAINERS: Add file patterns for xillybus device tree bindings
Date: Fri, 22 Jun 2018 12:08:21 +0200
Message-ID: <20180622100821.29665-1-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Eli Billauer <eli.billauer@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Eli Billauer <eli.billauer@gmail.com>
---
v3:
  - Update for next-20180622,

v2:
  - Add Acked-by (Eli does not have his own git repo).

Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/xillybus/":

+Eli Billauer <eli.billauer@gmail.com> (supporter:XILLYBUS DRIVER)
 Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
+linux-kernel@vger.kernel.org (open list:XILLYBUS DRIVER)
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-linux-kernel@vger.kernel.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c7b94d2cd0a2f799..46634e7090a09601 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15746,6 +15746,7 @@ XILLYBUS DRIVER
 M:	Eli Billauer <eli.billauer@gmail.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/xillybus/
 F:	drivers/char/xillybus/
 
 XLP9XX I2C DRIVER
-- 
2.17.1
