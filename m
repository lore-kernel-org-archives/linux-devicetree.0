From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 1/1] ARM: at91: fix missing #interrupt-cells on gpio-controller
Date: Thu, 13 Sep 2012 12:40:26 +0200
Message-ID: <1347532826-32733-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree-discuss@lists.ozlabs.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 arch/arm/boot/dts/at91sam9260.dtsi |    3 +++
 arch/arm/boot/dts/at91sam9263.dtsi |    5 +++++
 arch/arm/boot/dts/at91sam9g45.dtsi |    5 +++++
 arch/arm/boot/dts/at91sam9n12.dtsi |    4 ++++
 arch/arm/boot/dts/at91sam9x5.dtsi  |    4 ++++
 5 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
index 66389c1..7c95f76 100644
--- a/arch/arm/boot/dts/at91sam9260.dtsi
+++ b/arch/arm/boot/dts/at91sam9260.dtsi
@@ -104,6 +104,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioB: gpio@fffff600 {
@@ -113,6 +114,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioC: gpio@fffff800 {
@@ -122,6 +124,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			dbgu: serial@fffff200 {
diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/at91sam9263.dtsi
index b460d6c..195019b 100644
--- a/arch/arm/boot/dts/at91sam9263.dtsi
+++ b/arch/arm/boot/dts/at91sam9263.dtsi
@@ -95,6 +95,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioB: gpio@fffff400 {
@@ -104,6 +105,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioC: gpio@fffff600 {
@@ -113,6 +115,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioD: gpio@fffff800 {
@@ -122,6 +125,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioE: gpio@fffffa00 {
@@ -131,6 +135,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			dbgu: serial@ffffee00 {
diff --git a/arch/arm/boot/dts/at91sam9g45.dtsi b/arch/arm/boot/dts/at91sam9g45.dtsi
index bafa880..63751b1 100644
--- a/arch/arm/boot/dts/at91sam9g45.dtsi
+++ b/arch/arm/boot/dts/at91sam9g45.dtsi
@@ -113,6 +113,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioB: gpio@fffff400 {
@@ -122,6 +123,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioC: gpio@fffff600 {
@@ -131,6 +133,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioD: gpio@fffff800 {
@@ -140,6 +143,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioE: gpio@fffffa00 {
@@ -149,6 +153,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			dbgu: serial@ffffee00 {
diff --git a/arch/arm/boot/dts/at91sam9n12.dtsi b/arch/arm/boot/dts/at91sam9n12.dtsi
index bfac0df..ef9336a 100644
--- a/arch/arm/boot/dts/at91sam9n12.dtsi
+++ b/arch/arm/boot/dts/at91sam9n12.dtsi
@@ -107,6 +107,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioB: gpio@fffff600 {
@@ -116,6 +117,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioC: gpio@fffff800 {
@@ -125,6 +127,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioD: gpio@fffffa00 {
@@ -134,6 +137,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			dbgu: serial@fffff200 {
diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
index 4a18c39..8a387a8 100644
--- a/arch/arm/boot/dts/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5.dtsi
@@ -115,6 +115,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioB: gpio@fffff600 {
@@ -124,6 +125,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioC: gpio@fffff800 {
@@ -133,6 +135,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			pioD: gpio@fffffa00 {
@@ -142,6 +145,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			dbgu: serial@fffff200 {
-- 
1.7.10.4
