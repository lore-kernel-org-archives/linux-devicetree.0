From: Nick Dyer <nick@shmanahar.org>
Subject: [PATCH v1] ARM: dts: imx51-zii-rdu1: fix touchscreen pinctrl
Date: Tue, 19 Jun 2018 23:07:19 +0100
Message-ID: <20180619220719.3200-1-nick@shmanahar.org>
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
To: Shawn Guo <shawnguo@kernel.org>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, devicetree@vger.kernel.org, Nick Dyer <nick@shmanahar.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

The pinctrl settings were incorrect for the touchscreen interrupt line, causing
an interrupt storm. This change has been tested with both the atmel_mxt_ts and
RMI4 drivers on the RDU1 units.

Signed-off-by: Nick Dyer <nick@shmanahar.org>
---
 arch/arm/boot/dts/imx51-zii-rdu1.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx51-zii-rdu1.dts b/arch/arm/boot/dts/imx51-zii-rdu1.dts
index df9eca94d812..4d12ba54ba15 100644
--- a/arch/arm/boot/dts/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/imx51-zii-rdu1.dts
@@ -770,8 +770,8 @@
 
 	pinctrl_ts: tsgrp {
 		fsl,pins = <
-			MX51_PAD_CSI1_D8__GPIO3_12		0x85
-			MX51_PAD_CSI1_D9__GPIO3_13		0x85
+			MX51_PAD_CSI1_D8__GPIO3_12		4
+			MX51_PAD_CSI1_D9__GPIO3_13		(1<<16)
 		>;
 	};
 
-- 
2.17.1
