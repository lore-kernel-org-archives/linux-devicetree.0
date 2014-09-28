From: "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 2/3] dt-bindings: add document of Rockchip power domain
Date: Sun, 28 Sep 2014 03:22:53 -0700
Message-ID: <1411899774-8484-3-git-send-email-jinkun.hong@rock-chips.com>
References: <1411899774-8484-1-git-send-email-jinkun.hong@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411899774-8484-1-git-send-email-jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Signed-off-by: Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: jinkun.hong <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v2:
Adviced by Doug
- move clocks to "optional"

 .../bindings/arm/rockchip/power_domain.txt         |   48 ++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/power_domain.txt

diff --git a/Documentation/devicetree/bindings/arm/rockchip/power_domain.txt b/Documentation/devicetree/bindings/arm/rockchip/power_domain.txt
new file mode 100644
index 0000000..3e74e6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/rockchip/power_domain.txt
@@ -0,0 +1,48 @@
+* Rockchip Power Domains
+
+Rockchip processors include support for multiple power domains which can be
+powered up/down by software based on different application scenes to save power.
+
+Required properties for power domain controller:
+- compatible: should be one of the following.
+    * rockchip,rk3288-power-controller - for rk3288 type power domain.
+- #power-domain-cells: Number of cells in a power-domain specifier.
+		       should be 1.
+- rockchip,pmu: phandle referencing a syscon providing the pmu registers
+- #address-cells: should be 1.
+- #size-cells: should be 0.
+
+Required properties for power domain sub nodes:
+- reg: index of the power domain, should use macros in:
+    *  include/dt-bindings/power-domain/rk3288.h - for rk3288 type power domain.
+- clocks (optional): phandles to clocks which need to be enabled while power domain
+          switches state.
+
+Example:
+
+	power: power-controller {
+	       compatible = "rockchip,rk3288-power-controller";
+	       #power-domain-cells = <1>;
+	       rockchip,pmu = <&pmu>;
+               #address-cells = <1>;
+               #size-cells = <0>;
+
+	       pd_gpu {
+	               reg = <RK3288_PD_GPU>;
+	               clocks = <&cru ACLK_GPU>;
+	       };
+	};
+
+Node of a device using power domains must have a power-domains property,
+containing a phandle to the power device node and an index specifying which
+power domain to use.
+The index should use macros in:
+   * include/dt-bindings/power-domain/rk3288.h - for rk3288 type power domain.
+
+Example of the node using power domain:
+
+	node {
+		/* ... */
+		power-domains = <&power RK3288_PD_GPU>;
+		/* ... */
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
