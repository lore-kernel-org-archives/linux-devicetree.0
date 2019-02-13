From: Abel Vesa <abel.vesa@nxp.com>
Subject: [RFC 2/5] dt-bindings: imx8mq-clock: Add the missing ARM clock
Date: Wed, 13 Feb 2019 19:05:14 +0000
Message-ID: <1550084693-9797-3-git-send-email-abel.vesa@nxp.com>
References: <1550084693-9797-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550084693-9797-1-git-send-email-abel.vesa@nxp.com>
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
To: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, Anson Huang <anson.huang@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Add the missing ARM clock which will be used by cpufreq

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 include/dt-bindings/clock/imx8mq-clock.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings/clock/imx8mq-clock.h
index 04f7ac3..47c790c 100644
--- a/include/dt-bindings/clock/imx8mq-clock.h
+++ b/include/dt-bindings/clock/imx8mq-clock.h
@@ -391,5 +391,7 @@
 
 #define IMX8MQ_CLK_NAND_USDHC_BUS_RAWNAND_CLK	267
 
-#define IMX8MQ_CLK_END				268
+#define IMX8MQ_CLK_ARM				268
+
+#define IMX8MQ_CLK_END				269
 #endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
-- 
2.7.4
