From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 6/6] ARM: shmobile: lager.dtb: add usbphy reference
Date: Sat, 18 Jan 2014 15:03:40 +0000
Message-ID: <1390057420-13226-7-git-send-email-ben.dooks@codethink.co.uk>
References: <1390057420-13226-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1390057420-13226-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-sh-owner@vger.kernel.org
To: linux-kernel@lists.codethink.co.uk
Cc: linux-sh@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>
List-Id: devicetree@vger.kernel.org

Enable the usbphy node so that the phy driver is available.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Reviewed-by: Ian Molton <ian.molton@codethink.co.uk>
---
Cc: linux-sh@vger.kernel.org (open list:ARM/SHMOBILE ARM...)
Cc: devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND...)
Cc: Magnus Damm <magnus.damm@gmail.com> (supporter:ARM/SHMOBILE ARM...)
Cc: Simon Horman <horms@verge.net.au> (supporter:ARM/SHMOBILE ARM...)
---
 arch/arm/boot/dts/r8a7790-lager.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 8dfcd25..83bf18d 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -125,3 +125,7 @@
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
 };
+
+&usbphy {
+	status = "okay";
+};
-- 
1.8.5.2

