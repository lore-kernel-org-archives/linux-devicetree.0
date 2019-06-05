From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/4] arm64: dts: ti: k3-am65: Add MCU SRAM ranges in
 interconnect nodes
Date: Wed, 5 Jun 2019 11:34:31 -0500
Message-ID: <20190605163434.23173-2-s-anna@ti.com>
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

Add the address space for the MCU SRAM memory to the ranges property
of the cbass_mcu interconnect node so that the addresses within the
mcu_sram nodes and its children can be translated properly by the
relevant OF address API.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65.dtsi b/arch/arm64/boot/dts/ti/k3-am65.dtsi
index 68b3f954f1d1..abb085f5e784 100644
--- a/arch/arm64/boot/dts/ti/k3-am65.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65.dtsi
@@ -72,6 +72,7 @@
 			 /* MCUSS Range */
 			 <0x00 0x28380000 0x00 0x28380000 0x00 0x03880000>,
 			 <0x00 0x40200000 0x00 0x40200000 0x00 0x00900100>,
+			 <0x00 0x41c00000 0x00 0x41c00000 0x00 0x00080000>,
 			 <0x00 0x42040000 0x00 0x42040000 0x00 0x03ac2400>,
 			 <0x00 0x45100000 0x00 0x45100000 0x00 0x00c24000>,
 			 <0x00 0x46000000 0x00 0x46000000 0x00 0x00200000>,
@@ -83,6 +84,7 @@
 			#size-cells = <2>;
 			ranges = <0x00 0x28380000 0x00 0x28380000 0x00 0x03880000>, /* MCU NAVSS*/
 				 <0x00 0x40200000 0x00 0x40200000 0x00 0x00900100>, /* First peripheral window */
+				 <0x00 0x41c00000 0x00 0x41c00000 0x00 0x00080000>, /* MCU SRAM */
 				 <0x00 0x42040000 0x00 0x42040000 0x00 0x03ac2400>, /* WKUP */
 				 <0x00 0x45100000 0x00 0x45100000 0x00 0x00c24000>, /* MMRs, remaining NAVSS */
 				 <0x00 0x46000000 0x00 0x46000000 0x00 0x00200000>, /* CPSW */
-- 
2.21.0
