From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 08/10] ARM: dts: imx: Update vendor info for GE Bx50v3 boards
Date: Thu,  5 Nov 2015 13:13:42 -0500
Message-ID: <1446747224-32514-9-git-send-email-akshay.bhat@timesys.com>
References: <1446747224-32514-1-git-send-email-akshay.bhat@timesys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446747224-32514-1-git-send-email-akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, peter.stretz-ELdSlb/RfAS1Z/+hSey0Gg@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update vendor and copyright info for GE Bx50v3 boards

Signed-off-by: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-b450v3.dts | 4 ++--
 arch/arm/boot/dts/imx6q-b650v3.dts | 4 ++--
 arch/arm/boot/dts/imx6q-b850v3.dts | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-b450v3.dts b/arch/arm/boot/dts/imx6q-b450v3.dts
index d63d9e1..efe9c1e 100644
--- a/arch/arm/boot/dts/imx6q-b450v3.dts
+++ b/arch/arm/boot/dts/imx6q-b450v3.dts
@@ -1,6 +1,6 @@
 /*
  * Copyright 2015 Timesys Corporation.
- * Copyright 2015 GE Healthcare.
+ * Copyright 2015 General Electric Company
  *
  * The code contained herein is licensed under the GNU General Public
  * License. You may obtain a copy of the GNU General Public License
@@ -16,7 +16,7 @@
 
 / {
 	model = "Advantech MX6Q B450V3 QSeven Board";
-	compatible = "adv,imx6q-b450v3", "adv,imx6q-ba16", "fsl,imx6q";
+	compatible = "ge,imx6q-b450v3", "adv,imx6q-ba16", "fsl,imx6q";
 
 	chosen {
 		stdout-path = &uart3;
diff --git a/arch/arm/boot/dts/imx6q-b650v3.dts b/arch/arm/boot/dts/imx6q-b650v3.dts
index 29cbdb0..d40efa9 100644
--- a/arch/arm/boot/dts/imx6q-b650v3.dts
+++ b/arch/arm/boot/dts/imx6q-b650v3.dts
@@ -1,6 +1,6 @@
 /*
  * Copyright 2015 Timesys Corporation.
- * Copyright 2015 GE Healthcare.
+ * Copyright 2015 General Electric Company
  *
  * The code contained herein is licensed under the GNU General Public
  * License. You may obtain a copy of the GNU General Public License
@@ -16,7 +16,7 @@
 
 / {
 	model = "Advantech MX6Q B650V3 QSeven Board";
-	compatible = "adv,imx6q-b650v3", "adv,imx6q-ba16", "fsl,imx6q";
+	compatible = "ge,imx6q-b650v3", "adv,imx6q-ba16", "fsl,imx6q";
 
 	chosen {
 		stdout-path = &uart3;
diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
index be6c0da..a77f392 100644
--- a/arch/arm/boot/dts/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/imx6q-b850v3.dts
@@ -1,6 +1,6 @@
 /*
  * Copyright 2015 Timesys Corporation.
- * Copyright 2015 GE Healthcare.
+ * Copyright 2015 General Electric Company
  *
  * The code contained herein is licensed under the GNU General Public
  * License. You may obtain a copy of the GNU General Public License
@@ -16,7 +16,7 @@
 
 / {
 	model = "Advantech MX6Q B850V3 QSeven Board";
-	compatible = "adv,imx6q-b850v3", "adv,imx6q-ba16", "fsl,imx6q";
+	compatible = "ge,imx6q-b850v3", "adv,imx6q-ba16", "fsl,imx6q";
 
 	chosen {
 		stdout-path = &uart3;
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
