From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH RFC 5/5] dt-bindings: gnss: add lna-supply property
Date: Sun, 18 Nov 2018 22:58:01 +0100
Message-ID: <20181118215801.12280-6-andreas@kemnade.info>
References: <20181118215801.12280-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118215801.12280-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Add lna-supply property.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/devicetree/bindings/gnss/sirfstar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gnss/sirfstar.txt b/Documentation/devicetree/bindings/gnss/sirfstar.txt
index 1be7597ae884..9614774d14bc 100644
--- a/Documentation/devicetree/bindings/gnss/sirfstar.txt
+++ b/Documentation/devicetree/bindings/gnss/sirfstar.txt
@@ -30,6 +30,7 @@ Optional properties:
 - sirf,wakeup-gpios	: GPIO used to determine device power state
 			  (pin name: RFPWRUP, WAKEUP)
 - timepulse-gpios	: Time pulse GPIO (pin name: 1PPS, TM)
+- lna-supply		: Separate supply for a LNA
 
 Example:
 
-- 
2.11.0
