From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH] Doc: net: dsa: b53: update location of referenced dsa.txt
Date: Thu, 15 Jun 2017 19:03:07 +0200
Message-ID: <20170615170307.15707-1-xypron.glpk@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "David S . Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>
List-Id: devicetree@vger.kernel.org

The referenced file dsa.txt is located at
Documentation/devicetree/bindings/net/dsa/dsa.txt

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 Documentation/devicetree/bindings/net/dsa/b53.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/b53.txt b/Documentation/devicetree/bindings/net/dsa/b53.txt
index d6c6e41648d4..8ec2ca21adeb 100644
--- a/Documentation/devicetree/bindings/net/dsa/b53.txt
+++ b/Documentation/devicetree/bindings/net/dsa/b53.txt
@@ -34,7 +34,7 @@ Required properties:
       "brcm,bcm6328-switch"
       "brcm,bcm6368-switch" and the mandatory "brcm,bcm63xx-switch"
 
-See Documentation/devicetree/bindings/dsa/dsa.txt for a list of additional
+See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required and optional properties.
 
 Examples:
-- 
2.11.0
