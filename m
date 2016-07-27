From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v4 1/6] ARM: dts: r8a7794: add audio clocks
Date: Wed, 27 Jul 2016 23:59:18 +0300
Message-ID: <4789280.VAzvua9Bym@wasted.cogentembedded.com>
References: <3910788.ckTpUWEs6B@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <3910788.ckTpUWEs6B@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe  the external audio clocks (signals AUDIO_CLK[ABC]) required by
the sound driver.  Boards that provide audio clocks need to  override the
clock frequencies.

This patch is based on the commit 0d3dbde84a45 ("ARM: shmobile: r8a7791:
add  audio clock on DTSI").

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 4:
- refreshed the patch.

Changes in version 3:
- removed now redundant "clock-output-names" properties;
- reformatted the changelog;
- refreshed the patch.

 arch/arm/boot/dts/r8a7794.dtsi |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
+++ renesas/arch/arm/boot/dts/r8a7794.dtsi
@@ -952,6 +952,27 @@
 			clock-frequency = <0>;
 		};
 
+		/*
+		 * The external audio clocks are configured  as 0 Hz fixed
+		 * frequency clocks by default.  Boards that provide audio
+		 * clocks should override them.
+		 */
+		audio_clka: audio_clka {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+		audio_clkb: audio_clkb {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+		audio_clkc: audio_clkc {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+
 		/* Special CPG clocks */
 		cpg_clocks: cpg_clocks@e6150000 {
 			compatible = "renesas,r8a7794-cpg-clocks",
