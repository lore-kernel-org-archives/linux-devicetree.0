From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 7/7] mfd: dt-bindings: Add RK805 device tree bindings
 document
Date: Mon, 27 Mar 2017 14:23:31 +0800
Message-ID: <1490595811-30974-1-git-send-email-zhangqing@rock-chips.com>
References: <1490595705-28844-1-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1490595705-28844-1-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org, chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device tree bindings documentation for Rockchip's RK805 PMIC.

Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/rk808.txt | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
index 9636ae8d8d41..bfd94b3d1f90 100644
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
 
+Following regulators of the RK805 PMIC regulators are supported. Note that
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
