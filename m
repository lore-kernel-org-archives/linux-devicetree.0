From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 1/3] dt-bindings: hisilicon: add doc for Hi3798CV200 peripheral controller
Date: Mon, 30 Oct 2017 23:15:55 +0800
Message-ID: <1509376557-7187-2-git-send-email-shawnguo@kernel.org>
References: <1509376557-7187-1-git-send-email-shawnguo@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509376557-7187-1-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

It adds bindings doc for Hi3798CV200 peripheral controller.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/arm/hisilicon/hisilicon.txt           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index 7111fbc82a4e..199cd36fe1ba 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -75,6 +75,29 @@ Example:
 	};
 
 -----------------------------------------------------------------------
+Hisilicon Hi3798CV200 Peripheral Controller
+
+The Hi3798CV200 Peripheral Controller controls peripherals, queries
+their status, and configures some functions of peripherals.
+
+Required properties:
+- compatible: Should contain "hisilicon,hi3798cv200-perictrl", "syscon"
+  and "simple-mfd".
+- reg: Register address and size of Peripheral Controller.
+- #address-cells: Should be 1.
+- #size-cells: Should be 1.
+
+Examples:
+
+	perictrl: peripheral-controller@8a20000 {
+		compatible = "hisilicon,hi3798cv200-perictrl", "syscon",
+			     "simple-mfd";
+		reg = <0x8a20000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
+-----------------------------------------------------------------------
 Hisilicon Hi6220 system controller
 
 Required properties:
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
