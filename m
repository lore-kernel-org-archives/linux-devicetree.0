From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 54/54] MAINTAINERS: Add file patterns for xillybus device tree bindings
Date: Sun, 22 May 2016 11:06:31 +0200
Message-ID: <1463907991-7916-55-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Eli Billauer <eli.billauer@gmail.com>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Eli Billauer <eli.billauer@gmail.com>
Cc: linux-kernel@vger.kernel.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f580d72f412df230..d461ad734e441554 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12669,6 +12669,7 @@ XILLYBUS DRIVER
 M:	Eli Billauer <eli.billauer@gmail.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/xillybus/
 F:	drivers/char/xillybus/
 
 XTENSA XTFPGA PLATFORM SUPPORT
-- 
1.9.1
