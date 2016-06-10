From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] dt-bindings: Add vendor prefix for Starry
Date: Fri, 10 Jun 2016 11:01:57 -0700
Message-ID: <1465581717-18497-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: emil.l.velikov@gmail.com, Douglas Anderson <dianders@chromium.org>, treding@nvidia.com, ralf@linux-mips.org, jic23@kernel.org, shawnguo@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

>From their website:
    http://www.b001.com.cn/

Starry appears to be a company involved in LCD panels and related
components.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index d2bce2239769..437d663fbc1c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -248,6 +248,7 @@ sony	Sony Corporation
 spansion	Spansion Inc.
 sprd	Spreadtrum Communications Inc.
 st	STMicroelectronics
+starry	Starry Electronic Technology (ShenZhen) Co., LTD
 startek	Startek
 ste	ST-Ericsson
 stericsson	ST-Ericsson
-- 
2.8.0.rc3.226.g39d4020
