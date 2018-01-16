From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 1/3] ARM: dts: at91: nattis: use up-to-date mtd partitions
Date: Tue, 16 Jan 2018 17:08:33 +0100
Message-ID: <20180116160835.27943-2-peda@axentia.se>
References: <20180116160835.27943-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180116160835.27943-1-peda@axentia.se>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The nattis currently relies on the cmdline to correctly configure the
MTD partition table, and the one given in the device tree is simply
ignored. Which is fortunate, since the device tree partition table is
bonkers and does not match reality.

So, in order to avoid confusion, fix the device tree partition table
to match what is expected (i.e. what is normally provided on the cmdline).
In particular, the rootfs partition should be mtd6.

Fixes: 0e4323899973 ("ARM: dts: at91: add devicetree for the Axentia Nattis with Natte power")
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
index 3ea1d26e1c68..4882bd6d38c1 100644
--- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
+++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
@@ -216,24 +216,29 @@
 			reg = <0x0 0x40000>;
 		};
 
-		bootloader@40000 {
-			label = "bootloader";
-			reg = <0x40000 0x80000>;
+		barebox@40000 {
+			label = "barebox";
+			reg = <0x40000 0x60000>;
 		};
 
-		bootloaderenv@c0000 {
-			label = "bootloader env";
-			reg = <0xc0000 0xc0000>;
+		bareboxenv@c0000 {
+			label = "bareboxenv";
+			reg = <0xc0000 0x40000>;
 		};
 
-		dtb@180000 {
-			label = "device tree";
-			reg = <0x180000 0x80000>;
+		bareboxenv2@100000 {
+			label = "bareboxenv2";
+			reg = <0x100000 0x40000>;
+		};
+
+		oftree@180000 {
+			label = "oftree";
+			reg = <0x180000 0x20000>;
 		};
 
 		kernel@200000 {
 			label = "kernel";
-			reg = <0x200000 0x600000>;
+			reg = <0x200000 0x500000>;
 		};
 
 		rootfs@800000 {
-- 
2.11.0
