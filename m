From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 17/23] MAINTAINERS: Add file patterns for pps device tree bindings
Date: Sun, 12 Mar 2017 14:17:01 +0100
Message-ID: <1489324627-19126-18-git-send-email-geert@linux-m68k.org>
References: <1489324627-19126-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489324627-19126-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Rodolfo Giometti <giometti@enneenne.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxpps@ml.enneenne.com
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rodolfo Giometti <giometti@enneenne.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxpps@ml.enneenne.com
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.

v2:
  - No changes.

Impact on next-20170310:

+Rodolfo Giometti <giometti@enneenne.com> (maintainer:PPS SUPPORT)
 Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 linux-kernel@vger.kernel.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 551ab8e4b771bcc2..5346accadb97bde2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10077,6 +10077,7 @@ M:	Rodolfo Giometti <giometti@enneenne.com>
 W:	http://wiki.enneenne.com/index.php/LinuxPPS_support
 L:	linuxpps@ml.enneenne.com (subscribers-only)
 S:	Maintained
+F:	Documentation/devicetree/bindings/pps/
 F:	Documentation/pps/
 F:	drivers/pps/
 F:	include/linux/pps*.h
-- 
2.7.4
