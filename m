From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] arm64: dts: r8a7796: update register size for thermal
Date: Fri,  5 Jan 2018 16:54:47 +0100
Message-ID: <20180105155447.10071-3-niklas.soderlund+renesas@ragnatech.se>
References: <20180105155447.10071-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180105155447.10071-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

To be able to read fused calibration values from hardware the size of
the register resource of TSC1 needs to be incremented to cover one more
register which holds the information if the calibration values have been
fused or not.

Instead of increasing TSC1 size to the value from the datasheet update
all TSC's size to the smallest granularity of the address decoder
circuitry.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index ef10fb548681d36a..f8e9313f9405b938 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1625,9 +1625,9 @@
 
 		tsc: thermal@e6198000 {
 			compatible = "renesas,r8a7796-thermal";
-			reg = <0 0xe6198000 0 0x68>,
-			      <0 0xe61a0000 0 0x5c>,
-			      <0 0xe61a8000 0 0x5c>;
+			reg = <0 0xe6198000 0 0x100>,
+			      <0 0xe61a0000 0 0x100>,
+			      <0 0xe61a8000 0 0x100>;
 			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.15.1
