From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] ARM64: dts: meson-gx: Add HDMI HPD/DDC pinctrl nodes
Date: Tue, 17 Jan 2017 13:05:38 +0100
Message-ID: <1484654738-5496-3-git-send-email-narmstrong@baylibre.com>
References: <1484654738-5496-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484654738-5496-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: khilman@baylibre.com, carlo@caione.org, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add pinctrl nodes for HDMI HPD and DDC pins modes for Amlogic Meson GXL
and GXBB SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 596240c..31d64a1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -463,6 +463,20 @@
 				function = "pwm_f_y";
 			};
 		};
+
+		hdmi_hpd_pins: hdmi_hpd {
+			mux {
+				groups = "hdmi_hpd";
+				function = "hdmi_hpd";
+			};
+		};
+
+		hdmi_i2c_pins: hdmi_i2c {
+			mux {
+				groups = "hdmi_sda", "hdmi_scl";
+				function = "hdmi_i2c";
+			};
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 6921624..17dbcf6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -229,6 +229,20 @@
 				function = "pwm_e";
 			};
 		};
+
+		hdmi_hpd_pins: hdmi_hpd {
+			mux {
+				groups = "hdmi_hpd";
+				function = "hdmi_hpd";
+			};
+		};
+
+		hdmi_i2c_pins: hdmi_i2c {
+			mux {
+				groups = "hdmi_sda", "hdmi_scl";
+				function = "hdmi_i2c";
+			};
+		};
 	};
 
 	eth-phy-mux {
-- 
1.9.1
