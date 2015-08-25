From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RESEND PATCH v16 1/4] dt-bindings: add document of Rockchip power
 domain
Date: Tue, 25 Aug 2015 15:24:43 +0800
Message-ID: <1440487486-6154-2-git-send-email-wxt@rock-chips.com>
References: <1440487486-6154-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1440487486-6154-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This add the necessary binding documentation for the power domain
found on Rockchip Socs.

Signed-off-by: jinkun.hong <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v16:
- remove the pmu node.

Changes in v15: None
Changes in v14: None
Changes in v13: None
Changes in v12: None
Changes in v11: None
Changes in v10: None
Changes in v9:
- add document decription.

Changes in v8:
- document go back to v2.

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3:
- DT structure has changed.

Changes in v2:
- move clocks to "optional".

 .../bindings/soc/rockchip/power_domain.txt         | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/power_domain.txt

diff --git a/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt b/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt
new file mode 100644
index 0000000..138754d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt
@@ -0,0 +1,46 @@
+* Rockchip Power Domains
+
+Rockchip processors include support for multiple power domains which can be
+powered up/down by software based on different application scenes to save power.
+
+Required properties for power domain controller:
+- compatible: Should be one of the following.
+	"rockchip,rk3288-power-controller" - for RK3288 SoCs.
+- #power-domain-cells: Number of cells in a power-domain specifier.
+	Should be 1 for multiple PM domains.
+- #address-cells: Should be 1.
+- #size-cells: Should be 0.
+
+Required properties for power domain sub nodes:
+- reg: index of the power domain, should use macros in:
+	"include/dt-bindings/power-domain/rk3288.h" - for rk3288 type power domain.
+- clocks (optional): phandles to clocks which need to be enabled while power domain
+	switches state.
+
+Example:
+
+	power: power-controller {
+		compatible = "rockchip,rk3288-power-controller";
+		#power-domain-cells = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pd_gpu {
+			reg = <RK3288_PD_GPU>;
+			clocks = <&cru ACLK_GPU>;
+		};
+	};
+
+Node of a device using power domains must have a power-domains property,
+containing a phandle to the power device node and an index specifying which
+power domain to use.
+The index should use macros in:
+	"include/dt-bindings/power-domain/rk3288.h" - for rk3288 type power domain.
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
