From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [RFC 1/4] irqchip, gicv3-its: Add device tree binding for hisilicon
 161010801 erratum
Date: Tue, 24 Jan 2017 13:42:56 +0000
Message-ID: <588759E0.1010804@huawei.com>
References: <588625E3.9040703@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <588625E3.9040703-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This erratum describes the limitation of certain HiSilicon platforms
to support the SMMU mappings for MSI transactions and on those platforms
the MSI transactions has to be bypassed by SMMU. The IIDR register of the
GICv3 ITS on these platforms are not properly populated to differentiate
the hardware, hence describe it in device tree.

Signed-off-by: shameer <shameerali.kolothum.thodi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
index 4c29cda..84af301 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
@@ -75,6 +75,12 @@ These nodes must have the following properties:
 - reg: Specifies the base physical address and size of the ITS
   registers.

+Optional
+- hisilicon,erratum-161010801 : A boolean property. Indicates the presence of
+  erratum 161010801, which says that these platforms doesn't support  SMMU
+  mapping for MSI transactions and those transactions has to be bypassed
+  by SMMU.
+
 The main GIC node must contain the appropriate #address-cells,
 #size-cells and ranges properties for the reg property of all ITS
 nodes.
-- 
1.9.1








--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
