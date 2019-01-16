From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 6/6] dt-bindings: gnss: add lna-supply property
Date: Wed, 16 Jan 2019 22:18:12 +0100
Message-ID: <20190116211812.6337-7-andreas@kemnade.info>
References: <20190116211812.6337-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116211812.6337-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: letux-kernel@openphoenux.org, johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Add lna-supply property.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v3:
- moved to gnss.txt

 Documentation/devicetree/bindings/gnss/gnss.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gnss/gnss.txt b/Documentation/devicetree/bindings/gnss/gnss.txt
index f1e4a2ff47c5..e31bc225957d 100644
--- a/Documentation/devicetree/bindings/gnss/gnss.txt
+++ b/Documentation/devicetree/bindings/gnss/gnss.txt
@@ -17,6 +17,7 @@ Required properties:
 		  represents
 
 Optional properties:
+- lna-supply	: Separate supply for a LNA
 - enable-gpios	: GPIO used to enable the device
 - timepulse-gpios	: Time pulse GPIO
 
-- 
2.11.0
