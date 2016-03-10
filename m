From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 04/18] ARM: dts: vf610: add on-chip SRAM
Date: Wed,  9 Mar 2016 18:16:45 -0800
Message-ID: <1457576219-7971-5-git-send-email-stefan@agner.ch>
References: <1457576219-7971-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1457576219-7971-1-git-send-email-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, robh+dt@kernel.org, sergeimir@emcraft.com, kernel@pengutronix.de, galak@codeaurora.org, tglx@linutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add Vybrids massive on-chip SRAM areas. Make use of the memory
region functionality to denominate the retained SRAM area in
LPSTOP2 and LPSTOP3.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vfxxx.dtsi | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 909988d..b038ea4 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -91,6 +91,43 @@
 		interrupt-parent = <&gpc>;
 		ranges;
 
+		ocram0: sram@3f000000 {
+			compatible = "mmio-sram";
+			reg = <0x3f000000 0x40000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x3f000000 0x40000>;
+
+			stbyram1@0 {
+				reg = <0x0 0x4000>;
+				label = "stbyram1";
+				pool;
+			};
+
+			stbyram2@4000 {
+				reg = <0x4000 0xc000>;
+				label = "stbyram2";
+				pool;
+			};
+		};
+
+		ocram1: sram@3f040000 {
+			compatible = "mmio-sram";
+			reg = <0x3f040000 0x40000>;
+		};
+
+		gfxram0: sram@3f400000 {
+			compatible = "mmio-sram";
+			reg = <0x3f400000 0x80000>;
+		};
+
+		/* used by L2 cache */
+		gfxram1: sram@3f480000 {
+			compatible = "mmio-sram";
+			reg = <0x3f480000 0x80000>;
+		};
+
 		aips0: aips-bus@40000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
-- 
2.7.2
