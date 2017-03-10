From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v2 5/5] mfd: dt-bindings: Add RK805 device tree bindings document
Date: Fri, 10 Mar 2017 10:02:56 +0800
Message-ID: <1489111376-22282-1-git-send-email-zhangqing@rock-chips.com>
References: <1489111252-22175-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489111252-22175-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc: huangtao@rock-chips.com, xxx@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, chenjh@rock-chips.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, w.egorov@phytec.de, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add device tree bindings documentation for Rockchip's RK805 PMIC.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 Documentation/devicetree/bindings/mfd/rk808.txt | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
index 9636ae8d8d41..05eb07134483 100644
--- a/Documentation/devicetree/bindings/mfd/rk808.txt
+++ b/Documentation/devicetree/bindings/mfd/rk808.txt
@@ -1,11 +1,12 @@
 RK8XX Power Management Integrated Circuit
 
 The rk8xx family current members:
+rk805
 rk808
 rk818
 
 Required properties:
-- compatible: "rockchip,rk808", "rockchip,rk818"
+- compatible: "rockchip,rk805", "rockchip,rk808", "rockchip,rk818"
 - reg: I2C slave address
 - interrupt-parent: The parent interrupt controller.
 - interrupts: the interrupt outputs of the controller.
@@ -18,6 +19,14 @@ Optional properties:
 - rockchip,system-power-controller: Telling whether or not this pmic is controlling
   the system power.
 
+Optional RK805 properties:
+- vcc1-supply:  The input supply for DCDC_REG1
+- vcc2-supply:  The input supply for DCDC_REG2
+- vcc3-supply:  The input supply for DCDC_REG3
+- vcc4-supply:  The input supply for DCDC_REG4
+- vcc5-supply:  The input supply for LDO_REG1 and LDO_REG2
+- vcc6-supply:  The input supply for LDO_REG3
+
 Optional RK808 properties:
 - vcc1-supply:  The input supply for DCDC_REG1
 - vcc2-supply:  The input supply for DCDC_REG2
@@ -56,6 +65,15 @@ by a child node of the 'regulators' node.
 		/* standard regulator bindings here */
 	};
 
+Following regulators of the RK805 PMIC block are supported. Note that
+the 'n' in regulator name, as in DCDC_REGn or LDOn, represents the DCDC or LDO
+number as described in RK805 datasheet.
+
+	- DCDC_REGn
+		- valid values for n are 1 to 4.
+	- LDO_REGn
+		- valid values for n are 1 to 3
+
 Following regulators of the RK808 PMIC block are supported. Note that
 the 'n' in regulator name, as in DCDC_REGn or LDOn, represents the DCDC or LDO
 number as described in RK808 datasheet.
-- 
1.9.1
