From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 49/54] MAINTAINERS: Add file patterns for usb device tree bindings
Date: Sun, 22 May 2016 11:06:26 +0200
Message-ID: <1463907991-7916-50-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f8c1a45fead33af..d79cedf604642ee4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11994,6 +11994,7 @@ L:	linux-usb@vger.kernel.org
 W:	http://www.linux-usb.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
 S:	Supported
+F:	Documentation/devicetree/bindings/usb/
 F:	Documentation/usb/
 F:	drivers/usb/
 F:	include/linux/usb.h
-- 
1.9.1
