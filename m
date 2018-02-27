From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2] ARM: dts: imx6dl-colibri-eval-v3: Add chosen node
Date: Tue, 27 Feb 2018 09:00:23 +0100
Message-ID: <20180227080023.17682-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, devicetree@vger.kernel.org, Stefan Agner <stefan@agner.ch>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add Colibri UART_A as default serial console.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts b/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
index dcf9206f3e0d..d4f5c6862d27 100644
--- a/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
@@ -63,6 +63,10 @@
 		rtc1 = &snvs_rtc;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	clocks {
 		/* Fixed crystal dedicated to mcp251x */
 		clk16m: clk@1 {
-- 
2.16.2
