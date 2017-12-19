From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v3 5/9] ARM: dts: imx7-colibri: specify cpu-supply
Date: Tue, 19 Dec 2017 19:10:34 +0100
Message-ID: <20171219181038.1369-5-stefan@agner.ch>
References: <20171219181038.1369-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171219181038.1369-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Specify CPU supply using the "cpu-supply" property instead of
the invalid "arm-supply" property.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 arch/arm/boot/dts/imx7-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
index f61041af026a..6498c1136ef1 100644
--- a/arch/arm/boot/dts/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri.dtsi
@@ -86,7 +86,7 @@
 };
 
 &cpu0 {
-	arm-supply = <&reg_DCDC2>;
+	cpu-supply = <&reg_DCDC2>;
 };
 
 &fec1 {
-- 
2.15.1
