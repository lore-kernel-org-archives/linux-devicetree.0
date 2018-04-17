From: Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH] ARM: dts: da850: fix W=1 warnings with pinmux node
Date: Tue, 17 Apr 2018 18:06:00 +0530
Message-ID: <20180417123600.23548-1-nsekhar@ti.com>
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
To: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>
List-Id: devicetree@vger.kernel.org

Remove unused #address-cells and #size-cells from pinmux
node. This fixes W=1 warnings of the type:

arch/arm/boot/dts/da850-lcdk.dtb: Warning (avoid_unnecessary_addr_size): /soc@1c00000/pinmux@14120: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Tested on DA850 LCDK by checking output of:

/sys/kernel/debug/pinctrl/1c14120.pinmux-pinctrl-single/pins

before and after the change.

Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 arch/arm/boot/dts/da850.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index cba3afd00763..f6f1597b03df 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -55,8 +55,6 @@
 		pmx_core: pinmux@14120 {
 			compatible = "pinctrl-single";
 			reg = <0x14120 0x50>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			#pinctrl-cells = <2>;
 			pinctrl-single,bit-per-mux;
 			pinctrl-single,register-width = <32>;
-- 
2.16.2
