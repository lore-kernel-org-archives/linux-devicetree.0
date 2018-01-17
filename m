From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 3/6] arm64: zynqmp: Add SPDX license identifier
Date: Wed, 17 Jan 2018 16:29:47 +0100
Message-ID: <3468d19d0dc3cd7cd982c393db26712c2982c076.1516202975.git.michal.simek@xilinx.com>
References: <cover.1516202975.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1516202975.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1516202975.git.michal.simek@xilinx.com>
References: <cover.1516202975.git.michal.simek@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.or, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, P L Sai Krishna <lakshmi.sai.krishna.potthuri@xilinx.com>, Javier Martinez Canillas <javier@dowhile0.org>, Kedareswara rao Appana <appanad@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Will Wong <willw@xilinx.com>, Alistair Francis <alistair.francis@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu, VNSL
List-Id: devicetree@vger.kernel.org

Add SPDX identifier as was done by for example by:
"License cleanup: add SPDX GPL-2.0 license identifier to files with no
license" (commit <b24413180f5600bcb3bb70fbed5cf186b60864bd>)

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/Makefile              | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts      | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi           | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/xilinx/Makefile
index a2d67084a514..eba179b23b17 100644
--- a/arch/arm64/boot/dts/xilinx/Makefile
+++ b/arch/arm64/boot/dts/xilinx/Makefile
@@ -1 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-ep108.dtb
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi
index b87b8316f4ac..9f5eedbc2139 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * clock specification for Xilinx ZynqMP ep108 development board
  *
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
index fe7c48b6fa78..84fe7057fcb0 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * dts file for Xilinx ZynqMP ep108 development board
  *
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 9ca4d1f83b51..a091e6f03014 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * dts file for Xilinx ZynqMP
  *
-- 
1.9.1
