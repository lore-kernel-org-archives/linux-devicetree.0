From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: [PATCH 1/3] dt-bindings: net: dsa: Add compatibility strings for Broadcom Omega
Date: Tue,  7 Aug 2018 10:02:42 -0700
Message-ID: <1533661364-15381-2-git-send-email-arun.parameswaran@broadcom.com>
References: <1533661364-15381-1-git-send-email-arun.parameswaran@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533661364-15381-1-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Arun Parameswaran <arun.parameswaran@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add compatibility strings for the internal switch in the Broadcom
Omega SoC family (BCM5831X/BCM1140X) to B53.

Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>
---
 Documentation/devicetree/bindings/net/dsa/b53.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/b53.txt b/Documentation/devicetree/bindings/net/dsa/b53.txt
index 47a6a7f..1811e19 100644
--- a/Documentation/devicetree/bindings/net/dsa/b53.txt
+++ b/Documentation/devicetree/bindings/net/dsa/b53.txt
@@ -24,6 +24,14 @@ Required properties:
       "brcm,bcm53018-srab"
       "brcm,bcm53019-srab" and the mandatory "brcm,bcm5301x-srab" string
 
+  For the BCM5831X/BCM1140x SoCs with an integrated switch, must be one of:
+      "brcm,bcm11404-srab"
+      "brcm,bcm11407-srab"
+      "brcm,bcm11409-srab"
+      "brcm,bcm58310-srab"
+      "brcm,bcm58311-srab"
+      "brcm,bcm58313-srab" and the mandatory "brcm,omega-srab" string
+
   For the BCM585xx/586XX/88312 SoCs with an integrated switch, must be one of:
       "brcm,bcm58522-srab"
       "brcm,bcm58523-srab"
-- 
1.9.1
