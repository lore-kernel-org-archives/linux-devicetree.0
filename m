From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 1/5] ARM: dts: meson: minix-neo-x8: define PMIC as power controller
Date: Tue,  7 Jun 2016 18:04:25 -0700
Message-ID: <20160608010429.19618-2-stefan@agner.ch>
References: <20160608010429.19618-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160608010429.19618-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, carlo@caione.org
Cc: b.galvani@gmail.com, max.oss.09@gmail.com, marcel@ziswiler.com, linux@armlinux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

The PMIC driver used to register itself as poweroff controller by
default, hence assuming that this device is using the PMIC as
system power controller.

Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/meson8-minix-neo-x8.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/meson8-minix-neo-x8.dts b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
index 4f536bb..8bceb8d 100644
--- a/arch/arm/boot/dts/meson8-minix-neo-x8.dts
+++ b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
@@ -80,6 +80,7 @@
 	pmic@32 {
 		compatible = "ricoh,rn5t618";
 		reg = <0x32>;
+		system-power-controller;
 
 		regulators {
 		};
-- 
2.8.3
