From: mdf@kernel.org
Subject: [PATCH v2] ARM64: zynqmp: Fix i2c node's compatible string
Date: Thu, 22 Dec 2016 09:19:25 -0800
Message-ID: <1482427165-8951-1-git-send-email-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Moritz Fischer <mdf@kernel.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Moritz Fischer <mdf@kernel.org>

The Zynq Ultrascale MP uses version 1.4 of the Cadence IP core
which fixes some silicon bugs that needed software workarounds
in Version 1.0 that was used on Zynq systems.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Sören Brinkmann <soren.brinkmann@xilinx.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
Changes from v1:

- Added fall through case to cdns,i2c-r1p10

Cheers,

Moritz

---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 68a90833..ee86d02 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -175,7 +175,7 @@
 		};
 
 		i2c0: i2c@ff020000 {
-			compatible = "cdns,i2c-r1p10";
+			compatible = "cdns,i2c-r1p14", "cdns,i2c-r1p10";
 			status = "disabled";
 			interrupt-parent = <&gic>;
 			interrupts = <0 17 4>;
@@ -185,7 +185,7 @@
 		};
 
 		i2c1: i2c@ff030000 {
-			compatible = "cdns,i2c-r1p10";
+			compatible = "cdns,i2c-r1p14", "cdns,i2c-r1p10";
 			status = "disabled";
 			interrupt-parent = <&gic>;
 			interrupts = <0 18 4>;
-- 
2.7.4
