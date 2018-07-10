From: Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v4 5/6] ARM: dts: imx53: Add a label for the PMU node
Date: Tue, 10 Jul 2018 13:31:47 -0300
Message-ID: <1531240308-24798-5-git-send-email-fabio.estevam@nxp.com>
References: <1531240308-24798-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531240308-24798-1-git-send-email-fabio.estevam@nxp.com>
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

Add a label for the PMU node so that the board dts may be able to
pass the 'secure-reg-access' property like this:

&pmu {
	secure-reg-access;
};

This also makes it consistent with the PMU node in imx6qdl.dtsi

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
Changes since v3:
- None

 arch/arm/boot/dts/imx53.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 3fd553c..6386185 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -113,7 +113,7 @@
 		};
 	};
 
-	pmu {
+	pmu: pmu {
 		compatible = "arm,cortex-a8-pmu";
 		interrupt-parent = <&tzic>;
 		interrupts = <77>;
-- 
2.7.4
