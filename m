From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4] MAINTAINERS: Add file patterns for w1 device tree bindings
Date: Fri, 22 Jun 2018 12:08:20 +0200
Message-ID: <20180622100820.29567-1-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evgeniy Polyakov <zbr@ioremap.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/w1/":

-Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:1/1=100%,authored:1/1=100%)
-Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:1/1=100%)
+Evgeniy Polyakov <zbr@ioremap.net> (maintainer:W1 DALLAS'S 1-WIRE BUS)
+Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
+Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 linux-kernel@vger.kernel.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1030624a6e113786..dec5d1efc5ec7d86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15398,6 +15398,7 @@ F:	drivers/mmc/host/vub300.c
 W1 DALLAS'S 1-WIRE BUS
 M:	Evgeniy Polyakov <zbr@ioremap.net>
 S:	Maintained
+F:	Documentation/devicetree/bindings/w1/
 F:	Documentation/w1/
 F:	drivers/w1/
 F:	include/linux/w1.h
-- 
2.17.1
