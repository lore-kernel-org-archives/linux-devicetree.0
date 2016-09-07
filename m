From: Vinay Simha BN <simhavcs@gmail.com>
Subject: [PATCH 1/4] dt-bindings: Add summit vendor id
Date: Wed,  7 Sep 2016 15:50:10 +0530
Message-ID: <1473243615-29746-1-git-send-email-simhavcs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Vinay Simha BN <simhavcs@gmail.com>, John Stultz <john.stultz@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Antony Pavlov <antonynpavlov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add vendor id for Summit microelectronics
for SMB347 charger.

Cc: John Stultz <john.stultz@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Myungjoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 7958a60..f165eb3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -256,6 +256,7 @@ starry	Starry Electronic Technology (ShenZhen) Co., LTD
 startek	Startek
 ste	ST-Ericsson
 stericsson	ST-Ericsson
+summit	Summit microelectronics
 sunchip	Shenzhen Sunchip Technology Co., Ltd
 SUNW	Sun Microsystems, Inc
 swir	Sierra Wireless
-- 
2.1.2
