From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: [PATCH 1/7] dt-bindings: add cdtech vendor prefix
Date: Wed, 21 Mar 2018 21:03:07 +0100
Message-ID: <1521662593-25468-1-git-send-email-giulio.benetti@micronovasrl.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, Giulio Benetti <giulio.benetti@micronovasrl.com>
List-Id: devicetree@vger.kernel.org

This adds a vendor prefix "cdtech" for CDTech(H.K.) Electronics Limited

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ae850d6..9854399 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -61,6 +61,7 @@ capella	Capella Microsystems, Inc
 cascoda	Cascoda, Ltd.
 cavium	Cavium, Inc.
 cdns	Cadence Design Systems Inc.
+cdtech	CDTech(H.K.) Electronics Limited
 ceva	Ceva, Inc.
 chipidea	Chipidea, Inc
 chipone		ChipOne
-- 
2.7.4
