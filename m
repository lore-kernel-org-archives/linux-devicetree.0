From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH] ARM: dts: spear: fix stmpe811 interrupt properties
Date: Fri, 20 Jul 2018 09:53:56 +0200
Message-ID: <20180720075356.26156-1-marcel@ziswiler.com>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Viresh Kumar <vireshk@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

The property "irq-over-gpio" simply does not exist (this is nowadays
actually auto detected) and the property "irq-gpios" is actually called
"irq-gpios".

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/spear320-hmi.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/spear320-hmi.dts b/arch/arm/boot/dts/spear320-hmi.dts
index 0d0da1f65f0e..d2d1fe944407 100644
--- a/arch/arm/boot/dts/spear320-hmi.dts
+++ b/arch/arm/boot/dts/spear320-hmi.dts
@@ -241,8 +241,7 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <0x41>;
-					irq-over-gpio;
-					irq-gpios = <&gpiopinctrl 29 0x4>;
+					irq-gpio = <&gpiopinctrl 29 0x4>;
 					id = <0>;
 					blocks = <0x5>;
 					irq-trigger = <0x1>;
-- 
2.14.4
