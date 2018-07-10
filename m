From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH 2/2] ARM: dts: imx6sx: add ocram_s support
Date: Tue, 10 Jul 2018 16:39:39 +0800
Message-ID: <1531211979-2179-2-git-send-email-Anson.Huang@nxp.com>
References: <1531211979-2179-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531211979-2179-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, shengjiu.wang@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

i.MX6SX has a 16KB always-on ocram bank called
ocram_s, enable it as another mmio sram.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 596763c..9923739 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -172,6 +172,12 @@
 			clocks = <&clks IMX6SX_CLK_OCRAM>;
 		};
 
+		ocram_s: sram@8f8000 {
+			compatible = "mmio-sram";
+			reg = <0x008f8000 0x4000>;
+			clocks = <&clks IMX6SX_CLK_OCRAM_S>;
+		};
+
 		L2: l2-cache@a02000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x00a02000 0x1000>;
-- 
2.7.4
