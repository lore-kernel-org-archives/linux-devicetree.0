From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 2/2] ARM: dts: imx6q-icore-mipi: Use 1.5 version of i.Core
 MX6
Date: Tue, 14 Aug 2018 15:21:46 +0200
Message-ID: <1534252906-29554-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1534252906-29554-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1534252906-29554-1-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, jagan@amarulasolutions.com
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

The "EDIMM STARTER KIT i.Core 1.5 MIPI Evaluation" is based on the 1.5 version
of the i.Core MX6 cpu module. The 1.5 version differs from the original one for
a few details, including the ethernet PHY interface clock provider.

With this commit, the ethernet interface works properly:
SMSC LAN8710/LAN8720 2188000.ethernet-1:00: attached PHY driver

While before using the 1.5 version, ethernet failed to startup do to un-clocked
PHY interface:
fec 2188000.ethernet eth0: could not attach to PHY

Fixes: 3fe088357731 ("ARM: dts: imx6q: Add Engicam i.CoreM6 1.5 Quad/Dual MIPI starter kit support")
Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 arch/arm/boot/dts/imx6q-icore-mipi.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-icore-mipi.dts b/arch/arm/boot/dts/imx6q-icore-mipi.dts
index 95b2efd..1f15882 100644
--- a/arch/arm/boot/dts/imx6q-icore-mipi.dts
+++ b/arch/arm/boot/dts/imx6q-icore-mipi.dts
@@ -8,10 +8,10 @@
 /dts-v1/;
 
 #include "imx6q.dtsi"
-#include "imx6qdl-icore.dtsi"
+#include "imx6qdl-icore-1.5.dtsi"
 
 / {
-	model = "Engicam i.CoreM6 Quad/Dual MIPI Starter Kit";
+	model = "Engicam i.CoreM6 1.5 Quad/Dual MIPI Starter Kit";
 	compatible = "engicam,imx6-icore", "fsl,imx6q";
 };
 
-- 
2.7.4
