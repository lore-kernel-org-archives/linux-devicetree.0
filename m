From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 2/9] dt-bindings: regulator: Add document for MediaTek
 MT6380 regulator
Date: Tue, 15 Aug 2017 17:09:14 +0800
Message-ID: <0325c83fa4eeb1dc9e887548c1ad5ae8ab912c91.1502779753.git.sean.wang@mediatek.com>
References: <cover.1502779753.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1502779753.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

add dt-binding document for MediaTek MT6380 PMIC

Signed-off-by: Chenglin Xu <chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../bindings/regulator/mt6380-regulator.txt        | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6380-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
new file mode 100644
index 0000000..0058441
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
@@ -0,0 +1,89 @@
+MediaTek MT6380 Regulator
+
+All voltage regulators provided by the MT6380 PMIC are described as the
+subnodes of the MT6380 regulators node. Each regulator is named according
+to its regulator type, buck-<name> and ldo-<name>. The definition for each
+of these nodes is defined using the standard binding for regulators at
+Documentation/devicetree/bindings/regulator/regulator.txt.
+
+The valid names for regulators are:
+BUCK:
+  buck-core1, buck-vcore, buck-vrf
+LDO:
+  ldo-vm ,ldo-va , ldo-vphy, ldo-vddr, ldo-vt
+
+Example:
+
+	regulators {
+		compatible = "mediatek,mt6380-regulator";
+
+		mt6380_vcpu_reg: buck-vcore1 {
+			regulator-name = "vcore1";
+			regulator-min-microvolt = < 600000>;
+			regulator-max-microvolt = <1393750>;
+			regulator-ramp-delay = <6250>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		mt6380_vcore_reg: buck-vcore {
+			regulator-name = "vcore";
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <1393750>;
+			regulator-ramp-delay = <6250>;
+		};
+
+		mt6380_vrf_reg: buck-vrf {
+			regulator-name = "vrf";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1575000>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		mt6380_vm_reg: ldo-vm {
+			regulator-name = "vm";
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1400000>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		mt6380_va_reg: ldo-va {
+			regulator-name = "va";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		mt6380_vphy_reg: ldo-vphy {
+			regulator-name = "vphy";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		mt6380_vddr_reg: ldo-vddr {
+			regulator-name = "vddr";
+			regulator-min-microvolt = <1240000>;
+			regulator-max-microvolt = <1840000>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		mt6380_vt_reg: ldo-vt {
+			regulator-name = "vt";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
-- 
2.7.4
