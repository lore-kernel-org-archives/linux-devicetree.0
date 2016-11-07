From: Bai Ping <ping.bai@nxp.com>
Subject: [PATCH 3/3] ARM: dts: imx: Add ocotp node for imx6ul
Date: Mon, 7 Nov 2016 13:41:21 +0800
Message-ID: <1478497281-5477-3-git-send-email-ping.bai@nxp.com>
References: <1478497281-5477-1-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1478497281-5477-1-git-send-email-ping.bai@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: srinivas.kandagatla@linaro.org, maxime.ripard@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, devicetree@vger.kernel.org, ping.bai@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add ocotp node for i.MX6UL SOC.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
 arch/arm/boot/dts/imx6ul.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index c5c05fd..c6f6613 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -849,6 +849,12 @@
 				reg = <0x021b0000 0x4000>;
 			};
 
+			ocotp: ocotp-ctrl@021bc000 {
+				compatible = "fsl,imx6ul-ocotp", "syscon";
+				reg = <0x021bc000 0x4000>;
+				clocks = <&clks IMX6UL_CLK_OCOTP>;
+			};
+
 			lcdif: lcdif@021c8000 {
 				compatible = "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
 				reg = <0x021c8000 0x4000>;
-- 
2.8.2
