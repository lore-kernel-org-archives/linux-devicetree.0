From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 23/23] MAINTAINERS: Add file patterns for xillybus device tree bindings
Date: Sun, 12 Mar 2017 14:17:07 +0100
Message-ID: <1489324627-19126-24-git-send-email-geert@linux-m68k.org>
References: <1489324627-19126-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489324627-19126-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Eli Billauer <eli.billauer@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.

v2:
  - Add Acked-by (Eli does not have his own git repo).

Impact on next-20170310:

+Eli Billauer <eli.billauer@gmail.com> (supporter:XILLYBUS DRIVER)
 Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
+linux-kernel@vger.kernel.org (open list:XILLYBUS DRIVER)
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-linux-kernel@vger.kernel.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a6b58fe4b469626..abe5bd3581c5af9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13823,6 +13823,7 @@ XILLYBUS DRIVER
 M:	Eli Billauer <eli.billauer@gmail.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/xillybus/
 F:	drivers/char/xillybus/
 
 XTENSA XTFPGA PLATFORM SUPPORT
-- 
2.7.4
