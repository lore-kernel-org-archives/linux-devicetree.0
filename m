From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 4/5] arm64: dts: rockchip: Add NanoPC-T4 IR receiver
Date: Tue,  8 Jan 2019 21:57:26 +0000
Message-ID: <a21283067b8d5132df430f3eca6a01ed9eebf1b2.1546981251.git.robin.murphy@arm.com>
References: <cover.1546981251.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1546981251.git.robin.murphy@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, tomeu.vizoso@collabora.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In common with most Rockchip reference designs, NanoPC-T4 has a passive
IR receiver connected to PWM3. In lieu of a specialised driver for
PWM-based IR pulse measurement, running the pin as a GPIO with the basic
driver works perfectly well.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 .../arm64/boot/dts/rockchip/rk3399-nanopc-t4.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dts b/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dts
index 623a03f2548a..84433cf02be9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dts
@@ -45,6 +45,22 @@
 			press-threshold-microvolt = <18000>;
 		};
 	};
+
+	ir-receiver {
+		compatible = "gpio-ir-receiver";
+		gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ir_rx>;
+	};
+};
+
+&pinctrl {
+	ir {
+		ir_rx: ir-rx {
+			/* external pullup to VCC3V3_SYS, despite being 1.8V :/ */
+			rockchip,pins = <0 RK_PA6 RK_FUNC_1 &pcfg_pull_none>;
+		};
+	};
 };
 
 &sdhci {
-- 
2.17.1
