From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 6/8] ARM i.MX53: mba53: use reset gpio for FEC
Date: Tue,  4 Jun 2013 13:07:13 +0200
Message-ID: <1370344035-7417-7-git-send-email-s.trumtrar@pengutronix.de>
References: <1370344035-7417-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1370344035-7417-1-git-send-email-s.trumtrar@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>
Cc: Markus Niebel <Markus.Niebel@tqs.de>, devicetree-discuss@lists.ozlabs.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Markus Niebel <Markus.Niebel@tqs.de>

Signed-off-by: Markus Niebel <Markus.Niebel@tqs.de>
Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm/boot/dts/imx53-mba53.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx53-mba53.dts b/arch/arm/boot/dts/imx53-mba53.dts
index 67f5655..4515d01 100644
--- a/arch/arm/boot/dts/imx53-mba53.dts
+++ b/arch/arm/boot/dts/imx53-mba53.dts
@@ -174,6 +174,7 @@
 };
 
 &fec {
+	phy-reset-gpios = <&gpio7 6 0>;
 	status = "okay";
 };
 
-- 
1.8.2.rc2
