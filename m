From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 1/3] ARM: dts: rockchip: raise CPU trip point temperature for veyron to 100 degC
Date: Thu, 16 May 2019 09:29:40 -0700
Message-ID: <20190516162942.154823-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

This value matches what is used by the downstream Chrome OS 3.14
kernel, the 'official' kernel for veyron devices. Keep the temperature
for 'speedy' at 90°C, as in the downstream kernel.

Increase the temperature for a hardware shutdown to 125°C, which
matches the downstream configuration and gives the system a chance
to shut down orderly at the criticial trip point.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- patch added to the series
---
 arch/arm/boot/dts/rk3288-veyron-speedy.dts | 4 ++++
 arch/arm/boot/dts/rk3288-veyron.dtsi       | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
index e16421d80d22..ab2a66aa337e 100644
--- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
@@ -64,6 +64,10 @@
 	temperature = <70000>;
 };
 
+&cpu_crit {
+	temperature = <90000>;
+};
+
 &edp {
 	/delete-property/pinctrl-names;
 	/delete-property/pinctrl-0;
diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 192dbc089ade..58dc538b5df3 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -99,6 +99,10 @@
 	cpu0-supply = <&vdd_cpu>;
 };
 
+&cpu_crit {
+	temperature = <100000>;
+};
+
 /* rk3288-c used in Veyron Chrome-devices has slightly changed OPPs */
 &cpu_opp_table {
 	/delete-node/ opp-312000000;
@@ -371,6 +375,7 @@
 
 	rockchip,hw-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
 	rockchip,hw-tshut-polarity = <1>; /* tshut polarity 0:LOW 1:HIGH */
+	rockchip,hw-tshut-temp = <125000>;
 };
 
 &uart0 {
-- 
2.21.0.1020.gf2820cf01a-goog
