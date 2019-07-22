From: Stephan Gerhold <stephan@gerhold.net>
Subject: [RFC PATCH v2 1/4] dt-bindings: vendor-prefixes: Add Longcheer Technology Co., Ltd.
Date: Mon, 22 Jul 2019 11:22:08 +0200
Message-ID: <20190722092211.100586-2-stephan@gerhold.net>
References: <20190722092211.100586-1-stephan@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722092211.100586-1-stephan@gerhold.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
List-Id: devicetree@vger.kernel.org

Add the "longcheer" vendor prefix for Longcheer Technology Co., Ltd.,
an "industry-leading service provider of mobile phone design
and product delivery". (http://www.longcheer.com)

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6992bbbbffab..7bcf340b6f38 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -529,6 +529,8 @@ patternProperties:
     description: Linear Technology Corporation
   "^logicpd,.*":
     description: Logic PD, Inc.
+  "^longcheer,.*":
+    description: Longcheer Technology (Shanghai) Co., Ltd.
   "^lsi,.*":
     description: LSI Corp. (LSI Logic)
   "^lwn,.*":
-- 
2.22.0
