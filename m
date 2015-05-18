From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH v2 3/5] arm64: Juno: Add memory mapped timer node
Date: Mon, 18 May 2015 18:28:27 +0100
Message-ID: <1431970109-8902-4-git-send-email-Liviu.Dudau@arm.com>
References: <1431970109-8902-1-git-send-email-Liviu.Dudau@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431970109-8902-1-git-send-email-Liviu.Dudau@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, "Jon Medhurst (Tixy)" <tixy@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, devicetree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Juno based boards have a memory mapped timer @ 0x2a810000. This
is disabled on r0 version of the board due to an SoC errata.

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 5c4c035..b7e862f 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -2,6 +2,21 @@
 	 *  Devices shared by all Juno boards
 	 */
 
+	memtimer: timer@2a810000 {
+		compatible = "arm,armv7-timer-mem";
+		reg = <0x0 0x2a810000 0x0 0x10000>;
+		clock-frequency = <50000000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+		frame@2a830000 {
+			frame-number = <1>;
+			interrupts = <0 60 4>;
+			reg = <0x0 0x2a830000 0x0 0x10000>;
+		};
+	};
+
 	gic: interrupt-controller@2c010000 {
 		compatible = "arm,gic-400", "arm,cortex-a15-gic";
 		reg = <0x0 0x2c010000 0 0x1000>,
-- 
2.4.0
