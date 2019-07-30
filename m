From: Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v2] ARM: dts: vf610-bk4: Fix qspi node description
Date: Tue, 30 Jul 2019 23:48:33 +0200
Message-ID: <20190730214833.30659-1-lukma@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
List-Id: devicetree@vger.kernel.org

Before this change the device tree description of qspi node for
second memory on BK4 board was wrong (applicable to old, removed
fsl-quadspi.c driver).

As a result this memory was not recognized correctly when used
with the new spi-fsl-qspi.c driver.

>From the dt-bindings:

"Required SPI slave node properties:
  - reg: There are two buses (A and B) with two chip selects each.
This encodes to which bus and CS the flash is connected:
<0>: Bus A, CS 0
<1>: Bus A, CS 1
<2>: Bus B, CS 0
<3>: Bus B, CS 1"

According to above with new driver the second SPI-NOR memory shall
have reg=<2> as it is connected to Bus B, CS 0.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Suggested-by: Fabio Estevam <festevam@gmail.com>
Fixes: a67d2c52a82f ("ARM: dts: Add support for Liebherr's BK4 device
(vf610 based)")

---
Changes for v2:
- Add proper Suggested-by tag as Fabio was the one who pointed out the
  the issue with wrong reg number assignment for the second SPI-NOR memory
- Add Fixes: tag, so the patch could be added to LTS kernels
- Fix the subject line to more appropriate
---
 arch/arm/boot/dts/vf610-bk4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/vf610-bk4.dts b/arch/arm/boot/dts/vf610-bk4.dts
index 3fa0cbe456db..0f3870d3b099 100644
--- a/arch/arm/boot/dts/vf610-bk4.dts
+++ b/arch/arm/boot/dts/vf610-bk4.dts
@@ -246,13 +246,13 @@
 		reg = <0>;
 	};
 
-	n25q128a13_2: flash@1 {
+	n25q128a13_2: flash@2 {
 		compatible = "n25q128a13", "jedec,spi-nor";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		spi-max-frequency = <66000000>;
 		spi-rx-bus-width = <2>;
-		reg = <1>;
+		reg = <2>;
 	};
 };
 
-- 
2.11.0
