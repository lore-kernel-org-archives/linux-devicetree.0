From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2] bindings: add clocks optional binding for imx gpio
Date: Tue,  3 Jul 2018 09:18:14 +0800
Message-ID: <1530580694-8649-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, fabio.estevam@nxp.com, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Some i.MX SoCs have GPIO clock gate in CCM, accessing
GPIO registers needs to enable GPIO clock gate first,
i.MX GPIO driver will enable clock gate if there is
clock property in GPIO node of dtb, add optional property
to i.MX GPIO binding doc.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
index dbd22e0..b4cd9f90 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
@@ -19,6 +19,9 @@ Required properties:
       4 = active high level-sensitive.
       8 = active low level-sensitive.
 
+Optional properties:
+- clocks: the clock for clocking the GPIO silicon
+
 Example:
 
 gpio0: gpio@73f84000 {
-- 
2.7.4
