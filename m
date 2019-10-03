From: Faiz Abbas <faiz_abbas@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am654-base-board: Add disable-wp for mmc0
Date: Thu, 3 Oct 2019 17:12:51 +0530
Message-ID: <20191003114251.20533-1-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, nm@ti.com, t-kristo@ti.com, faiz_abbas@ti.com
List-Id: devicetree@vger.kernel.org

MMC0_SDWP is not connected to the card. Indicate this by adding a
disable-wp flag.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 1102b84f853d..143474119328 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -221,6 +221,7 @@
 	bus-width = <8>;
 	non-removable;
 	ti,driver-strength-ohm = <50>;
+	disable-wp;
 };
 
 &dwc3_1 {
-- 
2.19.2
