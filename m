From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 1/2] ARM: dts: BCM5301X: Specify serial console params in dtsi files
Date: Wed, 15 Mar 2017 18:03:27 +0100
Message-ID: <20170315170328.13879-1-zajec5@gmail.com>
References: <20170314075830.2247-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170314075830.2247-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

So far every Northstar device we have seen was using the same serial
console params (115200n8). It probably make the most sense to put it in
some proper dtsi files instead of repeating over and over for every
single device. As different boards may use different bootloaders it
seems the safest idea is to use board specific dtsi files.

Just in case some vendor decides to use different UART (parameters) this
can be always easily overwritten.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V2: Use board dtsi files, update existing bcm9*dts files, update commit message.
---
 arch/arm/boot/dts/bcm4708.dtsi    | 8 ++++++++
 arch/arm/boot/dts/bcm47081.dtsi   | 8 ++++++++
 arch/arm/boot/dts/bcm5301x.dtsi   | 4 ----
 arch/arm/boot/dts/bcm94708.dts    | 8 --------
 arch/arm/boot/dts/bcm94709.dts    | 8 --------
 arch/arm/boot/dts/bcm953012er.dts | 8 --------
 arch/arm/boot/dts/bcm953012hr.dts | 8 --------
 arch/arm/boot/dts/bcm953012k.dts  | 4 ----
 8 files changed, 16 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/bcm4708.dtsi b/arch/arm/boot/dts/bcm4708.dtsi
index d0eec099f1f8..1a19e97a987d 100644
--- a/arch/arm/boot/dts/bcm4708.dtsi
+++ b/arch/arm/boot/dts/bcm4708.dtsi
@@ -12,6 +12,14 @@
 / {
 	compatible = "brcm,bcm4708";
 
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/bcm47081.dtsi b/arch/arm/boot/dts/bcm47081.dtsi
index 7bcd536198fc..9829d044aaf4 100644
--- a/arch/arm/boot/dts/bcm47081.dtsi
+++ b/arch/arm/boot/dts/bcm47081.dtsi
@@ -22,6 +22,14 @@
 / {
 	compatible = "brcm,bcm47081";
 
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index 8fd1ef9f0c2d..65dc67e86ae1 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -18,10 +18,6 @@
 / {
 	interrupt-parent = <&gic>;
 
-	chosen {
-		stdout-path = &uart0;
-	};
-
 	chipcommonA {
 		compatible = "simple-bus";
 		ranges = <0x00000000 0x18000000 0x00001000>;
diff --git a/arch/arm/boot/dts/bcm94708.dts b/arch/arm/boot/dts/bcm94708.dts
index 42855a7c1bfa..2e08c895f281 100644
--- a/arch/arm/boot/dts/bcm94708.dts
+++ b/arch/arm/boot/dts/bcm94708.dts
@@ -38,14 +38,6 @@
 	model = "NorthStar SVK (BCM94708)";
 	compatible = "brcm,bcm94708", "brcm,bcm4708";
 
-	aliases {
-		serial0 = &uart0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
 	memory {
 		reg = <0x00000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm94709.dts b/arch/arm/boot/dts/bcm94709.dts
index 95e8be65f2f1..c37616c67edc 100644
--- a/arch/arm/boot/dts/bcm94709.dts
+++ b/arch/arm/boot/dts/bcm94709.dts
@@ -38,14 +38,6 @@
 	model = "NorthStar SVK (BCM94709)";
 	compatible = "brcm,bcm94709", "brcm,bcm4709", "brcm,bcm4708";
 
-	aliases {
-		serial0 = &uart0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
 	memory {
 		reg = <0x00000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm953012er.dts b/arch/arm/boot/dts/bcm953012er.dts
index decd86bae901..40e694bfe5ca 100644
--- a/arch/arm/boot/dts/bcm953012er.dts
+++ b/arch/arm/boot/dts/bcm953012er.dts
@@ -39,14 +39,6 @@
 	model = "NorthStar Enterprise Router (BCM953012ER)";
 	compatible = "brcm,bcm953012er", "brcm,brcm53012", "brcm,bcm4708";
 
-	aliases {
-		serial0 = &uart0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
 	memory {
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm953012hr.dts b/arch/arm/boot/dts/bcm953012hr.dts
index 85f9b0b872ac..5be4225324a3 100644
--- a/arch/arm/boot/dts/bcm953012hr.dts
+++ b/arch/arm/boot/dts/bcm953012hr.dts
@@ -39,14 +39,6 @@
 	model = "NorthStar HR (BCM953012HR)";
 	compatible = "brcm,bcm953012hr", "brcm,brcm53012", "brcm,bcm4708";
 
-	aliases {
-		serial0 = &uart0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
 	memory@80000000 {
 		reg = <0x80000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm953012k.dts b/arch/arm/boot/dts/bcm953012k.dts
index a00c4e1dfb4c..fbc6219e977a 100644
--- a/arch/arm/boot/dts/bcm953012k.dts
+++ b/arch/arm/boot/dts/bcm953012k.dts
@@ -43,10 +43,6 @@
 		serial1 = &uart1;
 	};
 
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
 	memory {
 		reg = <0x00000000 0x10000000>;
 	};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
