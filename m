From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v4 3/5] dt-bindings: gnss: add w2sg0004 compatible string
Date: Thu, 24 Jan 2019 07:34:37 +0100
Message-ID: <20190124063439.29897-4-andreas@kemnade.info>
References: <20190124063439.29897-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124063439.29897-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: letux-kernel@openphoenux.org, johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Add w2sg0004 compatible string since devices without wakeup
pins are now supported.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
---
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
