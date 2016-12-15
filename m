From: yegorslists@googlemail.com
Subject: [PATCH 2/2] Documentation: ehci-omap: remove the unnecessary newline
Date: Thu, 15 Dec 2016 16:56:10 +0100
Message-ID: <1481817370-28242-2-git-send-email-yegorslists@googlemail.com>
References: <1481817370-28242-1-git-send-email-yegorslists@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481817370-28242-1-git-send-email-yegorslists@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Yegor Yefremov <yegorslists@googlemail.com>
List-Id: devicetree@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 Documentation/devicetree/bindings/usb/ehci-omap.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ehci-omap.txt b/Documentation/devicetree/bindings/usb/ehci-omap.txt
index 3dc231c..d77e11a 100644
--- a/Documentation/devicetree/bindings/usb/ehci-omap.txt
+++ b/Documentation/devicetree/bindings/usb/ehci-omap.txt
@@ -29,4 +29,3 @@ usbhsehci: ehci@4a064c00 {
 &usbhsehci {
 	phys = <&hsusb1_phy 0 &hsusb3_phy>;
 };
-
-- 
2.1.4
