From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4] MAINTAINERS: Add file patterns for pps device tree bindings
Date: Fri, 22 Jun 2018 12:07:20 +0200
Message-ID: <20180622100720.28983-1-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rodolfo Giometti <giometti@enneenne.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v3:
  - Update for next-20180622,

v2:
  - No changes.

Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/pps/":

-Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:1/2=50%,authored:1/2=50%)
+Rodolfo Giometti <giometti@enneenne.com> (maintainer:PPS SUPPORT)
+Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-Vinod Koul <vkoul@kernel.org> (commit_signer:1/2=50%)
-Rodolfo Giometti <giometti@enneenne.com> (commit_signer:1/2=50%)
-"Robert P. J. Day" <rpjday@crashcourse.ca> (commit_signer:1/2=50%,authored:1/2=50%)
-Andrew Morton <akpm@linux-foundation.org> (commit_signer:1/2=50%)
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 linux-kernel@vger.kernel.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dd72b804b9b8bab3..464d91879df89fce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11447,6 +11447,7 @@ M:	Rodolfo Giometti <giometti@enneenne.com>
 W:	http://wiki.enneenne.com/index.php/LinuxPPS_support
 L:	linuxpps@ml.enneenne.com (subscribers-only)
 S:	Maintained
+F:	Documentation/devicetree/bindings/pps/
 F:	Documentation/pps/
 F:	Documentation/devicetree/bindings/pps/pps-gpio.txt
 F:	Documentation/ABI/testing/sysfs-pps
-- 
2.17.1
