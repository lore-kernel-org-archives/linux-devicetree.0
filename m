From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [RESEND PATCH 3/3] powerpc: dts: use a correct at24 compatible fallback in ac14xx
Date: Thu, 21 Jun 2018 10:33:05 +0200
Message-ID: <20180621083305.5322-3-brgl@bgdev.pl>
References: <20180621083305.5322-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180621083305.5322-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: devicetree@vger.kernel.org

Using 'at24' as fallback is now deprecated - use the full
'atmel,<model>' string.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 arch/powerpc/boot/dts/ac14xx.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/boot/dts/ac14xx.dts b/arch/powerpc/boot/dts/ac14xx.dts
index 83bcfd865167..0be5c4f3265d 100644
--- a/arch/powerpc/boot/dts/ac14xx.dts
+++ b/arch/powerpc/boot/dts/ac14xx.dts
@@ -176,12 +176,12 @@
 			clock-frequency = <400000>;
 
 			at24@30 {
-				compatible = "at24,24c01";
+				compatible = "atmel,24c01";
 				reg = <0x30>;
 			};
 
 			at24@31 {
-				compatible = "at24,24c01";
+				compatible = "atmel,24c01";
 				reg = <0x31>;
 			};
 
@@ -191,42 +191,42 @@
 			};
 
 			at24@50 {
-				compatible = "at24,24c01";
+				compatible = "atmel,24c01";
 				reg = <0x50>;
 			};
 
 			at24@51 {
-				compatible = "at24,24c01";
+				compatible = "atmel,24c01";
 				reg = <0x51>;
 			};
 
 			at24@52 {
-				compatible = "at24,24c01";
+				compatible = "atmel,24c01";
 				reg = <0x52>;
 			};
 
 			at24@53 {
-				compatible = "at24,24c01";
+				compatible = "atmel,24c01";
 				reg = <0x53>;
 			};
 
 			at24@54 {
-				compatible = "at24,24c01";
+				compatible = "atmel,24c01";
 				reg = <0x54>;
 			};
 
 			at24@55 {
-				compatible = "at24,24c01";
+				compatible = "atmel,24c01";
 				reg = <0x55>;
 			};
 
 			at24@56 {
-				compatible = "at24,24c01";
+				compatible = "atmel,24c01";
 				reg = <0x56>;
 			};
 
 			at24@57 {
-				compatible = "at24,24c01";
+				compatible = "atmel,24c01";
 				reg = <0x57>;
 			};
 
-- 
2.17.1
