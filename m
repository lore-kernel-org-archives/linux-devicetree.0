From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: [PATCH v1] dt-bindings: fec: explicitly mark deprecated properties
Date: Thu, 18 Jul 2019 16:14:53 -0400
Message-ID: <20190718201453.13062-1-TheSven73@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Fugang Duan <fugang.duan@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

fec's gpio phy reset properties have been deprecated.
Update the dt-bindings documentation to explicitly mark
them as such, and provide a short description of the
recommended alternative.

Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 .../devicetree/bindings/net/fsl-fec.txt       | 30 +++++++++++--------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/fsl-fec.txt b/Documentation/devicetree/bindings/net/fsl-fec.txt
index 2d41fb96ce0a..5b88fae0307d 100644
--- a/Documentation/devicetree/bindings/net/fsl-fec.txt
+++ b/Documentation/devicetree/bindings/net/fsl-fec.txt
@@ -7,18 +7,6 @@ Required properties:
 - phy-mode : See ethernet.txt file in the same directory
 
 Optional properties:
-- phy-reset-gpios : Should specify the gpio for phy reset
-- phy-reset-duration : Reset duration in milliseconds.  Should present
-  only if property "phy-reset-gpios" is available.  Missing the property
-  will have the duration be 1 millisecond.  Numbers greater than 1000 are
-  invalid and 1 millisecond will be used instead.
-- phy-reset-active-high : If present then the reset sequence using the GPIO
-  specified in the "phy-reset-gpios" property is reversed (H=reset state,
-  L=operation state).
-- phy-reset-post-delay : Post reset delay in milliseconds. If present then
-  a delay of phy-reset-post-delay milliseconds will be observed after the
-  phy-reset-gpios has been toggled. Can be omitted thus no delay is
-  observed. Delay is in range of 1ms to 1000ms. Other delays are invalid.
 - phy-supply : regulator that powers the Ethernet PHY.
 - phy-handle : phandle to the PHY device connected to this device.
 - fixed-link : Assume a fixed link. See fixed-link.txt in the same directory.
@@ -47,11 +35,27 @@ Optional properties:
   For imx6sx, "int0" handles all 3 queues and ENET_MII. "pps" is for the pulse
   per second interrupt associated with 1588 precision time protocol(PTP).
 
-
 Optional subnodes:
 - mdio : specifies the mdio bus in the FEC, used as a container for phy nodes
   according to phy.txt in the same directory
 
+Deprecated optional properties:
+	To avoid these, create a phy node according to phy.txt in the same
+	directory, and point the fec's "phy-handle" property to it. Then use
+	the phy's reset binding, again described by phy.txt.
+- phy-reset-gpios : Should specify the gpio for phy reset
+- phy-reset-duration : Reset duration in milliseconds.  Should present
+  only if property "phy-reset-gpios" is available.  Missing the property
+  will have the duration be 1 millisecond.  Numbers greater than 1000 are
+  invalid and 1 millisecond will be used instead.
+- phy-reset-active-high : If present then the reset sequence using the GPIO
+  specified in the "phy-reset-gpios" property is reversed (H=reset state,
+  L=operation state).
+- phy-reset-post-delay : Post reset delay in milliseconds. If present then
+  a delay of phy-reset-post-delay milliseconds will be observed after the
+  phy-reset-gpios has been toggled. Can be omitted thus no delay is
+  observed. Delay is in range of 1ms to 1000ms. Other delays are invalid.
+
 Example:
 
 ethernet@83fec000 {
-- 
2.17.1
