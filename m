From: <atull@opensource.altera.com>
Subject: [PATCH v4 2/6] arm: dts: socfpga: add altera fpga manager
Date: Tue, 9 Dec 2014 14:14:46 -0600
Message-ID: <1418156090-23578-3-git-send-email-atull@opensource.altera.com>
References: <1418156090-23578-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418156090-23578-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add Altera FGPA manager to device tree.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 4472fd9..bab98b6 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -751,5 +751,15 @@
 			compatible = "altr,sys-mgr", "syscon";
 			reg = <0xffd08000 0x4000>;
 		};
+
+		hps_0_fpgamgr: fpgamgr@0xff706000 {
+			compatible = "altr,fpga-mgr", "simple-bus";
+			reg = <0xFF706000 0x1000
+			       0xFFB90000 0x1000>;
+			interrupts = <0 175 4>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+		};
 	};
 };
-- 
1.7.9.5
