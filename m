From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCHv7 1/3] ARM: dts: Add Altera L2 Cache and OCRAM EDAC entries
Date: Tue, 27 Oct 2015 15:58:03 -0500
Message-ID: <1445979483-8035-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Adding the device tree entries and bindings needed to support
the Altera L2 cache and On-Chip RAM EDAC. This patch relies upon
an earlier patch to declare and setup On-chip RAM properly.
http://www.spinics.net/lists/devicetree/msg51117.html

Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
v7: No Change
v6: Change to nested EDAC device nodes based on community
    feedback. Remove L2 syscon. Use consolidated binding.
v3-5: No Change
v2: Remove OCRAM declaration and reference prior patch.
---
 .../bindings/arm/altera/socfpga-edac.txt           | 46 ++++++++++++++++++++++
 arch/arm/boot/dts/socfpga.dtsi                     | 20 ++++++++++
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
index 314e589..7cfec22 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -660,6 +660,26 @@
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
2.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
