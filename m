From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 01/52] arm64: dts: rockchip: fix rk3328-roc-cc gmac2io tx/rx_delay
Date: Wed, 24 Apr 2019 09:57:06 -0400
Message-ID: <20190424135758.22850-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: "Leonidas P. Papadakos" <papadakospan@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "Leonidas P. Papadakos" <papadakospan@gmail.com>

[ Upstream commit 924726888f660b2a86382a5dd051ec9ca1b18190 ]

The rk3328-roc-cc board exhibits tx stability issues with large packets,
as does the rock64 board, which was fixed with this patch
https://patchwork.kernel.org/patch/10178969/

A similar patch was merged for the rk3328-roc-cc here
https://patchwork.kernel.org/patch/10804863/
but it doesn't include the tx/rx_delay tweaks, and I find that they
help with an issue where large transfers would bring the ethernet
link down, causing a link reset regularly.

Signed-off-by: Leonidas P. Papadakos <papadakospan@gmail.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
index 246c317f6a68..91061d9cf78b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
@@ -94,8 +94,8 @@
 	snps,reset-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
 	snps,reset-active-low;
 	snps,reset-delays-us = <0 10000 50000>;
-	tx_delay = <0x25>;
-	rx_delay = <0x11>;
+	tx_delay = <0x24>;
+	rx_delay = <0x18>;
 	status = "okay";
 };
 
-- 
2.19.1
