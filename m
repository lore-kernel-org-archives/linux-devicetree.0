From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 13/54] MAINTAINERS: Add file patterns for cris device tree bindings
Date: Sun, 22 May 2016 11:05:50 +0200
Message-ID: <1463907991-7916-14-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-cris-kernel@axis.com
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mikael Starvik <starvik@axis.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: linux-cris-kernel@axis.com
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b241c14d9ab57e2a..878e4b4634f87ecd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3280,6 +3280,7 @@ L:	linux-cris-kernel@axis.com
 W:	http://developer.axis.com
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jesper/cris.git
 S:	Maintained
+F:	Documentation/devicetree/bindings/cris/
 F:	arch/cris/
 F:	drivers/tty/serial/crisv10.*
 
-- 
1.9.1
