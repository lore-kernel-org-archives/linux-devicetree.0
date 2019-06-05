From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 3/4] arm64: dts: ti: k3-j721e: Add the MCU SRAM node
Date: Wed, 5 Jun 2019 11:34:33 -0500
Message-ID: <20190605163434.23173-4-s-anna@ti.com>
References: <20190605163434.23173-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190605163434.23173-1-s-anna@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the on-chip SRAM present within the MCU domain as a mmio-sram node.
The K3 J721E SoCs have 1 MB of such memory. Any specific memory range
within this RAM needed by a driver/software module ought to be reserved
using an appropriate child node.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
index b72e033fa159..397ef715e145 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
@@ -44,6 +44,14 @@
 		pinctrl-single,function-mask = <0xffffffff>;
 	};
 
+	mcu_ram: sram@41c00000 {
+		compatible = "mmio-sram";
+		reg = <0x00 0x41c00000 0x00 0x100000>;
+		ranges = <0x0 0x00 0x41c00000 0x100000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	wkup_uart0: serial@42300000 {
 		compatible = "ti,j721e-uart", "ti,am654-uart";
 		reg = <0x00 0x42300000 0x00 0x100>;
-- 
2.21.0
