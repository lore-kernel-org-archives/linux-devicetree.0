From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 3/5] dt-bindings: gnss: add w2sg0004 compatible string
Date: Sun, 18 Nov 2018 22:57:59 +0100
Message-ID: <20181118215801.12280-4-andreas@kemnade.info>
References: <20181118215801.12280-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118215801.12280-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Add w2sg0004 compatible string since devices without wakeup
pins are now supported.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/devicetree/bindings/gnss/sirfstar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gnss/sirfstar.txt b/Documentation/devicetree/bindings/gnss/sirfstar.txt
index 648d183cdb77..1be7597ae884 100644
--- a/Documentation/devicetree/bindings/gnss/sirfstar.txt
+++ b/Documentation/devicetree/bindings/gnss/sirfstar.txt
@@ -14,6 +14,7 @@ Required properties:
 			"linx,r4"
 			"wi2wi,w2sg0008i"
 			"wi2wi,w2sg0084i"
+			"wi2wi,w2sg0004"
 
 - vcc-supply	: Main voltage regulator (pin name: 3V3_IN, VCC, VDD)
 
-- 
2.11.0
