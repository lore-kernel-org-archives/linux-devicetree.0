From: Nick Dyer <nick@shmanahar.org>
Subject: [PATCH v1] ARM: dts: imx51-zii-rdu1: correct touchscreen axis
 inversion
Date: Thu, 28 Jun 2018 23:56:26 +0100
Message-ID: <20180628225626.26203-1-nick@shmanahar.org>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, devicetree@vger.kernel.org, Nick Dyer <nick@shmanahar.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

The RMI4 touchscreen driver applied inversion and axis swap in the
wrong order, violating the DT binding for those properties. This was fixed in
645a397, so correct the RDU1 DT to apply the inversion to the
correct axis.

Tested on Zii RDU1 00-5105-30 rev B

Signed-off-by: Nick Dyer <nick@shmanahar.org>
---
 arch/arm/boot/dts/imx51-zii-rdu1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx51-zii-rdu1.dts b/arch/arm/boot/dts/imx51-zii-rdu1.dts
index 68f5c1d5ecd0..b1d83fb08150 100644
--- a/arch/arm/boot/dts/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/imx51-zii-rdu1.dts
@@ -553,7 +553,7 @@
 
 		rmi4-f11@11 {
 			reg = <0x11>;
-			touchscreen-inverted-y;
+			touchscreen-inverted-x;
 			touchscreen-swapped-x-y;
 			syna,sensor-type = <1>;
 		};
-- 
2.17.1
