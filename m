From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 2/2 v2] ARC: [axs10x] Specify reserved memory for frame buffer
Date: Thu, 28 Apr 2016 17:19:56 +0300
Message-ID: <1461853196-15599-3-git-send-email-abrodkin@synopsys.com>
References: <1461853196-15599-1-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461853196-15599-1-git-send-email-abrodkin@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Allocation of a frame buffer memory in a special memory region
allows bypassing of so-called IO Coherency aperture
which is typically set as a range 0x8z-0xAz.

I.e. all data traffic to PGU bypasses IO Coherency block
and saves its bandwidth for other peripherals.

Even though for AXS101 (which sorts ARC770 CPU) IOC is not
an option for a sake of keeping one DT description for the
base-board (axs10x_mb.dtsi) we're still defining reserved
memory location in the very end of DDR.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: devicetree@vger.kernel.org
---

Changes v1 -> v2:
 * Reserved memory size bumped from 16Mb to 32Mb.
   Given the corner case 1920x1080x24bpp and tripl-buffering
   we'll need ~18Mb in the future so let's reserve 32Mb today
   and don't think about that any more.

 * Reserved area in AXS103 boards moved to the very end of the first Gb.
   Even though we use only 512Mb for kernel on AXS103 board
   we have 1Gb of DDR really. So let's move reserved area in the very
   end of available mamory. This way we'll be able to keep this mapping
   when we'll want to use > 512Mb in the kernel.

 * And while at it correct "ranges" value for AXS101 board: we do have
   only 512 Mb of DDR on the board so let's not temp users to try to use more.

 arch/arc/boot/dts/axc001.dtsi     | 22 ++++++++++++++++++++--
 arch/arc/boot/dts/axc003.dtsi     | 14 ++++++++++++++
 arch/arc/boot/dts/axc003_idu.dtsi | 14 ++++++++++++++
 arch/arc/boot/dts/axs10x_mb.dtsi  |  2 +-
 4 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
index 420dcfd..262496a 100644
--- a/arch/arc/boot/dts/axc001.dtsi
+++ b/arch/arc/boot/dts/axc001.dtsi
@@ -93,8 +93,26 @@
 	memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x00000000 0x80000000 0x40000000>;
+		ranges = <0x00000000 0x80000000 0x20000000>;
 		device_type = "memory";
-		reg = <0x80000000 0x20000000>;	/* 512MiB */
+		reg = <0x80000000 0x1b000000>;	/* (512 - 32) MiB */
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		/*
+		 * We just move frame buffer area to the very end of
+		 * available DDR. And even though in case of ARC770 there's
+		 * no strict requirement for a frame-buffer to be in any
+		 * particular location it allows us to use the same
+		 * base board's DT node for ARC PGU as for ARc HS38.
+		 */
+		frame_buffer: frame_buffer@9e000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x9e000000 0x2000000>;
+			no-map;
+		};
 	};
 };
diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index f90fadf..35ece04 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -100,4 +100,18 @@
 		device_type = "memory";
 		reg = <0x80000000 0x20000000>;	/* 512MiB */
 	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		/*
+		 * Move frame buffer out of IOC aperture (0x8z-0xAz).
+		 */
+		frame_buffer: frame_buffer@be000000 {
+			compatible = "shared-dma-pool";
+			reg = <0xbe000000 0x2000000>;
+			no-map;
+		};
+	};
 };
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 06a9f29..df9ddb6 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -123,4 +123,18 @@
 		device_type = "memory";
 		reg = <0x80000000 0x20000000>;	/* 512MiB */
 	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		/*
+		 * Move frame buffer out of IOC aperture (0x8z-0xAz).
+		 */
+		frame_buffer: frame_buffer@be000000 {
+			compatible = "shared-dma-pool";
+			reg = <0xbe000000 0x2000000>;
+			no-map;
+		};
+	};
 };
diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 823f15c..64b063d 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -283,7 +283,7 @@
 			encoder-slave = <&adv7511>;
 			clocks = <&pguclk>;
 			clock-names = "pxlclk";
-
+			memory-region = <&frame_buffer>;
 			port {
 				pgu_output: endpoint {
 					remote-endpoint = <&adv7511_input>;
-- 
2.5.5
