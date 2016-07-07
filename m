From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 08/93] arm64: dts: rockchip: Add rktimer device node for rk3399
Date: Thu,  7 Jul 2016 10:00:41 +0200
Message-ID: <1467878526-1238-8-git-send-email-daniel.lezcano@linaro.org>
References: <577E0BED.3020608@linaro.org>
 <1467878526-1238-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1467878526-1238-1-git-send-email-daniel.lezcano@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tglx@linutronix.de, daniel.lezcano@linaro.org
Cc: Huang Tao <huangtao@rock-chips.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Jianqun Xu <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

From: Huang Tao <huangtao@rock-chips.com>

Add a 'rktimer' node in the device treee for the ARM64 rk3399 SoC.

Signed-off-by: Huang Tao <huangtao@rock-chips.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>
Tested-by: Jianqun Xu <jay.xu@rock-chips.com>
Signed-off-by: Caesar Wang <wxt@rock-chips.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 46f325a..f0c0d76 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -492,6 +492,14 @@
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	rktimer: rktimer@ff850000 {
+		compatible = "rockchip,rk3399-timer";
+		reg = <0x0 0xff850000 0x0 0x1000>;
+		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER0>, <&cru SCLK_TIMER00>;
+		clock-names = "pclk", "timer";
+	};
+
 	spdif: spdif@ff870000 {
 		compatible = "rockchip,rk3399-spdif";
 		reg = <0x0 0xff870000 0x0 0x1000>;
-- 
1.9.1
