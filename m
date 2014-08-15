From: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: [RFC] arm64: Add new cpu-return-addr device tree binding
Date: Fri, 15 Aug 2014 12:48:50 -0700
Message-ID: <1408132130.22761.64.camel@smoke>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a new device tree binding cpu-return-addr.  This binding is required for
all ARM v8 CPUs that have an "enable-method" property value of "spin-table". The
value is a 64 bit read-only physical address that secondary CPU execution will
transfer to upon CPU shutdown.

Signed-off-by: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
---
Hi All,

We currently have no way for arm64 spin-table CPUs to re-enter the spin
table code, and some way to do so is needed to implement a hot-plug
cpu_die() for these CPUs.  

I just wanted to get this binding patch out for review now.  I have other
patches that implement the spin-table hot-plug in my kexec repo [1].

Please consider.

-Geoff

[1] https://git.linaro.org/people/geoff.levand/linux-kexec.git

 Documentation/devicetree/bindings/arm/cpus.txt     | 26 ++++++++++++++++++++++
 Documentation/devicetree/bindings/arm/topology.txt | 16 +++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 1fe72a0..24b98a9 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -201,6 +201,16 @@ nodes to be present and contain the properties described below.
 			  property identifying a 64-bit zero-initialised
 			  memory location.
 
+	- cpu-return-addr
+		Usage: required for all ARM v8 CPUs that have an "enable-method"
+		       property value of "spin-table".
+		Value type: <prop-encoded-array>
+		Definition:
+			# On ARM v8 64-bit systems must be a two cell property.
+			The value is a 64 bit read-only physical address that
+			secondary CPU execution will transfer to upon CPU
+			shutdown.
+
 	- qcom,saw
 		Usage: required for systems that have an "enable-method"
 		       property value of "qcom,kpss-acc-v1" or
@@ -285,6 +295,7 @@ cpus {
 		reg = <0x0 0x0>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@1 {
@@ -293,6 +304,7 @@ cpus {
 		reg = <0x0 0x1>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@100 {
@@ -301,6 +313,7 @@ cpus {
 		reg = <0x0 0x100>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@101 {
@@ -309,6 +322,7 @@ cpus {
 		reg = <0x0 0x101>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@10000 {
@@ -317,6 +331,7 @@ cpus {
 		reg = <0x0 0x10000>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@10001 {
@@ -325,6 +340,7 @@ cpus {
 		reg = <0x0 0x10001>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@10100 {
@@ -333,6 +349,7 @@ cpus {
 		reg = <0x0 0x10100>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@10101 {
@@ -341,6 +358,7 @@ cpus {
 		reg = <0x0 0x10101>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@100000000 {
@@ -349,6 +367,7 @@ cpus {
 		reg = <0x1 0x0>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@100000001 {
@@ -357,6 +376,7 @@ cpus {
 		reg = <0x1 0x1>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@100000100 {
@@ -365,6 +385,7 @@ cpus {
 		reg = <0x1 0x100>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@100000101 {
@@ -373,6 +394,7 @@ cpus {
 		reg = <0x1 0x101>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@100010000 {
@@ -381,6 +403,7 @@ cpus {
 		reg = <0x1 0x10000>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@100010001 {
@@ -389,6 +412,7 @@ cpus {
 		reg = <0x1 0x10001>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@100010100 {
@@ -397,6 +421,7 @@ cpus {
 		reg = <0x1 0x10100>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	cpu@100010101 {
@@ -405,6 +430,7 @@ cpus {
 		reg = <0x1 0x10101>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 };
 
diff --git a/Documentation/devicetree/bindings/arm/topology.txt b/Documentation/devicetree/bindings/arm/topology.txt
index 1061faf..29e2193 100644
--- a/Documentation/devicetree/bindings/arm/topology.txt
+++ b/Documentation/devicetree/bindings/arm/topology.txt
@@ -260,6 +260,7 @@ cpus {
 		reg = <0x0 0x0>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU1: cpu@1 {
@@ -268,6 +269,7 @@ cpus {
 		reg = <0x0 0x1>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU2: cpu@100 {
@@ -276,6 +278,7 @@ cpus {
 		reg = <0x0 0x100>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU3: cpu@101 {
@@ -284,6 +287,7 @@ cpus {
 		reg = <0x0 0x101>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU4: cpu@10000 {
@@ -292,6 +296,7 @@ cpus {
 		reg = <0x0 0x10000>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU5: cpu@10001 {
@@ -300,6 +305,7 @@ cpus {
 		reg = <0x0 0x10001>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU6: cpu@10100 {
@@ -308,6 +314,7 @@ cpus {
 		reg = <0x0 0x10100>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU7: cpu@10101 {
@@ -316,6 +323,7 @@ cpus {
 		reg = <0x0 0x10101>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU8: cpu@100000000 {
@@ -324,6 +332,7 @@ cpus {
 		reg = <0x1 0x0>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU9: cpu@100000001 {
@@ -332,6 +341,7 @@ cpus {
 		reg = <0x1 0x1>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU10: cpu@100000100 {
@@ -340,6 +350,7 @@ cpus {
 		reg = <0x1 0x100>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU11: cpu@100000101 {
@@ -348,6 +359,7 @@ cpus {
 		reg = <0x1 0x101>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU12: cpu@100010000 {
@@ -356,6 +368,7 @@ cpus {
 		reg = <0x1 0x10000>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU13: cpu@100010001 {
@@ -364,6 +377,7 @@ cpus {
 		reg = <0x1 0x10001>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU14: cpu@100010100 {
@@ -372,6 +386,7 @@ cpus {
 		reg = <0x1 0x10100>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 
 	CPU15: cpu@100010101 {
@@ -380,6 +395,7 @@ cpus {
 		reg = <0x1 0x10101>;
 		enable-method = "spin-table";
 		cpu-release-addr = <0 0x20000000>;
+		cpu-return-addr = <0 0x20001000>
 	};
 };
 
-- 
1.9.1



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
