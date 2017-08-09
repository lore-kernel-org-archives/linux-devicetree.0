From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: mfd: Add bindings for the MediaTek MT6351
 PMIC
Date: Wed, 9 Aug 2017 10:31:03 +0800
Message-ID: <1502245865-11403-2-git-send-email-mars.cheng@mediatek.com>
References: <1502245865-11403-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1502245865-11403-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Jimmy-YJ.Huang" <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Jimmy-YJ.Huang" <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

This adds dt-binding documentation for Mediatek MT6351.
Only include mfd and regulator bindings.

Signed-off-by: Jimmy-YJ.Huang <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt   |   10 +-
 .../bindings/regulator/mt6351-regulator.txt        |  347 ++++++++++++++++++++
 2 files changed, 353 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6351-regulator.txt

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 522a3bb..42a6f21 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -1,6 +1,6 @@
-MediaTek MT6397/MT6323 Multifunction Device Driver
+MediaTek MT6397/MT6351/MT6323 Multifunction Device Driver
 
-MT6397/MT6323 is a multifunction device with the following sub modules:
+MT6397/MT6351/MT6323 is a multifunction device with the following sub modules:
 - Regulator
 - RTC
 - Audio codec
@@ -9,14 +9,14 @@ MT6397/MT6323 is a multifunction device with the following sub modules:
 - LED
 
 It is interfaced to host controller using SPI interface by a proprietary hardware
-called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
+called PMIC wrapper or pwrap. MT6397/MT6351/MT6323 MFD is a child device of pwrap.
 See the following for pwarp node definitions:
 Documentation/devicetree/bindings/soc/pwrap.txt
 
 This document describes the binding for MFD device and its sub module.
 
 Required properties:
-compatible: "mediatek,mt6397" or "mediatek,mt6323"
+compatible: "mediatek,mt6397" or "mediatek,mt6323" or "mediatek,mt6351"
 
 Optional subnodes:
 
@@ -27,6 +27,8 @@ Optional subnodes:
 	Required properties:
 		- compatible: "mediatek,mt6397-regulator"
 	see Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
+		- compatible: "mediatek,mt6351-regulator"
+	see Documentation/devicetree/bindings/regulator/mt6351-regulator.txt
 		- compatible: "mediatek,mt6323-regulator"
 	see Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
 - codec
diff --git a/Documentation/devicetree/bindings/regulator/mt6351-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6351-regulator.txt
new file mode 100644
index 0000000..2f3f9a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6351-regulator.txt
@@ -0,0 +1,347 @@
+Mediatek MT6351 Regulator Driver
+
+Required properties:
+- compatible: "mediatek,mt6351-regulator"
+- mt6351regulator: List of regulators provided by this controller. It is named
+  according to its regulator type, buck_<name> and ldo_<name>.
+  The definition for each of these nodes is defined using the standard binding
+  for regulators at Documentation/devicetree/bindings/regulator/regulator.txt.
+
+The valid names for regulators are::
+BUCK:
+  buck_vcore, buck_vgpu, buck_vmodem, buck_vmd1, buck_vsram_md,
+  buck_vs1, buck_vs2, buck_vpa, buck_vsram_proc
+LDO:
+  ldo_va18, ldo_vtcxo24, ldo_vtcxo28, ldo_vcn28, ldo_vcama,
+  ldo_vusb33, ldo_vsim1, ldo_vsim2, ldo_vemc_3v3, ldo_vmch,
+  ldo_vio28, ldo_vibr, ldo_vcamd, ldo_vrf18, ldo_vio18,
+  ldo_vcn18, ldo_vcamio, ldo_vxo22, ldo_vrf12, ldo_va10,
+  ldo_vdram, ldo_vmipi, ldo_vgp3, ldo_vbif28, ldo_vefuse,
+  ldo_vcn33_bt, ldo_vcn33_wifi, ldo_vldo28, ldo_vmc,
+  ldo_vldo28_0, ldo_vldo28_1
+
+Example:
+	pmic {
+		compatible = "mediatek,mt6351";
+
+		mt6351regulator: mt6351regulator {
+			compatible = "mediatek,mt6351-regulator";
+
+			mt6351_vcore_reg: buck_vcore {
+				regulator-name = "buck_vcore";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <180>;
+			};
+
+			mt6351_vgpu_reg: buck_vgpu {
+				regulator-name = "buck_vgpu";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <180>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6351_vmodem_reg: buck_vmodem {
+				regulator-name = "buck_vmodem";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <180>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6351_vmd1_reg: buck_vmd1 {
+				regulator-name = "buck_vmd1";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <180>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6351_vsram_md_reg: buck_vsram_md {
+				regulator-name = "buck_vsram_md";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <180>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6351_vs1_reg: buck_vs1 {
+				regulator-name = "buck_vs1";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <180>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6351_vs2_reg: buck_vs2 {
+				regulator-name = "buck_vs2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <180>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6351_vpa_reg: buck_vpa {
+				regulator-name = "buck_vpa";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <180>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6351_vsram_proc_reg: buck_vsram_proc {
+				regulator-name = "buck_vsram_proc";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <180>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			mt6351_va18_reg: ldo_va18 {
+				regulator-name = "ldo_va18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-boot-on;
+			};
+
+			mt6351_vtcxo24_reg: ldo_vtcxo24 {
+				regulator-name = "ldo_vtcxo24";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <110>;
+				regulator-boot-on;
+			};
+
+			mt6351_vtcxo28_reg: ldo_vtcxo28 {
+				regulator-name = "ldo_vtcxo28";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <110>;
+			};
+
+			mt6351_vcn28_reg: ldo_vcn28 {
+				regulator-name = "ldo_vcn28";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vcama_reg: ldo_vcama {
+				regulator-name = "ldo_vcama";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vusb33_reg: ldo_vusb33 {
+				regulator-name = "ldo_vusb33";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-boot-on;
+			};
+
+			mt6351_vsim1_reg: ldo_vsim1 {
+				regulator-name = "ldo_vsim1";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vsim2_reg: ldo_vsim2 {
+				regulator-name = "ldo_vsim2";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vemc_reg: ldo_vemc_3v3 {
+				regulator-name = "ldo_vemc_3v3";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <44>;
+				regulator-boot-on;
+			};
+
+			mt6351_vmch_reg: ldo_vmch {
+				regulator-name = "ldo_vmch";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <44>;
+				regulator-boot-on;
+			};
+
+			mt6351_vio28_reg: ldo_vio28 {
+				regulator-name = "ldo_vio28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-boot-on;
+			};
+
+			mt6351_vibr_reg: ldo_vibr {
+				regulator-name = "ldo_vibr";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <44>;
+			};
+
+			mt6351_vcamd_reg: ldo_vcamd {
+				regulator-name = "ldo_vcamd";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1210000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vrf18_reg: ldo_vrf18 {
+				regulator-name = "ldo_vrf18";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1810000>;
+				regulator-enable-ramp-delay = <220>;
+			};
+
+			mt6351_vio18_reg: ldo_vio18 {
+				regulator-name = "ldo_vio18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-boot-on;
+			};
+
+			mt6351_vcn18_reg: ldo_vcn18 {
+				regulator-name = "ldo_vcn18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <44>;
+			};
+
+			mt6351_vcamio_reg: ldo_vcamio {
+				regulator-name = "ldo_vcamio";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <220>;
+			};
+
+			mt6351_vxo22_reg: ldo_vxo22 {
+				regulator-name = "ldo_vxo22";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <110>;
+				regulator-boot-on;
+			};
+
+			mt6351_vrf12_reg: ldo_vrf12 {
+				regulator-name = "ldo_vrf12";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-enable-ramp-delay = <220>;
+			};
+
+			mt6351_va10_reg: ldo_va10 {
+				regulator-name = "ldo_va10";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-boot-on;
+			};
+
+			mt6351_vdram_reg: ldo_vdram {
+				regulator-name = "ldo_vdram";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1210000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-boot-on;
+			};
+
+			mt6351_vmipi_reg: ldo_vmipi {
+				regulator-name = "ldo_vmipi";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vgp3_reg: ldo_vgp3 {
+				regulator-name = "ldo_vgp3";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1810000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vbif28_reg: ldo_vbif28 {
+				regulator-name = "ldo_vbif28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vefuse_reg: ldo_vefuse {
+				regulator-name = "ldo_vefuse";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vcn33_bt_reg: ldo_vcn33_bt {
+				regulator-name = "ldo_vcn33_bt";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3600000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vcn33_wifi_reg: ldo_vcn33_wifi {
+				regulator-name = "ldo_vcn33_wifi";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3600000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vldo28_reg: ldo_vldo28 {
+				regulator-name = "ldo_vldo28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vmc_reg: ldo_vmc {
+				regulator-name = "ldo_vmc";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <44>;
+				regulator-boot-on;
+			};
+
+			mt6351_vldo28_0_reg: ldo_vldo28_0 {
+				regulator-name = "ldo_vldo28_0";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6351_vldo28_1_reg: ldo_vldo28_1 {
+				regulator-name = "ldo_vldo28_1";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+		};
+	};
-- 
1.7.9.5
