From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH] Documentation/devicetree: document cavium-pip rx-delay/tx-delay properties
Date: Sun,  5 Jun 2016 01:24:02 +0300
Message-ID: <1465079042-22499-1-git-send-email-aaro.koskinen@iki.fi>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, David Daney <ddaney.cavm@gmail.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: devicetree@vger.kernel.org

Document cavium-pip rx-delay/tx-delay properties. Currently the board
specific values need to be hardcoded in the platform code, which we
want to avoid when moving to DT-only booting.

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 Documentation/devicetree/bindings/net/cavium-pip.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cavium-pip.txt b/Documentation/devicetree/bindings/net/cavium-pip.txt
index 7dbd158..edbf411 100644
--- a/Documentation/devicetree/bindings/net/cavium-pip.txt
+++ b/Documentation/devicetree/bindings/net/cavium-pip.txt
@@ -37,6 +37,10 @@ Properties for PIP port which is a child the PIP interface:
 
 - phy-handle: Optional, see ethernet.txt file in the same directory.
 
+- rx-delay: Delay value for RGMII receive clock. Optional. Disabled if 0.
+
+- tx-delay: Delay value for RGMII transmit clock. Optional. Disabled if 0.
+
 Example:
 
 	pip@11800a0000000 {
-- 
2.7.2
