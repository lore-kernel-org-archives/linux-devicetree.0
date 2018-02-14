From: Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH v3 2/2] net: phy: dp83867: Add documentation for CLK_OUT pin muxing
Date: Wed, 14 Feb 2018 17:07:12 +0100
Message-ID: <1518624432-15110-2-git-send-email-d.schultz@phytec.de>
References: <1518624432-15110-1-git-send-email-d.schultz@phytec.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518624432-15110-1-git-send-email-d.schultz@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: w.egorov@phytec.de
List-Id: devicetree@vger.kernel.org

From: Wadim Egorov <w.egorov@phytec.de>

Add documentation of ti,clk-output-sel which can be used to select
a specific clock for CLK_OUT.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
Changes:
	v2:
	  -
	v3:
	  Fixed indentation.

 Documentation/devicetree/bindings/net/ti,dp83867.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.txt b/Documentation/devicetree/bindings/net/ti,dp83867.txt
index 02c4353..9ef9338 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.txt
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.txt
@@ -25,6 +25,8 @@ Optional property:
 				    software needs to take when this pin is
 				    strapped in these modes. See data manual
 				    for details.
+	- ti,clk-output-sel - Muxing option for CLK_OUT pin - see dt-bindings/net/ti-dp83867.h
+				    for applicable values.
 
 Note: ti,min-output-impedance and ti,max-output-impedance are mutually
       exclusive. When both properties are present ti,max-output-impedance
-- 
2.7.4
