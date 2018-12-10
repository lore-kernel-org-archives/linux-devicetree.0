From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: gpu: mali-midgard: Add resets property
Date: Mon, 10 Dec 2018 14:22:26 +0100
Message-ID: <20181210132227.29262-2-narmstrong@baylibre.com>
References: <20181210132227.29262-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210132227.29262-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, khilman@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Amlogic ARM Mali Midgard requires reset controls to power on and
software reset the GPU, adds these as optional in the bindings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index 18a2cde2e5f3..24d83ec952f1 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -37,6 +37,8 @@ Optional properties:
 - operating-points-v2 : Refer to Documentation/devicetree/bindings/opp/opp.txt
   for details.
 
+- resets : Phandle to the reset controls for the Mali Midgard device.
+
 
 Example for a Mali-T760:
 
-- 
2.19.2
