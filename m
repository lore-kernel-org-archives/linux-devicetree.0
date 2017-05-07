From: Randy Li <ayaka@soulik.info>
Subject: [PATCH] ARM: dts: rockchip: add missing grf phandle for rk3288
Date: Sun,  7 May 2017 22:34:46 +0800
Message-ID: <20170507143446.11502-1-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, heiko@sntech.de, Randy Li <ayaka@soulik.info>, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The PWM devices need to access the grf to switch the PWM IP.
And tsadc uses it to shutdown the system.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 arch/arm/boot/dts/rk3288.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 26b8886..c1d3b1f 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -546,6 +546,7 @@
 		pinctrl-2 = <&otp_gpio>;
 		#thermal-sensor-cells = <1>;
 		rockchip,hw-tshut-temp = <95000>;
+		rockchip,grf = <&grf>;
 		status = "disabled";
 	};
 
@@ -654,6 +655,7 @@
 		pinctrl-0 = <&pwm0_pin>;
 		clocks = <&cru PCLK_PWM>;
 		clock-names = "pwm";
+		rockchip,grf = <&grf>;
 		status = "disabled";
 	};
 
@@ -665,6 +667,7 @@
 		pinctrl-0 = <&pwm1_pin>;
 		clocks = <&cru PCLK_PWM>;
 		clock-names = "pwm";
+		rockchip,grf = <&grf>;
 		status = "disabled";
 	};
 
@@ -676,6 +679,7 @@
 		pinctrl-0 = <&pwm2_pin>;
 		clocks = <&cru PCLK_PWM>;
 		clock-names = "pwm";
+		rockchip,grf = <&grf>;
 		status = "disabled";
 	};
 
@@ -687,6 +691,7 @@
 		pinctrl-0 = <&pwm3_pin>;
 		clocks = <&cru PCLK_PWM>;
 		clock-names = "pwm";
+		rockchip,grf = <&grf>;
 		status = "disabled";
 	};
 
-- 
2.9.3
