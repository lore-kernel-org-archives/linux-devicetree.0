From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4] MAINTAINERS: Add file patterns for ipmi device tree bindings
Date: Fri, 22 Jun 2018 12:08:15 +0200
Message-ID: <20180622100815.29221-1-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corey Minyard <minyard@acm.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v3:
  - Update for next-20180622,

v2:
  - New.

Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/ipmi/":

+Corey Minyard <minyard@acm.org> (supporter:IPMI SUBSYSTEM)
 Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-Corey Minyard <cminyard@mvista.com> (commit_signer:2/2=100%)
-Haiyue Wang <haiyue.wang@linux.intel.com> (commit_signer:2/2=100%,authored:2/2=100%)
-Avi Fishman <avifishman70@gmail.com> (commit_signer:1/2=50%)
+openipmi-developer@lists.sourceforge.net (moderated list:IPMI SUBSYSTEM)
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 linux-kernel@vger.kernel.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 76b5dd65291f9650..321fbaa7e7d273a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7463,6 +7463,7 @@ M:	Corey Minyard <minyard@acm.org>
 L:	openipmi-developer@lists.sourceforge.net (moderated for non-subscribers)
 W:	http://openipmi.sourceforge.net/
 S:	Supported
+F:	Documentation/devicetree/bindings/ipmi/
 F:	Documentation/IPMI.txt
 F:	drivers/char/ipmi/
 F:	include/linux/ipmi*
-- 
2.17.1
