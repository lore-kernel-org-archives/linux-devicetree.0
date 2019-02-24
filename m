From: Robert Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: vendor-prefix: add prefix for Lite-On Corp.
Date: Sun, 24 Feb 2019 12:33:29 -0800
Message-ID: <f52fc8ffcacc8d80796bc98959b49fe9b0237da8.1551037168.git.bobbyeshleman@gmail.com>
References: <42dbbd7568e4216a320c6fd617bd91c1ee045af0.1551037168.git.bobbyeshleman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <42dbbd7568e4216a320c6fd617bd91c1ee045af0.1551037168.git.bobbyeshleman@gmail.com>
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
