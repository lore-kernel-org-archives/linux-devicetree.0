From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 3/3] ARM: dts: imx6qdl-colibri: use pull-down on wake-up pin
Date: Tue, 26 Jun 2018 16:52:43 +0200
Message-ID: <20180626145243.24880-3-stefan@agner.ch>
References: <20180626145243.24880-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180626145243.24880-1-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, max.krummenacher@toradex.com, marcel.ziswiler@toradex.com, Stefan Agner <stefan@agner.ch>, maitysanchayan@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The wake-up pin is pulled low with 100kOhm on the carrier board.
The current configuration of 100kOhm pull-up caused lots of
interrupts, especially during boot up. Make sure the pin is at a
reasonable level at startup by pulling it low on SoC side too.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx6qdl-colibri.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
index 55c90c2fbf69..6e937ca20869 100644
--- a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
@@ -480,8 +480,7 @@
 
 	pinctrl_gpio_keys: gpiokeys {
 		fsl,pins = <
-			/* Power button */
-			MX6QDL_PAD_EIM_A16__GPIO2_IO22		0x1b0b0
+			MX6QDL_PAD_EIM_A16__GPIO2_IO22		0x130b0
 		>;
 	};
 
-- 
2.18.0
