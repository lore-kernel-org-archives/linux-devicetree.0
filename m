From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: [PATCH 1/5] dt-bindings: Add vendor prefix for CDTech(H.K.) Electronics Limited
Date: Tue, 31 Jul 2018 01:11:13 +0200
Message-ID: <20180730231117.5631-2-giulio.benetti@micronovasrl.com>
References: <20180730231117.5631-1-giulio.benetti@micronovasrl.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730231117.5631-1-giulio.benetti@micronovasrl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Giulio Benetti <giulio.benetti@micronovasrl.com>
List-Id: devicetree@vger.kernel.org

This adds a vendor prefix "cdtech" for CDTech(H.K.) Electronics Limited

Website: www.cdtech-lcd.com

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 760d1c11458c..29894c628e00 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -64,6 +64,7 @@ capella	Capella Microsystems, Inc
 cascoda	Cascoda, Ltd.
 cavium	Cavium, Inc.
 cdns	Cadence Design Systems Inc.
+cdtech	CDTech(H.K.) Electronics Limited
 ceva	Ceva, Inc.
 chipidea	Chipidea, Inc
 chipone		ChipOne
-- 
2.17.1
