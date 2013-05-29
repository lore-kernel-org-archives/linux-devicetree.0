From: Linus Walleij <linus.walleij@stericsson.com>
Subject: [PATCH] ARM: ux500: cut chip-select GPIOs from SSP device
Date: Wed, 29 May 2013 19:32:22 +0200
Message-ID: <1369848742-10451-1-git-send-email-linus.walleij@stericsson.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Gabriel Fernandez <gabriel.fernandez.st@gmail.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

What GPIO pin is used with which device on the SSP/SPI bus
is as board-specific as it gets, so it does not belong here
in the core SoC file, and it is disabled so it doesn't hurt
to delete this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/dbx5x0.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/dbx5x0.dtsi b/arch/arm/boot/dts/dbx5x0.dtsi
index b4b542b..12f36d4 100644
--- a/arch/arm/boot/dts/dbx5x0.dtsi
+++ b/arch/arm/boot/dts/dbx5x0.dtsi
@@ -589,11 +589,6 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-
-			// Add one of these for each child device
-			cs-gpios = <&gpio0 31 0x4 &gpio4 14 0x4 &gpio4 16 0x4
-				    &gpio6 22 0x4 &gpio7 0 0x4>;
-
 		};
 
 		uart@80120000 {
-- 
1.7.11.3
