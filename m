From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 2/3] dt-bindings: net: adi: Fix yaml verification issue
Date: Mon, 7 Oct 2019 12:25:51 +0200
Message-ID: <20191007102552.19808-3-alexandre.torgue@st.com>
References: <20191007102552.19808-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191007102552.19808-1-alexandre.torgue@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Alexandru Ardelean <alexaundru.ardelean@analog.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This commit fixes an issue seen during yaml check ("make dt_binding_check").
Each enum were not declared as uint32.

"Documentation/devicetree/bindings/net/adi,adin.yaml:
properties:adi,rx-internal-delay-ps:
..., 'enum': [1600, 1800, 2000, 2200, 2400], 'default': 2000}
is not valid under any of the given schemas"

Fixes: 767078132ff9 ("dt-bindings: net: add bindings for ADIN PHY driver")
Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/net/adi,adin.yaml b/Documentation/devicetree/bindings/net/adi,adin.yaml
index d95cc691a65f..23e8597acda6 100644
--- a/Documentation/devicetree/bindings/net/adi,adin.yaml
+++ b/Documentation/devicetree/bindings/net/adi,adin.yaml
@@ -17,6 +17,8 @@ allOf:
 
 properties:
   adi,rx-internal-delay-ps:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
     description: |
       RGMII RX Clock Delay used only when PHY operates in RGMII mode with
       internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
@@ -24,6 +26,8 @@ properties:
     default: 2000
 
   adi,tx-internal-delay-ps:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
     description: |
       RGMII TX Clock Delay used only when PHY operates in RGMII mode with
       internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
@@ -31,6 +35,8 @@ properties:
     default: 2000
 
   adi,fifo-depth-bits:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
     description: |
       When operating in RMII mode, this option configures the FIFO depth.
     enum: [ 4, 8, 12, 16, 20, 24 ]
-- 
2.17.1
