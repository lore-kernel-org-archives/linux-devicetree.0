From: Green Wan <green.wan@sifive.com>
Subject: [RFC v2 2/4] riscv: dts: add support for PDMA device of HiFive Unleashed Rev A00
Date: Mon, 14 Oct 2019 15:54:25 +0800
Message-ID: <20191014075502.15105-3-green.wan@sifive.com>
References: <20191014075502.15105-1-green.wan@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014075502.15105-1-green.wan@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-hackers@sifive.com, Green Wan <green.wan@sifive.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Dan Williams <dan.j.williams@intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>, Yash Shah <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.k
List-Id: devicetree@vger.kernel.org

Add PDMA support to (arch/riscv/boot/dts/sifive/fu540-c000.dtsi)

Signed-off-by: Green Wan <green.wan@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index afa43c7ea369..70a1891e7cd0 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -162,6 +162,13 @@
 			clocks = <&prci PRCI_CLK_TLCLK>;
 			status = "disabled";
 		};
+		dma: dma@3000000 {
+			compatible = "sifive,fu540-c000-pdma";
+			reg = <0x0 0x3000000 0x0 0x8000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <23 24 25 26 27 28 29 30>;
+			#dma-cells = <1>;
+		};
 		uart1: serial@10011000 {
 			compatible = "sifive,fu540-c000-uart", "sifive,uart0";
 			reg = <0x0 0x10011000 0x0 0x1000>;
-- 
2.17.1
