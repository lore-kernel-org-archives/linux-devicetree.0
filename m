From: Sunil Mohan Adapa <sunil@medhas.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: sunxi: Add compatible for A64
 OlinuXino with eMMC
Date: Wed, 21 Aug 2019 12:52:16 -0700
Message-ID: <20190821195217.4166-2-sunil@medhas.org>
References: <20190821195217.4166-1-sunil@medhas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190821195217.4166-1-sunil@medhas.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: maxime.ripard@bootlin.com, mark.rutland@arm.com, wens@csie.org, robh+dt@kernel.org, Sunil Mohan Adapa <sunil@medhas.org>
List-Id: devicetree@vger.kernel.org

A64 OLinuXino board from Olimex has three variants with onboard eMMC:
A64-OLinuXino-1Ge16GW, A64-OLinuXino-1Ge4GW and A64-OLinuXino-2Ge8G-IND. In
addition, there are two variants without eMMC. One without eMMC and one with SPI
flash. This suggests the need for separate device tree for the three eMMC
variants.

Add new compatible string to the bindings documentation for the A64 OlinuXino
board variant with on-board eMMC.

Signed-off-by: Sunil Mohan Adapa <sunil@medhas.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 93dc4c607f07..972b1e9ee804 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -574,6 +574,11 @@ properties:
           - const: olimex,a64-olinuxino
           - const: allwinner,sun50i-a64
 
+      - description: Olimex A64-OlinuXino (with eMMC)
+        items:
+          - const: olimex,a64-olinuxino-emmc
+          - const: allwinner,sun50i-a64
+
       - description: Olimex A64 Teres-I
         items:
           - const: olimex,a64-teres-i
-- 
2.20.1
