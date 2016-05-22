From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 02/54] MAINTAINERS: Add file patterns for dove device tree bindings
Date: Sun, 22 May 2016 11:05:39 +0200
Message-ID: <1463907991-7916-3-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Gregory Clement <gregory.clement@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b4b2447589f36fa..e1bf10e4ad021483 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1387,6 +1387,7 @@ M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
 M:	Gregory Clement <gregory.clement@free-electrons.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/soc/dove/
 F:	arch/arm/mach-dove/
 F:	arch/arm/mach-mv78xx0/
 F:	arch/arm/mach-orion5x/
-- 
1.9.1
