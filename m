From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/4] arm64: dts: ti: k3-am65-mcu: Add the MCU RAM node
Date: Wed, 5 Jun 2019 11:34:32 -0500
Message-ID: <20190605163434.23173-3-s-anna@ti.com>
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
The K3 AM65x SoCs have 512 KB of such memory. Any specific memory range
within this RAM needed by a software module ought to be reserved using
an appropriate child node.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
index 6f7d2b316ded..afc29eaa2638 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
@@ -17,6 +17,14 @@
 			power-domains = <&k3_pds 149>;
 	};
 
+	mcu_ram: sram@41c00000 {
+		compatible = "mmio-sram";
+		reg = <0x00 0x41c00000 0x00 0x80000>;
+		ranges = <0x0 0x00 0x41c00000 0x80000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	mcu_i2c0: i2c@40b00000 {
 		compatible = "ti,am654-i2c", "ti,omap4-i2c";
 		reg = <0x0 0x40b00000 0x0 0x100>;
-- 
2.21.0
