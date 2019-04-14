From: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH] ARM: dts: bugfix tqma7 soft reset issue
Date: Sun, 14 Apr 2019 14:06:29 +0200
Message-ID: <20190414120629.8912-1-bruno.thomsen@gmail.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, laa@kamstrup.com, festevam@gmail.com, s.hauer@pengutronix.de, clemens.ml@gmx.net, Bruno Thomsen <bruno.thomsen@gmail.com>, ksc@kamstrup.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, Markus Niebel <Markus.Niebel@tq-group.com>
List-Id: devicetree@vger.kernel.org

Running reboot command on the TQMa7 board would just hang infinite
at the end of the system shutdown process.

Handling of i.MX7 errata e10574:
Watchdog: A watchdog timeout or software trigger will not reset the SOC.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
Reviewed-by: Markus Niebel <Markus.Niebel@tq-group.com>
---
 arch/arm/boot/dts/imx7-tqma7.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/imx7-tqma7.dtsi b/arch/arm/boot/dts/imx7-tqma7.dtsi
index 85fe461e5e67..896eff839d5e 100644
--- a/arch/arm/boot/dts/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/imx7-tqma7.dtsi
@@ -228,5 +228,12 @@
 };
 
 &wdog1 {
+	/*
+	 * Errata e10574:
+	 * WDOG reset needs to run with WDOG_RESET_B signal enabled.
+	 * X1-51 (WDOG1#) signal needs carrier board handling to reset
+	 * TQMa7 on X1-22 (RESET_IN#).
+	 */
+	fsl,ext-reset-output;
 	status = "okay";
 };
-- 
2.20.1
