From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 1/3] ARM: dts: rockchip: disable GPU 500 MHz OPP for veyron
Date: Mon, 20 May 2019 15:00:49 -0700
Message-ID: <20190520220051.54847-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

The NPLL is the only safe way to generate 500 MHz for the GPU. The
downstream Chrome OS 3.14 kernel ('official' kernel for veyron
devices) re-purposes NPLL to HDMI and hence disables the OPP for
the GPU (see https://crrev.com/c/1574579). Disable it here as well
to keep in sync and avoid problems in case someone decides to
re-purpose NPLL.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- patch added to the series
---
 arch/arm/boot/dts/rk3288-veyron.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 90c8312d01ff..ec10ce4fcf04 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -174,6 +174,14 @@
 	temperature = <100000>;
 };
 
+/*
+ * Remove 500 MHz since the only way to make 500 MHz is via the NPLL
+ * which might be used for HDMI.
+ */
+&gpu_opp_table {
+	/delete-node/ opp-500000000;
+};
+
 &hdmi {
 	ddc-i2c-bus = <&i2c5>;
 	status = "okay";
-- 
2.21.0.1020.gf2820cf01a-goog
