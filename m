From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 1/7] reset: sunxi: document sunxi's reset controllers bindings
Date: Wed, 14 May 2014 14:38:15 +0200
Message-ID: <1400071101-30553-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1400071101-30553-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1400071101-30553-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Philipp Zabel <p.zabel@pengutronix.de>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, Hans de Goede <hdegoede@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dev@linux-sunxi.org, Boris BREZILLON <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Add DT bindings documentation for sunxi's reset controllers.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 .../bindings/reset/allwinner,sunxi-clock-reset.txt  | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/allwinner,sunxi-clock-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/allwinner,sunxi-clock-reset.txt b/Documentation/devicetree/bindings/reset/allwinner,sunxi-clock-reset.txt
new file mode 100644
index 0000000..c8f7757
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/allwinner,sunxi-clock-reset.txt
@@ -0,0 +1,21 @@
+Allwinner sunxi Peripheral Reset Controller
+===========================================
+
+Please also refer to reset.txt in this directory for common reset
+controller binding usage.
+
+Required properties:
+- compatible: Should be one of the following:
+  "allwinner,sun6i-a31-ahb1-reset"
+  "allwinner,sun6i-a31-clock-reset"
+- reg: should be register base and length as documented in the
+  datasheet
+- #reset-cells: 1, see below
+
+example:
+
+ahb1_rst: reset@01c202c0 {
+	#reset-cells = <1>;
+	compatible = "allwinner,sun6i-a31-ahb1-reset";
+	reg = <0x01c202c0 0xc>;
+};
-- 
1.8.3.2

