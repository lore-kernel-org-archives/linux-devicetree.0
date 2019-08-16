From: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 1/2] dt-bindings: arm: sunxi: Add compatible for Tanix TX6 board
Date: Fri, 16 Aug 2019 22:53:41 +0200
Message-ID: <20190816205342.29552-2-jernej.skrabec@siol.net>
References: <20190816205342.29552-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190816205342.29552-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, mripard@kernel.org, wens@csie.org
Cc: jernej.skrabec@siol.net, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add new Oranth Tanix TX6 board compatible string to the bindings
documentation.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
index 000a00d12d6a..6afeb1be3a44 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -671,6 +671,11 @@ properties:
           - const: sinlinx,sina33
           - const: allwinner,sun8i-a33
=20
+      - description: Tanix TX6
+        items:
+          - const: oranth,tanix-tx6
+          - const: allwinner,sun50i-h6
+
       - description: TBS A711 Tablet
         items:
           - const: tbs-biometrics,a711
--=20
2.22.1
