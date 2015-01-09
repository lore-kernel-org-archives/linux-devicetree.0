From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCHv6 5/5] arm: dts: Add Altera L2 Cache and OCRAM EDAC entries
Date: Thu, 8 Jan 2015 20:53:56 -0600
Message-ID: <1420772036-3112-6-git-send-email-tthayer@opensource.altera.com>
References: <1420772036-3112-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420772036-3112-1-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Adding the device tree entries and bindings needed to support
the Altera L2 cache and On-Chip RAM EDAC. This patch relies upon
an earlier patch to declare and setup On-chip RAM properly.
http://www.spinics.net/lists/devicetree/msg51117.html

Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
v2: Remove OCRAM declaration and reference prior patch.

v3-5: No Change

v6: Change to nested EDAC device nodes based on community
    feedback. Remove L2 syscon. Use consolidated binding.
---
 .../bindings/arm/altera/socfpga-edac.txt           |   46 ++++++++++++++++++++
 arch/arm/boot/dts/socfpga.dtsi                     |   20 +++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-edac.txt

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-edac.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-edac.txt
new file mode 100644
index 0000000..4bf32e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-edac.txt
@@ -0,0 +1,46 @@
+Altera SoCFPGA Error Detection and Correction [EDAC]
+
+Required Properties:
+- compatible : Should be "altr,edac"
+- #address-cells: must be 1
+- #size-cells: must be 1
+- ranges : standard definition, should translate from local addresses
+
+Subcomponents:
+
+L2 Cache ECC
+Required Properties:
+- compatible : Should be "altr,l2-edac"
+- reg : Address and size for ECC error interrupt clear registers.
+- interrupts : Should be single bit error interrupt, then double bit error
+	interrupt. Note the rising edge type.
+
+On Chip RAM ECC
+Required Properties:
+- compatible : Should be "altr,ocram-edac"
+- reg : Address and size for ECC error interrupt clear registers.
+- iram : phandle to On-Chip RAM definition.
+- interrupts : Should be single bit error interrupt, then double bit error
+	interrupt. Note the rising edge type.
+
+Example:
+
+	soc_ecc {
+		compatible = "altr,edac";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		l2edac@ffd08140 {
+			compatible = "altr,l2-edac";
+			reg = <0xffd08140 0x4>;
+			interrupts = <0 36 1>, <0 37 1>;
+		};
+
+		ocramedac@ffd08144 {
+			compatible = "altr,ocram-edac";
+			reg = <0xffd08144 0x4>;
+			iram = <&ocram>;
+			interrupts = <0 178 1>, <0 179 1>;
+		};
+	};
diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 252c3d1..e546e47 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -618,6 +618,26 @@
 			interrupts = <0 39 4>;
 		};
 
+		soc_ecc {
+			compatible = "altr,edac";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			l2edac@ffd08140 {
+				compatible = "altr,l2-edac";
+				reg = <0xffd08140 0x4>;
+				interrupts = <0 36 1>, <0 37 1>;
+			};
+
+			ocramedac@ffd08144 {
+				compatible = "altr,ocram-edac";
+				reg = <0xffd08144 0x4>;
+				iram = <&ocram>;
+				interrupts = <0 178 1>, <0 179 1>;
+			};
+		};
+
 		L2: l2-cache@fffef000 {
 			compatible = "arm,pl310-cache";
 			reg = <0xfffef000 0x1000>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
