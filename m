From: Manish Narani <manish.narani@xilinx.com>
Subject: [PATCH v4 3/3] arm64: zynqmp: DT: Add Xilinx AMS node
Date: Mon, 22 Apr 2019 20:07:50 +0530
Message-ID: <1555943870-15353-4-git-send-email-manish.narani@xilinx.com>
References: <1555943870-15353-1-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555943870-15353-1-git-send-email-manish.narani@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, manish.narani@xilinx.com, Jisheng.Zhang@synaptics.com, olof@lixom.net, dinguyen@kernel.org, amit.kucheria@linaro.org, stefan.popa@analog.com, dmurphy@ti.com, marcus.folkesson@gmail.com, tmaimon77@gmail.com, ricardo@ribalda.com, xc-racer2@live.ca, contact@artur-rojek.eu, geert@linux-m68k.org, smohanad@codeaurora.org, charles-antoine.couret@essensium.com, stefan@agner.ch, max.krummenacher@toradex.com, lee.jones@linaro.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Xilinx AMS includes an ADC as well as on-chip sensors that can be
used to sample external and monitor on-die operating conditions, such as
temperature and supply voltage levels.

Signed-off-by: Manish Narani <manish.narani@xilinx.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 9aa6734..f776913 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -625,5 +625,31 @@
 			reg = <0x0 0xfd4d0000 0x0 0x1000>;
 			timeout-sec = <10>;
 		};
+
+		xilinx_ams: ams@ffa50000 {
+			compatible = "xlnx,zynqmp-ams";
+			status = "disabled";
+			interrupt-parent = <&gic>;
+			interrupts = <0 56 4>;
+			interrupt-names = "ams-irq";
+			reg = <0x0 0xffa50000 0x0 0x800>;
+			reg-names = "ams-base";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#io-channel-cells = <1>;
+			ranges = <0 0 0xffa50800 0x800>;
+
+			ams_ps: ams-ps@0,0 {
+				compatible = "xlnx,zynqmp-ams-ps";
+				status = "disabled";
+				reg = <0 0x400>;
+			};
+
+			ams_pl: ams-pl@1,0 {
+				compatible = "xlnx,zynqmp-ams-pl";
+				status = "disabled";
+				reg = <0x400 0x400>;
+			};
+		};
 	};
 };
-- 
2.1.1
