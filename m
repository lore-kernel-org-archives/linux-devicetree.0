From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 5/5] dt-bindings: gnss: add lna-supply property
Date: Sun,  9 Dec 2018 20:51:50 +0100
Message-ID: <20181209195150.5192-6-andreas@kemnade.info>
References: <20181209195150.5192-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209195150.5192-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Add lna-supply property.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
 - reordering
Original order had a
Reviewed-by: Rob Herring <robh@kernel.org>

 Documentation/devicetree/bindings/gnss/sirfstar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gnss/sirfstar.txt b/Documentation/devicetree/bindings/gnss/sirfstar.txt
index f4252b6b660b..8d24f37ea1ba 100644
--- a/Documentation/devicetree/bindings/gnss/sirfstar.txt
+++ b/Documentation/devicetree/bindings/gnss/sirfstar.txt
@@ -26,6 +26,7 @@ Required properties (SPI):
 
 Optional properties:
 
+- lna-supply		: Separate supply for a LNA
 - sirf,onoff-gpios	: GPIO used to power on and off device (pin name: ON_OFF)
 - sirf,wakeup-gpios	: GPIO used to determine device power state
 			  (pin name: RFPWRUP, WAKEUP)
-- 
2.11.0
