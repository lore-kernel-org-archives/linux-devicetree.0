From: Flora Fu <flora.fu@mediatek.com>
Subject: [PATCH 7/7] ARM: dts: mt8135: Add support for MT6397 regulator
Date: Mon, 17 Nov 2014 15:40:27 +0800
Message-ID: <1416210027-5562-8-git-send-email-flora.fu@mediatek.com>
References: <1416210027-5562-1-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1416210027-5562-1-git-send-email-flora.fu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ashwin Chaugule <ashwin.chaugule@linaro.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Flora Fu <flora.fu@mediatek.com>, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, Dongdong Cheng <dongdong.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add device tree for MT6397 regulators in mt8135.dtsi.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 arch/arm/boot/dts/mt8135.dtsi | 192 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index 14a8aad..4f78287 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -118,6 +118,198 @@
 
 			pmic {
 				compatible = "mediatek,mt6397";
+
+				regulators {
+					mt6397_vpca15_reg: buck_vpca15 {
+						regulator-name = "vpca15";
+						regulator-min-microvolt = < 700000>;
+						regulator-max-microvolt = <1493750>;
+						regulator-ramp-delay = <12500>;
+						regulator-enable-ramp-delay = <200>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					mt6397_vpca7_reg: buck_vpca7 {
+						regulator-name = "vpca7";
+						regulator-min-microvolt = < 700000>;
+						regulator-max-microvolt = <1493750>;
+						regulator-ramp-delay = <12500>;
+						regulator-enable-ramp-delay = <115>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					mt6397_vsramca15_reg: buck_vsramca15 {
+						regulator-name = "vsramca15";
+						regulator-min-microvolt = < 700000>;
+						regulator-max-microvolt = <1493750>;
+						regulator-ramp-delay = <12500>;
+						regulator-enable-ramp-delay = <115>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					mt6397_vsramca7_reg: buck_vsramca7 {
+						regulator-name = "vsramca7";
+						regulator-min-microvolt = < 700000>;
+						regulator-max-microvolt = <1493750>;
+						regulator-ramp-delay = <12500>;
+						regulator-enable-ramp-delay = <115>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					mt6397_vcore_reg: buck_vcore {
+						regulator-name = "vcore";
+						regulator-min-microvolt = < 700000>;
+						regulator-max-microvolt = <1493750>;
+						regulator-ramp-delay = <12500>;
+						regulator-enable-ramp-delay = <115>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					mt6397_vgpu_reg: buck_vgpu {
+						regulator-name = "vgpu";
+						regulator-min-microvolt = < 700000>;
+						regulator-max-microvolt = <1493750>;
+						regulator-ramp-delay = <12500>;
+						regulator-enable-ramp-delay = <115>;
+					};
+
+					mt6397_vdrm_reg: buck_vdrm {
+						regulator-name = "vdrm";
+						regulator-min-microvolt = < 800000>;
+						regulator-max-microvolt = <1593750>;
+						regulator-ramp-delay = <12500>;
+						regulator-enable-ramp-delay = <500>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					mt6397_vio18_reg: buck_vio18 {
+						regulator-name = "vio18";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-ramp-delay = <12500>;
+						regulator-enable-ramp-delay = <500>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					mt6397_vtcxo_reg: ldo_vtcxo {
+						regulator-name = "vtcxo";
+						regulator-min-microvolt = <2800000>;
+						regulator-max-microvolt = <2800000>;
+						regulator-enable-ramp-delay = <90>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					mt6397_va28_reg: ldo_va28 {
+						regulator-name = "va28";
+						regulator-min-microvolt = <2800000>;
+						regulator-max-microvolt = <2800000>;
+						regulator-enable-ramp-delay = <218>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					mt6397_vcama_reg: ldo_vcama {
+						regulator-name = "vcama";
+						regulator-min-microvolt = <1500000>;
+						regulator-max-microvolt = <2800000>;
+						regulator-enable-ramp-delay = <218>;
+					};
+
+					mt6397_vio28_reg: ldo_vio28 {
+						regulator-name = "vio28";
+						regulator-min-microvolt = <2800000>;
+						regulator-max-microvolt = <2800000>;
+						regulator-enable-ramp-delay = <240>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					mt6397_usb_reg: ldo_usb {
+						regulator-name = "usb";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-enable-ramp-delay = <218>;
+					};
+
+					mt6397_vmc_reg: ldo_vmc {
+						regulator-name = "vmc";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-enable-ramp-delay = <218>;
+					};
+
+					mt6397_vmch_reg: ldo_vmch {
+						regulator-name = "vmch";
+						regulator-min-microvolt = <3000000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-enable-ramp-delay = <218>;
+					};
+
+					mt6397_vemc_3v3_reg: ldo_vemc3v3 {
+						regulator-name = "vemc_3v3";
+						regulator-min-microvolt = <3000000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-enable-ramp-delay = <218>;
+						regulator-boot-on;
+					};
+
+					mt6397_vgp1_reg: ldo_vcamd {
+						regulator-name = "vgp1";
+						regulator-min-microvolt = <1220000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-enable-ramp-delay = <240>;
+					};
+
+					mt6397_vgp2_reg: ldo_vcamio {
+						regulator-name = "vgp2";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-enable-ramp-delay = <218>;
+					};
+
+					mt6397_vgp3_reg: ldo_vcamaf {
+						regulator-name = "vgp3";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-enable-ramp-delay = <218>;
+					};
+
+					mt6397_vgp4_reg: ldo_vgp4 {
+						regulator-name = "vgp4";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-enable-ramp-delay = <218>;
+					};
+
+					mt6397_vgp5_reg: ldo_vgp5 {
+						regulator-name = "vgp5";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <3000000>;
+						regulator-enable-ramp-delay = <218>;
+					};
+
+					mt6397_vgp6_reg: ldo_vgp6 {
+						regulator-name = "vgp6";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-enable-ramp-delay = <218>;
+					};
+
+					mt6397_vibr_reg: ldo_vibr {
+						regulator-name = "vibr";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-enable-ramp-delay = <218>;
+					};
+				};
 			};
 		};
 
-- 
1.8.1.1.dirty
