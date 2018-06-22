From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4] MAINTAINERS: Add file patterns for h8300 device tree bindings
Date: Fri, 22 Jun 2018 12:08:14 +0200
Message-ID: <20180622100814.29172-1-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, uclinux-h8-devel@lists.sourceforge.jp, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v3:
  - Update for next-20180622,

v2:
  - No changes.

Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/h8300/":

+Yoshinori Sato <ysato@users.sourceforge.jp> (maintainer:H8/300 ARCHITECTURE)
 Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
+uclinux-h8-devel@lists.sourceforge.jp (moderated list:H8/300 ARCHITECTURE)
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 linux-kernel@vger.kernel.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 07a4927b1e7aada4..76b5dd65291f9650 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6265,6 +6265,7 @@ L:	uclinux-h8-devel@lists.sourceforge.jp (moderated for non-subscribers)
 W:	http://uclinux-h8.sourceforge.jp
 T:	git git://git.sourceforge.jp/gitroot/uclinux-h8/linux.git
 S:	Maintained
+F:	Documentation/devicetree/bindings/h8300/
 F:	arch/h8300/
 F:	drivers/clocksource/h8300_*.c
 F:	drivers/clk/h8300/
-- 
2.17.1
