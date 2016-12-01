From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [resend v2: PATCH 1/2] dt-bindings: Document the hi3660 reset bindings
Date: Thu,  1 Dec 2016 08:48:40 +0800
Message-ID: <1480553321-17400-2-git-send-email-zhangfei.gao@linaro.org>
References: <1480553321-17400-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480553321-17400-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT bindings documentation for hi3660 SoC reset controller.

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/reset/hisilicon,hi3660-reset.txt      | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt b/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
new file mode 100644
index 0000000..250daf2
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
@@ -0,0 +1,51 @@
+Hisilicon System Reset Controller
+======================================
+
+Please also refer to reset.txt in this directory for common reset
+controller binding usage.
+
+The reset controller registers are part of the system-ctl block on
+hi3660 SoC.
+
+Required properties:
+- compatible: should be
+		 "hisilicon,hi3660-reset"
+- #reset-cells: 1, see below
+- hisi,rst-syscon: phandle of the reset's syscon.
+- hisi,reset-bits: Contains the reset control register information
+		  Should contain 2 cells for each reset exposed to
+		  consumers, defined as:
+			Cell #1 : offset from the syscon register base
+			Cell #2 : bits position of the control register
+
+Example:
+	iomcu: iomcu@ffd7e000 {
+		compatible = "hisilicon,hi3660-iomcu", "syscon";
+		reg = <0x0 0xffd7e000 0x0 0x1000>;
+	};
+
+	iomcu_rst: iomcu_rst_controller {
+		compatible = "hisilicon,hi3660-reset";
+		#reset-cells = <1>;
+		hisi,rst-syscon = <&iomcu>;
+		hisi,reset-bits = <0x20 0x8		/* 0: i2c0 */
+				   0x20 0x10		/* 1: i2c1 */
+				   0x20 0x20		/* 2: i2c2 */
+				   0x20 0x8000000>;	/* 3: i2c6 */
+	};
+
+Specifying reset lines connected to IP modules
+==============================================
+example:
+
+        i2c0: i2c@..... {
+                ...
+		resets = <&iomcu_rst 0>;
+                ...
+        };
+
+	i2c1: i2c@..... {
+                ...
+		resets = <&iomcu_rst 1>;
+                ...
+        };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
