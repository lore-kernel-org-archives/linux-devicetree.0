From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 34/54] MAINTAINERS: Add file patterns for nios2 device tree bindings
Date: Sun, 22 May 2016 11:06:11 +0200
Message-ID: <1463907991-7916-35-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Ley Foon Tan <lftan@altera.com>, nios2-dev@lists.rocketboards.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ley Foon Tan <lftan@altera.com>
Cc: nios2-dev@lists.rocketboards.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 604d5d4230406094..868111d26536f086 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8102,6 +8102,7 @@ M:	Ley Foon Tan <lftan@altera.com>
 L:	nios2-dev@lists.rocketboards.org (moderated for non-subscribers)
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lftan/nios2.git
 S:	Maintained
+F:	Documentation/devicetree/bindings/nios2/
 F:	arch/nios2/
 
 NOKIA N900 POWER SUPPLY DRIVERS
-- 
1.9.1
