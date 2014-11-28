From: Flora Fu <flora.fu@mediatek.com>
Subject: [PATCH v2 5/8] dt-bindings: Add document for MT6397 MFD
Date: Fri, 28 Nov 2014 11:54:31 +0800
Message-ID: <1417146874-5232-6-git-send-email-flora.fu@mediatek.com>
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
 Documentation/devicetree/bindings/mfd/mt6397.txt | 73 ++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mt6397.txt

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
new file mode 100644
index 0000000..1f38c44
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -0,0 +1,73 @@
+MediaTek MT6397 Multifunction Device Driver
+
+MT6397 is a multifunction device with the following sub modules:
+- Regulator
+- RTC
+- Audio codec
+- GPIO
+- Clock
+
+It is interfaced to host controller using SPI interface by a proprietary hardware
+called PMIC wrapper or pwrap. MT6397 MFD is a child device of pwrap.
+See the following for pwarp node definitions:
+Documentation/devicetree/bindings/soc/mediatek,mt8135-pwrap.txt
+
+This document describes the binding for mfd device and its sub module.
+
+Required properties:
+compatible = "mediatek,mt6397";
+
+Optional properties:
+- codec: Audio codec
+- pinctrl: GPIO in mt6397
+- rtc: RTC
+- clock: clocks in mt6397
+- regulators: regulators in mt6397
+
+Example:
+	pwrap: pwrap@1000f000 {
+		compatible = "mediatek,mt8135-pwrap";
+		reg = <0 0x1000f000 0 0x1000>,
+			<0 0x11017000 0 0x1000>;
+		reg-names = "pwrap-base", "pwrap-bridge-base";
+		interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+		resets = <&infrarst MT8135_INFRA_PMIC_WRAP_RST>,
+				<&perirst MT8135_PERI_PWRAP_BRIDGE_SW_RST>;
+		reset-names = "infra-pwrap-rst",
+				"peri-pwrap-bridge-rst";
+		clocks = <&pmicspi_sel>, <&clk26m>;
+		clock-names = "pmicspi-sel", "pmicspi-parent";
+
+		pmic {
+			compatible = "mediatek,mt6397";
+
+			codec: mt6397codec {
+				compatible = "mediatek,mt6397-codec";
+			};
+
+			pinctrl@0x0000C000 {
+				compatible = "mediatek,mt6397-pinctrl";
+				reg = <0 0x0000C000 0 0x0108>;
+				gpio-controller;
+			};
+
+			regulators {
+				mt6397_vpca15_reg: buck_vpca15 {
+					regulator-name = "vpca15";
+					regulator-min-microvolt = < 700000>;
+					regulator-max-microvolt = <1493750>;
+					regulator-ramp-delay = <12500>;
+					regulator-enable-ramp-delay = <200>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				mt6397_vgp4_reg: ldo_vgp4 {
+					regulator-name = "vgp4";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-enable-ramp-delay = <218>;
+				};
+			}
+		}
+	}
-- 
1.8.1.1.dirty
