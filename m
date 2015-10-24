From: Xing Zheng <zhengxing@rock-chips.com>
Subject: [PATCH v4 7/8] ARM: dts: enable smp for rk3036
Date: Sat, 24 Oct 2015 18:49:40 +0800
Message-ID: <1445683780-21871-1-git-send-email-zhengxing@rock-chips.com>
References: <1445682629-21632-1-git-send-email-zhengxing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445682629-21632-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Xing Zheng <zhengxing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Enable smp for rk3036, and add the smp sram name for adapting.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v4: None

 arch/arm/boot/dts/rk3036.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index 8f3a069..61352be 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -72,6 +72,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "rockchip,rk3036-smp";
 
 		cpu0: cpu@f00 {
 			device_type = "cpu";
@@ -146,6 +147,10 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x10080000 0x2000>;
+		smp-sram@0 {
+			compatible = "rockchip,rk3066-smp-sram";
+			reg = <0x00 0x10>;
+		};
 	};
 
 	cru: clock-controller@20000000 {
-- 
1.7.9.5
