From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] of: Add Inforce Computing to vendor prefix list
Date: Tue, 12 Apr 2016 10:29:57 +0100
Message-ID: <1460453397-5597-2-git-send-email-srinivas.kandagatla@linaro.org>
References: <1460453397-5597-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460453397-5597-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds Inforce Computing to vendor prefix list.
This vendor makes boards like IFC6410, IFC6540 based on Qualcomm SOCs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index f382061..7df3544 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -119,6 +119,7 @@ idt	Integrated Device Technologies, Inc.
 ifi	Ingenieurburo Fur Ic-Technologie (I/F/I)
 iom	Iomega Corporation
 img	Imagination Technologies Ltd.
+inforce	Inforce Computing
 ingenic	Ingenic Semiconductor
 innolux	Innolux Corporation
 intel	Intel Corporation
-- 
2.5.0
