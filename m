From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 2/5] arm64: zynqmp: Use C pre-processor for includes
Date: Thu,  3 Aug 2017 13:36:48 +0200
Message-ID: <0226364dd21172af666230f66390c23254df5b48.1501760202.git.michal.simek@xilinx.com>
References: <cover.1501760202.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1501760202.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1501760202.git.michal.simek@xilinx.com>
References: <cover.1501760202.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Alistair Francis <alistair.francis@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, monstr@monstr.eu, devicetree@vger.kernel.org, Kedareswara rao Appana <appanad@xilinx.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

From: Alistair Francis <alistair.francis@xilinx.com>

Change the dtsi include code to use the C pre-processor #include instead
of the device tree /include/. This enables option to use dt binding
headers.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Sören Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
index ee7fa27e1e23..fba8f049769b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -13,8 +13,8 @@
 
 /dts-v1/;
 
-/include/ "zynqmp.dtsi"
-/include/ "zynqmp-ep108-clk.dtsi"
+#include "zynqmp.dtsi"
+#include "zynqmp-ep108-clk.dtsi"
 
 / {
 	model = "ZynqMP EP108";
-- 
1.9.1
