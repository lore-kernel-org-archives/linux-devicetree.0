From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 1/6] arm64: dts: rockchip: Fix rk3399-roc-pc pwm2 pin
Date: Thu, 19 Sep 2019 10:58:17 +0530
Message-ID: <20190919052822.10403-2-jagan@amarulasolutions.com>
References: <20190919052822.10403-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919052822.10403-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Levin Du <djw@t-chip.com.cn>, Akash Gajjar <akash@openedev.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

ROC-PC is not able to boot linux console if PWM2_d is
unattached to any pinctrl logic.

To be precise the linux boot hang with last logs as,
...
.....
[    0.003367] Console: colour dummy device 80x25
[    0.003788] printk: console [tty0] enabled
[    0.004178] printk: bootconsole [uart8250] disabled

In ROC-PC the PWM2_d pin is connected to LOG_DVS_PWM of
VDD_LOG. So, for normal working operations this needs to
active and pull-down.

This patch fix, by attaching pinctrl active and pull-down
the pwm2.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts
index 19f7732d728c..c53f3d571620 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts
@@ -548,6 +548,8 @@
 };
 
 &pwm2 {
+	pinctrl-names = "active";
+	pinctrl-0 = <&pwm2_pin_pull_down>;
 	status = "okay";
 };
 
-- 
2.18.0.321.gffc6fa0e3
