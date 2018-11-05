From: Maxime Jourdan <mjourdan@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: display: amlogic, meson-vpu: Add optional canvas provider node
Date: Mon,  5 Nov 2018 11:45:07 +0100
Message-ID: <20181105104508.23090-2-mjourdan@baylibre.com>
References: <20181105104508.23090-1-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105104508.23090-1-mjourdan@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Allows using the new canvas provider module if present.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
index 057b81335775..c65fd7a7467c 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
@@ -67,6 +67,8 @@ Required properties:
 Optional properties:
 - power-domains: Optional phandle to associated power domain as described in
 	the file ../power/power_domain.txt
+- amlogic,canvas: phandle to canvas provider node as described in the file
+	../soc/amlogic/amlogic,canvas.txt
 
 Required nodes:
 
-- 
2.19.1
