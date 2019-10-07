From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 1/3] dt-bindings: media: Fix id path for sun4i-a10-csi
Date: Mon, 7 Oct 2019 12:25:50 +0200
Message-ID: <20191007102552.19808-2-alexandre.torgue@st.com>
References: <20191007102552.19808-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007102552.19808-1-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Alexandru Ardelean <alexaundru.ardelean@analog.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-media@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This commit fixes id path of allwinner,sun4i-a10-csi.yaml location.

Fixes: c5e8f4ccd775 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
index 27f38eed389e..5dd1cf490cd9 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
+$id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-csi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
-- 
2.17.1
