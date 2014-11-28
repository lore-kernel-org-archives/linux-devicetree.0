From: Flora Fu <flora.fu@mediatek.com>
Subject: [PATCH v2 6/8] dt-bindings: Add document for MT6397 regulator
Date: Fri, 28 Nov 2014 11:54:32 +0800
Message-ID: <1417146874-5232-7-git-send-email-flora.fu@mediatek.com>
References: <1417146874-5232-1-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1417146874-5232-1-git-send-email-flora.fu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@arm.linux.org.uk>, Dongdong Cheng <dongdong.cheng@mediatek.com>, Sandeep Nair <sandeep_n@ti.com>, Flora Fu <flora.fu@mediatek.com>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@nvidia.com>, Eddie Huang <eddie.huang@mediatek.com>, srv_heupstream@mediatek.com, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org


Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 .../bindings/regulator/mt6397-regulator.txt        | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6397-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
new file mode 100644
index 0000000..3a3cc59
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
@@ -0,0 +1,32 @@
+Mediatek MT6397 Regulator Driver
+
+Required properties:
+- compatible: "mediatek,mt6397"
+- regulators: This is the list of child nodes that specify the regulator
+  initialization data for defined regulators. The definition for each of these
+  nodes is defined using the standard binding for regulators found at
+  Documentation/devicetree/bindings/regulator/regulator.txt.
+
+Example:
+	pmic {
+		compatible = "mediatek,mt6397";
+
+		regulators {
+			mt6397_vpca15_reg: buck_vpca15 {
+				regulator-name = "vpca15";
+				regulator-min-microvolt = < 700000>;
+				regulator-max-microvolt = <1493750>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6397_vgp4_reg: ldo_vgp4 {
+				regulator-name = "vgp4";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <218>;
+			};
+		};
+	};
-- 
1.8.1.1.dirty
