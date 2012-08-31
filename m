From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 3/9] ARM i.MX6: Add OCRAM to device tree
Date: Fri, 31 Aug 2012 11:26:58 +0200
Message-ID: <1346405224-20399-4-git-send-email-p.zabel@pengutronix.de>
References: <1346405224-20399-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1346405224-20399-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Shawn Guo <shawn.guo@linaro.org>, Richard Zhao <richard.zhao@freescale.com>, Huang Shijie <shijie8@gmail.com>, Dong Aisheng <dong.aisheng@linaro.org>, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v1:
 - Renamed "iram" to "ocram" as it appears in the processor
   reference manuals.
---
 arch/arm/boot/dts/imx6q.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index fd57079..9cb0b50 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -111,6 +111,11 @@
 		       status = "disabled";
 		};
 
+		ocram@00900000 {
+			compatible = "fsl,imx-ocram";
+			reg = <0x00900000 0x3f000>;
+		};
+
 		timer@00a00600 {
 			compatible = "arm,cortex-a9-twd-timer";
 			reg = <0x00a00600 0x20>;
-- 
1.7.10.4
