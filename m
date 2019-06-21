From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
Date: Fri, 21 Jun 2019 15:06:29 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906211504170.16518@viisi.sifive.com>
References: <1561114429-29612-1-git-send-email-yash.shah@sifive.com> <1561114429-29612-2-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561114429-29612-2-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On Fri, 21 Jun 2019, Yash Shah wrote:

> DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Thanks, dropped the "reg-names" property from the patch, and queued the 
following updated version for v5.2-rc.


- Paul

From: Yash Shah <yash.shah@sifive.com>
Date: Fri, 21 Jun 2019 16:23:49 +0530
Subject: [PATCH] riscv: dts: Add DT node for SiFive FU540 Ethernet controller
 driver

DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added

Signed-off-by: Yash Shah <yash.shah@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Atish Patra <atish.patra@wdc.com>
[paul.walmsley@sifive.com: dropped the "reg-names" property, as it
 is not documented in the binding nor used in the driver]
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi       | 16 ++++++++++++++++
 .../boot/dts/sifive/hifive-unleashed-a00.dts     |  9 +++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 3c06ee4b2b29..83f40b00ab63 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -211,5 +211,21 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+		eth0: ethernet@10090000 {
+			compatible = "sifive,fu540-macb";
+			interrupt-parent = <&plic0>;
+			interrupts = <53>;
+			reg = <0x0 0x10090000 0x0 0x2000
+			       0x0 0x100a0000 0x0 0x1000>;
+			reg-names = "control";
+			status = "disabled";
+			local-mac-address = [00 00 00 00 00 00];
+			clock-names = "pclk", "hclk";
+			clocks = <&prci PRCI_CLK_GEMGXLPLL>,
+				 <&prci PRCI_CLK_GEMGXLPLL>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 	};
 };
diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 4da88707e28f..d783bf2c3507 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -63,3 +63,12 @@
 		disable-wp;
 	};
 };
+
+&eth0 {
+	status = "okay";
+	phy-mode = "gmii";
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
-- 
2.20.1
