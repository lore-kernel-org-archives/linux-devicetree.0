From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 5/5] ARM64: dts: meson-gxbb: Add SCPI with cpufreq &
 sensors Nodes
Date: Wed, 19 Oct 2016 14:51:12 +0200
Message-ID: <1476881472-13055-6-git-send-email-narmstrong@baylibre.com>
References: <1476881472-13055-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1476881472-13055-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, sudeep.holla@arm.com, devicetree@vger.kernel.org
Cc: heiko@sntech.de, Neil Armstrong <narmstrong@baylibre.com>, frank.wang@rock-chips.com, khilman@baylibre.com, linux-amlogic@lists.infradead.org, wxt@rock-chips.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 48 +++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 28e218d..ff1975e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -74,6 +74,28 @@
 		};
 	};
 
+	scpi {
+		compatible = "amlogic,meson-gxbb-scpi";
+		mboxes = <&mailbox 1 &mailbox 2>;
+		shmem = <&cpu_scp_lpri &cpu_scp_hpri>;
+
+		clocks {
+			compatible = "arm,scpi-clocks";
+
+			scpi_dvfs: scpi_clocks@0 {
+				compatible = "arm,scpi-dvfs-clocks";
+				#clock-cells = <1>;
+				clock-indices = <0>;
+				clock-output-names = "vcpu";
+			};
+		};
+
+		scpi_sensors: sensors {
+			compatible = "arm,scpi-sensors";
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
 	soc {
 		usb0_phy: phy@c0000000 {
 			compatible = "amlogic,meson-gxbb-usb2-phy";
@@ -101,6 +123,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x0 0xc8000000 0x14000>;
+
+			cpu_scp_lpri: scp-shmem@0 {
+				compatible = "amlogic,meson-gxbb-scp-shmem";
+				reg = <0x13000 0x400>;
+			};
+
+			cpu_scp_hpri: scp-shmem@200 {
+				compatible = "amlogic,meson-gxbb-scp-shmem";
+				reg = <0x13400 0x400>;
+			};
 		};
 
 		usb0: usb@c9000000 {
@@ -143,6 +175,22 @@
 	};
 };
 
+&cpu0 {
+	clocks = <&scpi_dvfs 0>;
+};
+
+&cpu1 {
+	clocks = <&scpi_dvfs 0>;
+};
+
+&cpu2 {
+	clocks = <&scpi_dvfs 0>;
+};
+
+&cpu3 {
+	clocks = <&scpi_dvfs 0>;
+};
+
 &cbus {
 	reset: reset-controller@4404 {
 		compatible = "amlogic,meson-gxbb-reset";
-- 
1.9.1
