From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 3/5] dt-bindings: gnss: add w2sg0004 compatible string
Date: Sun,  9 Dec 2018 20:51:48 +0100
Message-ID: <20181209195150.5192-4-andreas@kemnade.info>
References: <20181209195150.5192-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209195150.5192-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Add w2sg0004 compatible string since devices without wakeup
pins are now supported.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
 - reordering of entries
With the original order there was a
Reviewed-by: Rob Herring <robh@kernel.org>

 Documentation/devicetree/bindings/gnss/sirfstar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gnss/sirfstar.txt b/Documentation/devicetree/bindings/gnss/sirfstar.txt
index 648d183cdb77..f4252b6b660b 100644
--- a/Documentation/devicetree/bindings/gnss/sirfstar.txt
+++ b/Documentation/devicetree/bindings/gnss/sirfstar.txt
@@ -12,6 +12,7 @@ Required properties:
 
 			"fastrax,uc430"
 			"linx,r4"
+			"wi2wi,w2sg0004"
 			"wi2wi,w2sg0008i"
 			"wi2wi,w2sg0084i"
 
-- 
2.11.0
