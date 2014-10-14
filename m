From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 2/3] dt-bindings: iommu: Add documentation for rockchip iommu
Date: Tue, 14 Oct 2014 15:45:04 +0800
Message-ID: <1413272705-9111-3-git-send-email-djkurtz@chromium.org>
References: <1413272705-9111-1-git-send-email-djkurtz@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413272705-9111-1-git-send-email-djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Xue <xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add binding documentation for Rockchip IOMMU.

Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Simon Xue <xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 .../devicetree/bindings/iommu/rockchip,iommu.txt   | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/rockchip,iommu.txt

diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.txt b/Documentation/devicetree/bindings/iommu/rockchip,iommu.txt
new file mode 100644
index 0000000..810e058a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.txt
@@ -0,0 +1,26 @@
+Rockchip IOMMU
+==============
+
+A Rockchip DRM iommu translates io virtual addresses to physical addresses for
+its master device.  Each slave device is bound to a single master device, and
+shares its clocks, power domain and irq.
+
+Required properties:
+- compatible      : Should be "rockchip,iommu"
+- reg             : Address space for the configuration registers
+- interrupts      : Interrupt specifier for the IOMMU instance
+- interrupt-names : Interrupt name for the IOMMU instance
+- #iommu-cells    : Should be <0>.  This indicates the iommu is a
+                    "single-master" device, and needs no additional information
+                    to associate with its master device.  See:
+                    Documentation/devicetree/bindings/iommu/iommu.txt
+
+Example:
+
+	vopl_mmu: iommu@0xff940300 {
+		compatible = "rockchip,iommu";
+		reg = <0xff940300 0x100>;
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "vopl_mmu";
+		#iommu-cells = <0>;
+	};
-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
