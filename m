From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 17/54] MAINTAINERS: Add file patterns for fpga device tree bindings
Date: Sun, 22 May 2016 11:05:54 +0200
Message-ID: <1463907991-7916-18-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Alan Tull <atull@opensource.altera.com>, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alan Tull <atull@opensource.altera.com>
Cc: Moritz Fischer <moritz.fischer@ettus.com>
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 75138c09dd603093..ef8a33c07ddceb3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4769,6 +4769,7 @@ FPGA MANAGER FRAMEWORK
 M:	Alan Tull <atull@opensource.altera.com>
 R:	Moritz Fischer <moritz.fischer@ettus.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/fpga/
 F:	drivers/fpga/
 F:	include/linux/fpga/fpga-mgr.h
 W:	http://www.rocketboards.org
-- 
1.9.1
