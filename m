From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 5/5] riscv: dts: add initial board data for the SiFive HiFive
 Unleashed
Date: Sun,  2 Jun 2019 01:01:26 -0700
Message-ID: <20190602080126.31075-6-paul.walmsley@sifive.com>
References: <20190602080126.31075-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190602080126.31075-1-paul.walmsley@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Add initial board data for the SiFive HiFive Unleashed A00.

Currently the data populated in this DT file describes the board
DRAM configuration and the external clock sources that supply the
PRCI.

This third version incorporates changes based on more comments from
Rob Herring <robh+dt@kernel.org>.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/sifive/Makefile           |  2 +
 .../boot/dts/sifive/hifive-unleashed-a00.dts  | 67 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sifive/Makefile
 create mode 100644 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts

diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
new file mode 100644
index 000000000000..baaeef9efdcb
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-y += hifive-unleashed-a00.dtb
diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
new file mode 100644
index 000000000000..1de4ea1577d5
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2018-2019 SiFive, Inc */
+
+/dts-v1/;
+
+#include "fu540-c000.dtsi"
+
+/* Clock frequency (in Hz) of the PCB crystal for rtcclk */
+#define RTCCLK_FREQ		1000000
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "SiFive HiFive Unleashed A00";
+	compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000";
+
+	chosen {
+	};
+
+	cpus {
+		timebase-frequency = <RTCCLK_FREQ>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x2 0x00000000>;
+	};
+
+	soc {
+	};
+
+	hfclk: hfclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <33333333>;
+		clock-output-names = "hfclk";
+	};
+
+	rtcclk: rtcclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <RTCCLK_FREQ>;
+		clock-output-names = "rtcclk";
+	};
+};
+
+&qspi0 {
+	flash@0 {
+		compatible = "issi,is25wp256", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&qspi2 {
+	status = "okay";
+	mmc@0 {
+		compatible = "mmc-spi-slot";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		voltage-ranges = <3300 3300>;
+		disable-wp;
+	};
+};
-- 
2.20.1
