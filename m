From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 38/54] MAINTAINERS: Add file patterns for pps device tree bindings
Date: Sun, 22 May 2016 11:06:15 +0200
Message-ID: <1463907991-7916-39-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rodolfo Giometti <giometti@enneenne.com>, linuxpps@ml.enneenne.com
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rodolfo Giometti <giometti@enneenne.com>
Cc: linuxpps@ml.enneenne.com
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 768d802dfac589d6..e204132911b63624 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9135,6 +9135,7 @@ M:	Rodolfo Giometti <giometti@enneenne.com>
 W:	http://wiki.enneenne.com/index.php/LinuxPPS_support
 L:	linuxpps@ml.enneenne.com (subscribers-only)
 S:	Maintained
+F:	Documentation/devicetree/bindings/pps/
 F:	Documentation/pps/
 F:	drivers/pps/
 F:	include/linux/pps*.h
-- 
1.9.1
