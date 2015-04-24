From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v14 1/3] dt-bindings: add document of Rockchip power domain
Date: Fri, 24 Apr 2015 16:07:46 +0800
Message-ID: <1429862868-14218-2-git-send-email-wxt@rock-chips.com>
References: <1429862868-14218-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1429862868-14218-1-git-send-email-wxt@rock-chips.com>
Sender: linux-doc-owner@vger.kernel.org
To: heiko@sntech.de, khilman@linaro.org, linux-arm-kernel@lists.infradead.org
Cc: linus.walleij@linaro.org, tomasz.figa@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, grant.likely@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rdunlap@infradead.org, linux-doc@vger.kernel.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, ulf.hansson@linaro.org, dmitry.torokhov@gmail.com, broonie@kernel.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, Caesar Wang <wxt@rock-chips.com>, "jinkun.hong" <jinkun.hong@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This add the necessary binding documentation for the power domain
found on Rockchip Socs.

Signed-off-by: jinkun.hong <jinkun.hong@rock-chips.com>
Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

 .../bindings/arm/rockchip/power_domain.txt         | 48 ++++++++++++++++++++++
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
1.9.1


