From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 13/19] dt-bindings: Document loongson vendor-prefix
Date: Thu,  5 Sep 2019 22:43:10 +0800
Message-ID: <20190905144316.12527-14-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Loongson is a MIPS-compatible processor vendor.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6992bbbbffab..855d5b7a6660 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -529,6 +529,8 @@ patternProperties:
     description: Linear Technology Corporation
   "^logicpd,.*":
     description: Logic PD, Inc.
+  "^loongson,.*":
+    description: Loongson Technology Corporation Limited
   "^lsi,.*":
     description: LSI Corp. (LSI Logic)
   "^lwn,.*":
-- 
2.22.0
