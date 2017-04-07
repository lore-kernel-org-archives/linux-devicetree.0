From: Youlin Pei <youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 1/3] binding: irqchip: mtk-cirq: Add binding document
Date: Fri, 7 Apr 2017 16:06:35 +0800
Message-ID: <1491552397-7893-2-git-send-email-youlin.pei@mediatek.com>
References: <1491552397-7893-1-git-send-email-youlin.pei@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491552397-7893-1-git-send-email-youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This commit adds the device tree binding document for
the mediatek cirq.

Signed-off-by: Youlin Pei <youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../interrupt-controller/mediatek,cirq.txt         |   35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
new file mode 100644
index 0000000..a7efdbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
@@ -0,0 +1,35 @@
+* Mediatek 27xx cirq
+
+In Mediatek SOCs, the CIRQ is a low power interrupt controller designed to
+work outside MCUSYS which comprises with Cortex-Ax cores,CCI and GIC.
+The external interrupts (outside MCUSYS) will feed through CIRQ and connect
+to GIC in MCUSYS. When CIRQ is enabled, it will record the edge-sensitive
+interrupts and generate a pulse signal to parent interrupt controller when
+flush command is executed. With CIRQ, MCUSYS can be completely turned off
+to improve the system power consumption without losing interrupts.
+
+Required properties:
+- compatible: should be one of
+  - "mediatek,mt2701-cirq" for mt2701 CIRQ
+  - "mediatek,mt8135-cirq" for mt8135 CIRQ
+  - "mediatek,mt8173-cirq" for mt8173 CIRQ
+  and "mediatek,cirq" as a fallback.
+- interrupt-controller : Identifies the node as an interrupt controller.
+- #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
+- interrupt-parent: phandle of irq parent for cirq. The parent must
+  use the same interrupt-cells format as GIC.
+- reg: Physical base address of the cirq registers and length of memory
+  mapped region.
+- mediatek,ext-irq-range: Identifies external irq number range in different
+  SOCs.
+
+Example:
+	cirq: interrupt-controller@10204000 {
+		compatible = "mediatek,mt2701-cirq",
+			     "mediatek,mtk-cirq";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&sysirq>;
+		reg = <0 0x10204000 0 0x400>;
+		mediatek,ext-irq-start = <32 200>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
