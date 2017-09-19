From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 1/3] dt-bindings: Add vendor prefix for ProBox2
Date: Tue, 19 Sep 2017 23:54:54 +0200
Message-ID: <20170919215454.5820-1-afaerber@suse.de>
References: <7c7224a9-b0a6-caa4-483a-d9613af48d13@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7c7224a9-b0a6-caa4-483a-d9613af48d13@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, support@probox2.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

PROBOX2 is a TV box brand by Hong Kong based online reseller W2COMP
Company Limited.

Cc: support@probox2.com
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v1 -> v2:
 * Extend the vendor prefix explanation with info provided by PROBOX2
 * Fix the commit message accordingly
 
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 9d1a48ba2445..6c6002cf6be6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -264,6 +264,7 @@ plathome	Plat'Home Co., Ltd.
 plda	PLDA
 poslab	Poslab Technology Co., Ltd.
 powervr	PowerVR (deprecated, use img)
+probox2	PROBOX2 (by W2COMP Co., Ltd.)
 pulsedlight	PulsedLight, Inc
 qca	Qualcomm Atheros, Inc.
 qcom	Qualcomm Technologies, Inc
-- 
2.13.5
