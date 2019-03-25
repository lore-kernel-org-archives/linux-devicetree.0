From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/2] ARM: dts: rockchip: Add device tree for rk3288-veyron-mighty
Date: Mon, 25 Mar 2019 09:20:05 -0700
Message-ID: <20190325162005.99391-2-dianders@chromium.org>
References: <20190325162005.99391-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325162005.99391-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: mka@chromium.org, ryandcase@chromium.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Mighty is basically the same Chromebook as Jaq but it has a full-sized
SD slot and some different (slightly more rugged) plastics around it.
Like Jaq, Mighty may show up with various different brandings but all
of them have the same board inside.

In the downstream kernel Mighty and Jaq share a "dtsi" and Mighty just
adds the SD write protect (needed for a full-sized SD slot).  We'll do
this upstream by just including the Jaq dts and make the changes.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Directly include the jaq dts and just specify diffs.

 arch/arm/boot/dts/Makefile                 |  1 +
 arch/arm/boot/dts/rk3288-veyron-mighty.dts | 34 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3288-veyron-mighty.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f4f5aeaf3298..48282ebfb3da 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -909,6 +909,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3288-veyron-jaq.dtb \
 	rk3288-veyron-jerry.dtb \
 	rk3288-veyron-mickey.dtb \
+	rk3288-veyron-mighty.dtb \
 	rk3288-veyron-minnie.dtb \
 	rk3288-veyron-pinky.dtb \
 	rk3288-veyron-speedy.dtb \
diff --git a/arch/arm/boot/dts/rk3288-veyron-mighty.dts b/arch/arm/boot/dts/rk3288-veyron-mighty.dts
new file mode 100644
index 000000000000..f640857cbdae
--- /dev/null
+++ b/arch/arm/boot/dts/rk3288-veyron-mighty.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Veyron Mighty Rev 1+ board device tree source
+ *
+ * Copyright 2015 Google, Inc
+ */
+
+/dts-v1/;
+
+#include "rk3288-veyron-jaq.dts"
+
+/ {
+	model = "Google Mighty";
+	compatible = "google,veyron-mighty-rev5", "google,veyron-mighty-rev4",
+		     "google,veyron-mighty-rev3", "google,veyron-mighty-rev2",
+		     "google,veyron-mighty-rev1", "google,veyron-mighty",
+		     "google,veyron", "rockchip,rk3288";
+};
+
+&sdmmc {
+	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_cd_disabled &sdmmc_cd_gpio
+			&sdmmc_wp_gpio &sdmmc_bus4>;
+	wp-gpios = <&gpio7 10 GPIO_ACTIVE_HIGH>;
+
+	/delete-property/ disable-wp;
+};
+
+&pinctrl {
+	sdmmc {
+		sdmmc_wp_gpio: sdmmc-wp-gpio {
+			rockchip,pins = <7 10 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
-- 
2.21.0.392.gf8f6787159e-goog
