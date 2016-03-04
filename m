From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] regulator: max8973: add DT binding details for junction warn temp
Date: Fri, 4 Mar 2016 15:57:53 +0530
Message-ID: <1457087274-15785-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

The driver MAX8973 supports the driver for Maxim MAX77621.
MAX77621 supports the junction temp warning at 120 degC and
140 degC which is configurable. It generates alert signal when
junction temperature crosses these threshold.

Add DT properties and its binding details to make this
configuration from DT.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 Documentation/devicetree/bindings/regulator/max8973-regulator.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
index f80ea2f..c2c68fc 100644
--- a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
@@ -32,6 +32,13 @@ Optional properties:
 
 Enhanced transient response (ETR) will affect the configuration of CKADV.
 
+-junction-warn-millicelsius: u32, junction warning temperature threshold
+		in millicelsius. If die temperature crosses this level then
+		device generates the warning interrupts.
+
+Please note that thermal functionality is only supported on MAX77621. The
+supported threshold warning temperature for MAX77621 are 120 degC and 140 degC.
+
 Example:
 
 	max8973@1b {
-- 
2.1.4
