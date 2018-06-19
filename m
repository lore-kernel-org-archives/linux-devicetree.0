From: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Subject: [PATCH 1/2] arm64: dts: uniphier: add headphone detect gpio for LD20 global board
Date: Tue, 19 Jun 2018 13:11:52 +0900
Message-ID: <20180619041153.6668-1-suzuki.katsuhiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, linux-kernel@vger.kernel.org, Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
List-Id: devicetree@vger.kernel.org

This patch adds GPIO for headphone detection on LD20 global board.

Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
index 6a074a20c924..38b75998e2dd 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
@@ -60,6 +60,7 @@
 			&i2s_port4
 			&spdif_port0
 			&comp_spdif_port0>;
+		hp-det-gpio = <&gpio UNIPHIER_GPIO_PORT(15, 0) GPIO_ACTIVE_LOW>;
 	};
 
 	spdif-out {
-- 
2.17.1
