From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 1/9] ARM: dts: mvebu: fix cpus section indentation
Date: Tue,  9 Apr 2013 00:52:09 +0200
Message-ID: <1365461538-30702-2-git-send-email-gregory.clement@free-electrons.com>
References: <1365461538-30702-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365461538-30702-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <leif.lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Van Hoof <vanhoof-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Align the cpu node indentation with the rest of the file

[gc]: added a commit description
Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-xp-mv78230.dtsi |   28 ++++++++--------
 arch/arm/boot/dts/armada-xp-mv78260.dtsi |   28 ++++++++--------
 arch/arm/boot/dts/armada-xp-mv78460.dtsi |   54 +++++++++++++++---------------
 3 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-mv78230.dtsi b/arch/arm/boot/dts/armada-xp-mv78230.dtsi
index f56c405..50180eb 100644
--- a/arch/arm/boot/dts/armada-xp-mv78230.dtsi
+++ b/arch/arm/boot/dts/armada-xp-mv78230.dtsi
@@ -25,22 +25,22 @@
 	};
 
 	cpus {
-	    #address-cells = <1>;
-	    #size-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-	    cpu@0 {
-		device_type = "cpu";
-		compatible = "marvell,sheeva-v7";
-		reg = <0>;
-		clocks = <&cpuclk 0>;
-	    };
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "marvell,sheeva-v7";
+			reg = <0>;
+			clocks = <&cpuclk 0>;
+		};
 
-	    cpu@1 {
-		device_type = "cpu";
-		compatible = "marvell,sheeva-v7";
-		reg = <1>;
-		clocks = <&cpuclk 1>;
-	    };
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "marvell,sheeva-v7";
+			reg = <1>;
+			clocks = <&cpuclk 1>;
+		};
 	};
 
 	soc {
diff --git a/arch/arm/boot/dts/armada-xp-mv78260.dtsi b/arch/arm/boot/dts/armada-xp-mv78260.dtsi
index f8f2b78..3c433d5 100644
--- a/arch/arm/boot/dts/armada-xp-mv78260.dtsi
+++ b/arch/arm/boot/dts/armada-xp-mv78260.dtsi
@@ -26,22 +26,22 @@
 	};
 
 	cpus {
-	    #address-cells = <1>;
-	    #size-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-	    cpu@0 {
-		device_type = "cpu";
-		compatible = "marvell,sheeva-v7";
-		reg = <0>;
-		clocks = <&cpuclk 0>;
-	    };
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "marvell,sheeva-v7";
+			reg = <0>;
+			clocks = <&cpuclk 0>;
+		};
 
-	    cpu@1 {
-		device_type = "cpu";
-		compatible = "marvell,sheeva-v7";
-		reg = <1>;
-		clocks = <&cpuclk 1>;
-	    };
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "marvell,sheeva-v7";
+			reg = <1>;
+			clocks = <&cpuclk 1>;
+		};
 	};
 
 	soc {
diff --git a/arch/arm/boot/dts/armada-xp-mv78460.dtsi b/arch/arm/boot/dts/armada-xp-mv78460.dtsi
index 936c25d..4c38e942 100644
--- a/arch/arm/boot/dts/armada-xp-mv78460.dtsi
+++ b/arch/arm/boot/dts/armada-xp-mv78460.dtsi
@@ -27,36 +27,36 @@
 
 
 	cpus {
-	    #address-cells = <1>;
-	    #size-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-	    cpu@0 {
-		device_type = "cpu";
-		compatible = "marvell,sheeva-v7";
-		reg = <0>;
-		clocks = <&cpuclk 0>;
-	    };
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "marvell,sheeva-v7";
+			reg = <0>;
+			clocks = <&cpuclk 0>;
+		};
 
-	    cpu@1 {
-		device_type = "cpu";
-		compatible = "marvell,sheeva-v7";
-		reg = <1>;
-		clocks = <&cpuclk 1>;
-	    };
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "marvell,sheeva-v7";
+			reg = <1>;
+			clocks = <&cpuclk 1>;
+		};
 
-	    cpu@2 {
-		device_type = "cpu";
-		compatible = "marvell,sheeva-v7";
-		reg = <2>;
-		clocks = <&cpuclk 2>;
-	    };
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "marvell,sheeva-v7";
+			reg = <2>;
+			clocks = <&cpuclk 2>;
+		};
 
-	    cpu@3 {
-		device_type = "cpu";
-		compatible = "marvell,sheeva-v7";
-		reg = <3>;
-		clocks = <&cpuclk 3>;
-	    };
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "marvell,sheeva-v7";
+			reg = <3>;
+			clocks = <&cpuclk 3>;
+		};
 	};
 
 	soc {
@@ -112,4 +112,4 @@
 				status = "disabled";
 		};
 	};
- };
+};
-- 
1.7.9.5
