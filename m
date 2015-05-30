From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Subject: [PATCH v4 07/12] devicetree: Add bindings for the ATH79 PLL controllers
Date: Sun, 31 May 2015 01:52:30 +0200
Message-ID: <1433029955-7346-8-git-send-email-albeu@free.fr>
References: <1433029955-7346-1-git-send-email-albeu@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433029955-7346-1-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
---
v2: * Fixed the node names to respect ePAPR
    * Fixed the missing 's' in 'fallbacks' and the 'clocks' property
v3: * Fix the compatible string for qca9550
---
 .../devicetree/bindings/clock/qca,ath79-pll.txt    | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qca,ath79-pll.txt

diff --git a/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
new file mode 100644
index 0000000..e0fc2c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
@@ -0,0 +1,33 @@
+Binding for Qualcomm Atheros AR7xxx/AR9XXX PLL controller
+
+The PPL controller provides the 3 main clocks of the SoC: CPU, DDR and AHB.
+
+Required Properties:
+- compatible: has to be "qca,<soctype>-cpu-intc" and one of the following
+  fallbacks:
+  - "qca,ar7100-pll"
+  - "qca,ar7240-pll"
+  - "qca,ar9130-pll"
+  - "qca,ar9330-pll"
+  - "qca,ar9340-pll"
+  - "qca,qca9550-pll"
+- reg: Base address and size of the controllers memory area
+- clock-names: Name of the input clock, has to be "ref"
+- clocks: phandle of the external reference clock
+- #clock-cells: has to be one
+
+Optional properties:
+- clock-output-names: should be "cpu", "ddr", "ahb"
+
+Example:
+
+	memory-controller@18050000 {
+		compatible = "qca,ar9132-ppl", "qca,ar9130-pll";
+		reg = <0x18050000 0x20>;
+
+		clock-names = "ref";
+		clocks = <&extosc>;
+
+		#clock-cells = <1>;
+		clock-output-names = "cpu", "ddr", "ahb";
+	};
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
