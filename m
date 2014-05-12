From: <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv4 1/3] dts: socfpga: Add bindings for Altera SoC SDRAM controller
Date: Mon, 12 May 2014 18:36:55 -0500
Message-ID: <1399937817-2202-2-git-send-email-tthayer@altera.com>
References: <1399937817-2202-1-git-send-email-tthayer@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399937817-2202-1-git-send-email-tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

Addition of the Altera SDRAM controller bindings and device
tree changes to the Altera SoC project.

v2: Changes to SoC SDRAM EDAC code.

v3: Implement code suggestions for SDRAM EDAC code.

v4: Remove syscon from SDRAM controller bindings.

Signed-off-by: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/arm/altera/socfpga-sdram.txt          |   11 +++++++++++
 arch/arm/boot/dts/socfpga.dtsi                     |    5 +++++
 2 files changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt
new file mode 100644
index 0000000..8f8746b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt
@@ -0,0 +1,11 @@
+Altera SOCFPGA SDRAM Controller
+
+Required properties:
+- compatible : "altr,sdr-ctl";
+- reg : Should contain 1 register ranges(address and length)
+
+Example:
+	sdrctl@ffc25000 {
+		compatible = "altr,sdr-ctl";
+		reg = <0xffc25000 0x1000>;
+	};
diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index df43702..6ce912e 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -676,6 +676,11 @@
 			clocks = <&l4_sp_clk>;
 		};
 
+		sdrctl@ffc25000 {
+			compatible = "altr,sdr-ctl", "syscon";
+			reg = <0xffc25000 0x1000>;
+		};
+
 		rstmgr@ffd05000 {
 			compatible = "altr,rst-mgr";
 			reg = <0xffd05000 0x1000>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
