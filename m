From: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
Subject: [PATCH 1/2] net: phy: dp83867: Add documentation for SGMII mode type
Date: Thu,  5 Sep 2019 19:26:00 +0300
Message-ID: <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
References: <1567700761-14195-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567700761-14195-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, f.fainelli@gmail.com
Cc: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>, Mark Rutland <mark.rutland@arm.com>, Trent Piepho <tpiepho@impinj.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add documentation of ti,sgmii-type which can be used to select
SGMII mode type (4 or 6-wire).

Signed-off-by: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
---
 Documentation/devicetree/bindings/net/ti,dp83867.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.txt b/Documentation/devicetree/bindings/net/ti,dp83867.txt
index db6aa3f2215b..18e7fd52897f 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.txt
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.txt
@@ -37,6 +37,7 @@ Optional property:
 			      for applicable values.  The CLK_OUT pin can also
 			      be disabled by this property.  When omitted, the
 			      PHY's default will be left as is.
+	- ti,sgmii-type - This denotes the fact which SGMII mode is used (4 or 6-wire).
 
 Note: ti,min-output-impedance and ti,max-output-impedance are mutually
       exclusive. When both properties are present ti,max-output-impedance
-- 
2.16.4
