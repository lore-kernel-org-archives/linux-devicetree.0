From: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH v2 1/3] Document: dw_mmc-k3: add document of hi6220 mmc
Date: Thu,  7 May 2015 15:56:39 +0800
Message-ID: <1430985401-12202-2-git-send-email-zhangfei.gao@linaro.org>
References: <1430985401-12202-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1430985401-12202-1-git-send-email-zhangfei.gao@linaro.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>, ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: devicetree@vger.kernel.org

Add bindings for hi6220 mmc support

Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
---
 .../devicetree/bindings/mmc/k3-dw-mshc.txt         | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
index 3b35449..df37058 100644
--- a/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
+++ b/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
@@ -13,6 +13,10 @@ Required Properties:
 
 * compatible: should be one of the following.
   - "hisilicon,hi4511-dw-mshc": for controllers with hi4511 specific extensions.
+  - "hisilicon,hi6220-dw-mshc": for controllers with hi6220 specific extensions.
+
+Optional Properties:
+- hisilicon,peripheral-syscon: phandle of syscon used to control peripheral.
 
 Example:
 
@@ -42,3 +46,27 @@ Example:
 		cap-mmc-highspeed;
 		cap-sd-highspeed;
 	};
+
+	/* for Hi6220 */
+
+	dwmmc_1: dwmmc1@f723e000 {
+		compatible = "hisilicon,hi6220-dw-mshc";
+		num-slots = <0x1>;
+		bus-width = <0x4>;
+		disable-wp;
+		cap-sd-highspeed;
+		sd-uhs-sdr12;
+		sd-uhs-sdr25;
+		card-detect-delay = <200>;
+		hisilicon,peripheral-syscon = <&ao_ctrl>;
+		reg = <0x0 0xf723e000 0x0 0x1000>;
+		interrupts = <0x0 0x49 0x4>;
+		clocks = <&clock_sys HI6220_MMC1_CIUCLK>, <&clock_sys HI6220_MMC1_CLK>;
+		clock-names = "ciu", "biu";
+		cd-gpios = <&gpio1 0 1>;
+		pinctrl-names = "default", "idle";
+		pinctrl-0 = <&sd_pmx_func &sd_clk_cfg_func &sd_cfg_func>;
+		pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
+		vqmmc-supply = <&ldo7>;
+		vmmc-supply = <&ldo10>;
+	};
-- 
1.9.1

