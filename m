From: <flora.fu@mediatek.com>
Subject: [PATCH 3/3] ARM: dts: mt8135: Add Reset Controller for MediaTek SoC
Date: Thu, 30 Oct 2014 11:12:13 +0800
Message-ID: <1414638733-10080-4-git-send-email-flora.fu@mediatek.com>
References: <1414638733-10080-1-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1414638733-10080-1-git-send-email-flora.fu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Flora Fu <flora.fu@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Flora Fu <flora.fu@mediatek.com>

Add reset controller to MT8135 board dts.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 arch/arm/boot/dts/mt8135.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index 90a56ad..0b1ddc9 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -102,6 +102,28 @@
 			clock-names = "system-clk", "rtc-clk";
 		};
 
+		infracfg: syscon@10001000 {
+			compatible = "mediatek,mt8135-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+		};
+
+		pericfg: syscon@10003000 {
+			compatible = "mediatek,mt8135-pericfg", "syscon";
+			reg = <0 0x10003000 0 0x1000>;
+		};
+
+		infrarst: reset-controller@10001030 {
+			#reset-cells = <1>;
+			compatible = "mediatek,mt8135-infracfg-reset", "mediatek,reset";
+			mediatek,syscon-reset = <&infracfg 0x30 0x8>;
+		};
+
+		perirst: reset-controller@10003000 {
+			#reset-cells = <1>;
+			compatible = "mediatek,mt8135-pericfg-reset", "mediatek,reset";
+			mediatek,syscon-reset = <&pericfg 0x00 0x8>;
+		};
+
 		gic: interrupt-controller@10211000 {
 			compatible = "arm,cortex-a15-gic";
 			interrupt-controller;
-- 
1.8.1.1.dirty
