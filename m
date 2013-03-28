From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 09/11] ARM i.MX53: Add IOMUXC GPR to device tree
Date: Thu, 28 Mar 2013 16:23:33 +0100
Message-ID: <1364484215-13935-10-git-send-email-p.zabel@pengutronix.de>
References: <1364484215-13935-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1364484215-13935-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: linux-arm-kernel@lists.infradead.org
Cc: devel@driverdev.osuosl.org, Fabio Estevam <fabio.estevam@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, kernel@pengutronix.de, Martin Fuzzey <mfuzzey@parkeon.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sean Cross <xobs@kosagi.com>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 arch/arm/boot/dts/imx53.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 7a6f5a8..b07bbdcc 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -506,6 +506,11 @@
 
 			};
 
+			gpr: iomuxc-gpr@53fa8000 {
+				compatible = "fsl,imx53-iomuxc-gpr", "syscon";
+				reg = <0x53fa8000 0xc>;
+			};
+
 			pwm1: pwm@53fb4000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx53-pwm", "fsl,imx27-pwm";
-- 
1.8.2.rc2
