From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 2/2] ARC: [axs10x] Specify reserved memory for frame buffer
Date: Wed, 27 Apr 2016 17:35:01 +0300
Message-ID: <1461767701-12208-3-git-send-email-abrodkin@synopsys.com>
References: <1461767701-12208-1-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461767701-12208-1-git-send-email-abrodkin@synopsys.com>
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
Cc: devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org
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
Cc: devicetree@vger.kernel.org
---
 arch/arc/boot/dts/axc001.dtsi     | 20 +++++++++++++++++++-
 arch/arc/boot/dts/axc003.dtsi     | 14 ++++++++++++++
 arch/arc/boot/dts/axc003_idu.dtsi | 14 ++++++++++++++
 arch/arc/boot/dts/axs10x_mb.dtsi  |  2 +-
 4 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
index 420dcfd..ae6162d 100644
--- a/arch/arc/boot/dts/axc001.dtsi
+++ b/arch/arc/boot/dts/axc001.dtsi
@@ -95,6 +95,24 @@
 		#size-cells = <1>;
 		ranges = <0x00000000 0x80000000 0x40000000>;
 		device_type = "memory";
-		reg = <0x80000000 0x20000000>;	/* 512MiB */
+		reg = <0x80000000 0x1f000000>;	/* 512 - 16 MiB */
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
+		frame_buffer: frame_buffer@9f000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x9f000000 0x1000000>;
+			no-map;
+		};
 	};
 };
diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index f90fadf..c7a95c2 100644
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
+		frame_buffer: frame_buffer@a0000000 {
+			compatible = "shared-dma-pool";
+			reg = <0xa0000000 0x1000000>;
+			no-map;
+		};
+	};
 };
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 06a9f29..929ec8c 100644
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
+		frame_buffer: frame_buffer@a0000000 {
+			compatible = "shared-dma-pool";
+			reg = <0xa0000000 0x1000000>;
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
