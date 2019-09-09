From: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
Subject: [PATCH v4 1/2] net: phy: dp83867: Add documentation for SGMII mode type
Date: Mon,  9 Sep 2019 20:19:25 +0300
Message-ID: <1568049566-16708-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
References: <1568047940-14490-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <1568049566-16708-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1568049566-16708-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, f.fainelli@gmail.com
Cc: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Trent Piepho <tpiepho@impinj.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add documentation of ti,sgmii-ref-clock-output-enable
which can be used to select SGMII mode type (4 or 6-wire).

Signed-off-by: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
---
Changes in v4:
- Fixed the wording of property

 Documentation/devicetree/bindings/net/ti,dp83867.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.txt b/Documentation/devicetree/bindings/net/ti,dp83867.txt
index db6aa3f..388ff48 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.txt
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.txt
@@ -37,6 +37,10 @@ Optional property:
 			      for applicable values.  The CLK_OUT pin can also
 			      be disabled by this property.  When omitted, the
 			      PHY's default will be left as is.
+	- ti,sgmii-ref-clock-output-enable - This denotes which
+				    SGMII configuration is used (4 or 6-wire modes).
+				    Some MACs work with differential SGMII clock.
+				    See data manual for details.

 Note: ti,min-output-impedance and ti,max-output-impedance are mutually
       exclusive. When both properties are present ti,max-output-impedance
