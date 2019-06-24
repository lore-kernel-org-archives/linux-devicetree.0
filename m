From: Atish Patra <atish.patra@wdc.com>
Subject: [PATCH] riscv: Add cpu topology DT entry.
Date: Mon, 24 Jun 2019 15:38:19 -0700
Message-ID: <20190624223819.14320-1-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>, Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Currently, there is no CPU topology defined for RISC-V.
The following series adds topology support in RISC-V.

http://lists.infradead.org/pipermail/linux-riscv/2019-June/005072.html

Add a DT node for unleashed that describes the CPU topology
present in HiFive Unleashed.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 83f40b00ab63..907564f4f07a 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -22,6 +22,24 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		timebase-frequency = <1000000>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu1>;
+				};
+				core1 {
+					cpu = <&cpu2>;
+				};
+				core2 {
+					cpu = <&cpu3>;
+				};
+				core3 {
+					cpu = <&cpu4>;
+				};
+			};
+		};
+
 		cpu0: cpu@0 {
 			compatible = "sifive,e51", "sifive,rocket0", "riscv";
 			device_type = "cpu";
-- 
2.21.0
