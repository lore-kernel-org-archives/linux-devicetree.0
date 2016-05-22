From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 07/54] MAINTAINERS: Add file patterns for bcm2835 device tree bindings
Date: Sun, 22 May 2016 11:05:44 +0200
Message-ID: <1463907991-7916-8-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Eric Anholt <eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.

Why does this use "bcm" and not "brcm", cfr. vendor-prefixes.txt??
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2abd340b08f89f5b..d92b26da80747622 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2505,6 +2505,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rpi/linux-rpi.git
 S:	Maintained
 N:	bcm2835
+F:	Documentation/devicetree/bindings/soc/bcm/
 
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
-- 
1.9.1
