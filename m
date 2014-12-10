From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC 06/15] ARM: dts: imx6q: Add MIPI DSI remote end points for
 IPU2 DI0/1 end points
Date: Wed, 10 Dec 2014 16:37:19 +0800
Message-ID: <1418200648-32656-7-git-send-email-Ying.Liu@freescale.com>
References: <1418200648-32656-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1418200648-32656-1-git-send-email-Ying.Liu@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, airlied@linux.ie, linux-kernel@vger.kernel.org, thierry.reding@gmail.com, p.zabel@pengutronix.de, mturquette@linaro.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds MIPI DSI remote end points for IPU2 DI0/1 end points.

Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
---
 arch/arm/boot/dts/imx6q.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index e6a6d90..82507e7 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -185,6 +185,7 @@
 				};
 
 				ipu2_di0_mipi: endpoint@2 {
+					remote-endpoint = <&mipi_mux_2>;
 				};
 
 				ipu2_di0_lvds0: endpoint@3 {
@@ -206,6 +207,7 @@
 				};
 
 				ipu2_di1_mipi: endpoint@2 {
+					remote-endpoint = <&mipi_mux_3>;
 				};
 
 				ipu2_di1_lvds0: endpoint@3 {
-- 
2.1.0
