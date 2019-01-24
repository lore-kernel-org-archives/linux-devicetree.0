From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH V3 3/5] dt-bindings: clock: update CPU clock ID name
Date: Thu, 24 Jan 2019 13:22:40 +0000
Message-ID: <1548335800-6438-4-git-send-email-aisheng.dong@nxp.com>
References: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Update the CPU clocks to CPU cluster clock.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v1->v2:
 * change name to cpu cluster clock according to Rob's suggestion
v2->v3:
 * keep IMX_CLK_A35 to not break building as clk driver already uses it
---
 include/dt-bindings/clock/imx8-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/clock/imx8-clock.h
index 4236818..b149e63 100644
--- a/include/dt-bindings/clock/imx8-clock.h
+++ b/include/dt-bindings/clock/imx8-clock.h
@@ -13,6 +13,7 @@
 
 /* CPU */
 #define IMX_A35_CLK					1
+#define IMX_CPU_CLUSTER_A35_CLK				1
 
 /* LSIO SS */
 #define IMX_LSIO_MEM_CLK				2
-- 
2.7.4
