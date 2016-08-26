From: Vinay Simha BN <simhavcs@gmail.com>
Subject: [PATCH 1/3] dt-bindings: Add Japan Display Inc vendor id
Date: Fri, 26 Aug 2016 08:07:05 +0530
Message-ID: <1472179029-9803-1-git-send-email-simhavcs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Vinay Simha BN <simhavcs@gmail.com>, Archit Taneja <archit.taneja@gmail.com>, John Stultz <john.stultz@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>, Matt Ranostay <mranostay@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add vendor id for Japan Display Inc.

Cc: Archit Taneja <archit.taneja@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 0d9d4d8..48b8128 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -139,6 +139,7 @@ invensense	InvenSense Inc.
 isee	ISEE 2007 S.L.
 isil	Intersil
 issi	Integrated Silicon Solutions Inc.
+jdi	Japan Display Inc.
 jedec	JEDEC Solid State Technology Association
 karo	Ka-Ro electronics GmbH
 keymile	Keymile GmbH
-- 
2.1.2
