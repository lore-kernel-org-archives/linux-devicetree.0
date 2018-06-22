From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4] MAINTAINERS: Add file patterns for nios2 device tree bindings
Date: Fri, 22 Jun 2018 12:08:17 +0200
Message-ID: <20180622100817.29370-1-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ley Foon Tan <lftan@altera.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, nios2-dev@lists.rocketboards.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v3:
  - Update for next-20180622,

v2:
  - No changes.

Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/nios2/":

-Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:2/2=100%,authored:1/2=50%)
+Ley Foon Tan <lftan@altera.com> (maintainer:NIOS2 ARCHITECTURE)
+Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-Mathieu Malaterre <malat@debian.org> (commit_signer:1/2=50%,authored:1/2=50%)
-Thierry Reding <thierry.reding@gmail.com> (commit_signer:1/2=50%)
+nios2-dev@lists.rocketboards.org (moderated list:NIOS2 ARCHITECTURE)
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 linux-kernel@vger.kernel.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index baa4dc046daf9cdc..dd72b804b9b8bab3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10074,6 +10074,7 @@ M:	Ley Foon Tan <lftan@altera.com>
 L:	nios2-dev@lists.rocketboards.org (moderated for non-subscribers)
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lftan/nios2.git
 S:	Maintained
+F:	Documentation/devicetree/bindings/nios2/
 F:	arch/nios2/
 
 NOHZ, DYNTICKS SUPPORT
-- 
2.17.1
