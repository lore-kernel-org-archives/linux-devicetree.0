Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from forward101o.mail.yandex.net ([37.140.190.181]:58528 "EHLO
        forward101o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726812AbfDKM13 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 11 Apr 2019 08:27:29 -0400
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 4/6] dt-bindings: Add vendor prefix for loongson
Date: Thu, 11 Apr 2019 20:19:13 +0800
Message-Id: <20190411121915.8040-5-jiaxun.yang@flygoat.com>
In-Reply-To: <20190411121915.8040-1-jiaxun.yang@flygoat.com>
References: <20190312091520.8863-2-jiaxun.yang@flygoat.com>
 <20190411121915.8040-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org, paul.burton@mips.com, robh+dt@kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-ID: <devicetree@vger.kernel.org>

Add vendor prefix for loongson, known as
Loongson Technology Corporation Limited, a CPUs & IP Cores vendor.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389508584f48..6464192f47ae 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -221,6 +221,7 @@ linux	Linux-specific binding
 linx	Linx Technologies
 lltc	Linear Technology Corporation
 logicpd	Logic PD, Inc.
+loongson Loongson Technology Corporation Limited
 lsi	LSI Corp. (LSI Logic)
 lwn	Liebherr-Werk Nenzing GmbH
 macnica	Macnica Americas
-- 
2.21.0
