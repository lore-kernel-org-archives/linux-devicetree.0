From: thor.thayer@linux.intel.com
Subject: [PATCH 1/5] dt-bindings: mfd: Add Altera Arria10 SR Reset Controller
 bindings
Date: Wed, 15 Feb 2017 15:50:12 -0600
Message-ID: <1487195416-23827-2-git-send-email-thor.thayer@linux.intel.com>
References: <1487195416-23827-1-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487195416-23827-1-git-send-email-thor.thayer@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, linux@armlinux.org.uk, p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, thor.thayer@linux.intel.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

This patch adds documentation for the Altera A10-SR Reset
Controller DT bindings.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 Documentation/devicetree/bindings/mfd/altera-a10sr.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
index ea151f2..c8a7365 100644
--- a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
+++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
@@ -18,6 +18,7 @@ The A10SR consists of these sub-devices:
 Device                   Description
 ------                   ----------
 a10sr_gpio               GPIO Controller
+a10sr_rst                Reset Controller
 
 Arria10 GPIO
 Required Properties:
@@ -27,6 +28,11 @@ Required Properties:
                       the second cell is used to specify flags.
                       See ../gpio/gpio.txt for more information.
 
+Arria10 Peripheral PHY Reset
+Required Properties:
+- compatible        : Should be "altr,a10sr-reset"
+- #reset-cells      : Should be one.
+
 Example:
 
         resource-manager@0 {
@@ -43,4 +49,9 @@ Example:
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
+
+		a10sr_rst: reset-controller {
+			compatible = "altr,a10sr-reset";
+			#reset-cells = <1>;
+		};
 	};
-- 
1.9.1
