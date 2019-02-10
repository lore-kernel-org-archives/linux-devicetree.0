From: Robert Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH 2/3] dt-bindings: vendor-prefix: add prefix for Lite-On Corp.
Date: Sun, 10 Feb 2019 12:38:13 -0800
Message-ID: <3a4b0255b14d5107a906a39834953f5fa5f33afc.1549828313.git.bobbyeshleman@gmail.com>
References: <89716a4433cd83aea5f4200359b184b0ee2cc8bd.1549828313.git.bobbyeshleman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <89716a4433cd83aea5f4200359b184b0ee2cc8bd.1549828313.git.bobbyeshleman@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bobbyeshleman@gmail.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds a vendor-prefix for the Lite-On Semiconductor
Corporation.

Signed-off-by: Robert Eshleman <bobbyeshleman@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389508584f48..e487a5d95ba9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -219,6 +219,7 @@ linaro	Linaro Limited
 linksys	Belkin International, Inc. (Linksys)
 linux	Linux-specific binding
 linx	Linx Technologies
+liteon  Lite-On Semiconductor Corporation
 lltc	Linear Technology Corporation
 logicpd	Logic PD, Inc.
 lsi	LSI Corp. (LSI Logic)
-- 
2.20.1
