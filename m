Return-Path: <SRS0=YcIV=II=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mleia.com ([178.79.152.223]:55732 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754141AbeEUV7x (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 May 2018 17:59:53 -0400
From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] dt-bindings: Add vendor prefix for Logic PD
Date: Tue, 22 May 2018 00:59:46 +0300
Message-Id: <20180521215946.3142-1-vz@mleia.com>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Logic PD is an electronics design, engineering and manufacturing
company, which offers system on module and baseboard products.

Website: https://www.logicpd.com/

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index d63a218..b695d62 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -201,6 +201,7 @@ linaro	Linaro Limited
 linksys	Belkin International, Inc. (Linksys)
 linux	Linux-specific binding
 lltc	Linear Technology Corporation
+logicpd	Logic PD, Inc.
 lsi	LSI Corp. (LSI Logic)
 lwn	Liebherr-Werk Nenzing GmbH
 macnica	Macnica Americas
-- 
2.10.2

