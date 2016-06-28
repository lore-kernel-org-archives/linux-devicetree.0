From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v1 4/5] ARM: dts: rockchip: add the panel power supply for rk3288-evb board with act8846 pmu
Date: Tue, 28 Jun 2016 12:51:21 +0800
Message-ID: <1467089481-18713-1-git-send-email-ykk@rock-chips.com>
References: <1467089288-18355-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467089288-18355-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc: Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Yakir Yang <ykk@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Panel regulator is controller by a normal GPIO, so we need to
write a regulator-fixed node for it.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
 arch/arm/boot/dts/rk3288-evb-act8846.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-evb-act8846.dts b/arch/arm/boot/dts/rk3288-evb-act8846.dts
index 452ca24..041dd5d 100644
--- a/arch/arm/boot/dts/rk3288-evb-act8846.dts
+++ b/arch/arm/boot/dts/rk3288-evb-act8846.dts
@@ -206,6 +206,10 @@
 	};
 };
 
+&panel {
+	power-supply = <&vcc_lcd>;
+};
+
 &pinctrl {
 	lcd {
 		lcd_en: lcd-en  {
-- 
1.9.1
