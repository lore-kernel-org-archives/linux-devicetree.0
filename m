Return-Path: <SRS0=CMYu=NS=qq.com=miyatsu@kernel.org>
From: Ding Tao <miyatsu@qq.com>
Subject: [PATCH] dt-bindings: input: Fix a typo in file input-reset.txt
Date: Wed,  7 Nov 2018 05:58:19 +0000
Message-Id: <20181107055819.7527-1-miyatsu@qq.com>
To: dmitry.torokhov@gmail.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ding Tao <miyatsu@qq.com>
List-ID: <devicetree@vger.kernel.org>

Replace sysrq-reset-seq with keyset.

Signed-off-by: Ding Tao <miyatsu@qq.com>
---
 Documentation/devicetree/bindings/input/input-reset.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/input-reset.txt b/Documentation/devicetree/bindings/input/input-reset.txt
index 2bb2626fdb78..1ca6cc5ebf8e 100644
--- a/Documentation/devicetree/bindings/input/input-reset.txt
+++ b/Documentation/devicetree/bindings/input/input-reset.txt
@@ -12,7 +12,7 @@ The /chosen node should contain a 'linux,sysrq-reset-seq' child node to define
 a set of keys.
 
 Required property:
-sysrq-reset-seq: array of Linux keycodes, one keycode per cell.
+keyset: array of Linux keycodes, one keycode per cell.
 
 Optional property:
 timeout-ms: duration keys must be pressed together in milliseconds before
-- 
2.17.1
