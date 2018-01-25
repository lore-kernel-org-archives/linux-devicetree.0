From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 1/2] dt-bindings: nvmem: imx-ocotp: update the binding to reflect data cells
Date: Thu, 25 Jan 2018 15:37:28 +0800
Message-ID: <1516865849-26191-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

imx-ocotp is implemented based on nvmem which can have data cells
as child node. Update the binding doc to reflect it to be more easily
understood by users.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 .../devicetree/bindings/nvmem/imx-ocotp.txt        | 23 ++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
index f162c72..729f674 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
@@ -11,17 +11,32 @@ Required properties:
 	"fsl,imx6ul-ocotp" (i.MX6UL),
 	"fsl,imx7d-ocotp" (i.MX7D/S),
 	followed by "syscon".
+- #address-cells : Should be 1
+- #size-cells : Should be 1
 - reg: Should contain the register base and length.
 - clocks: Should contain a phandle pointing to the gated peripheral clock.
 
 Optional properties:
 - read-only: disable write access
 
-Example:
+Optional Child nodes:
+
+- Data cells of ocotp:
+  Detailed bindings are described in bindings/nvmem/nvmem.txt
 
+Example:
 	ocotp: ocotp@21bc000 {
-		compatible = "fsl,imx6q-ocotp", "syscon";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "fsl,imx6sx-ocotp", "syscon";
 		reg = <0x021bc000 0x4000>;
-		clocks = <&clks IMX6QDL_CLK_IIM>;
-		read-only;
+		clocks = <&clks IMX6SX_CLK_OCOTP>;
+
+		tempmon_calib: calib@38 {
+			reg = <0x38 4>;
+		};
+
+		tempmon_temp_grade: temp-grade@20 {
+			reg = <0x20 4>;
+		};
 	};
-- 
2.7.4
