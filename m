From: Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2 2/6] ARM: dts: imx51: Add PMU support
Date: Tue, 10 Jul 2018 10:47:32 -0300
Message-ID: <1531230456-27717-2-git-send-email-fabio.estevam@nxp.com>
References: <1531230456-27717-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531230456-27717-1-git-send-email-fabio.estevam@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, robh+dt@kernel.org, kernel@pengutronix.de, sebastian.reichel@collabora.co.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add PMU support in the device tree.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Newly introduced in this series.

 arch/arm/boot/dts/imx51.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx51.dtsi b/arch/arm/boot/dts/imx51.dtsi
index 66e4187..113ddbc 100644
--- a/arch/arm/boot/dts/imx51.dtsi
+++ b/arch/arm/boot/dts/imx51.dtsi
@@ -93,6 +93,12 @@
 		};
 	};
 
+	pmu: pmu {
+		compatible = "arm,cortex-a8-pmu";
+		interrupt-parent = <&tzic>;
+		interrupts = <77>;
+	};
+
 	usbphy0: usbphy0 {
 		compatible = "usb-nop-xceiv";
 		clocks = <&clks IMX5_CLK_USB_PHY_GATE>;
-- 
2.7.4
