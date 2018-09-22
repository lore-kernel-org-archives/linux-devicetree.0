From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/5] dt-bindings: arm: amlogic: Add the Endless Mobile
 Endless Mini (EC-100)
Date: Sat, 22 Sep 2018 17:10:00 +0200
Message-ID: <20180922151003.4736-3-martin.blumenstingl@googlemail.com>
References: <20180922151003.4736-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180922151003.4736-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, drake@endlessm.com
List-Id: devicetree@vger.kernel.org

Add bindings documentation for the Endless Mini (EC-100) from Endless
Mobile.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index b5c2b5c35766..2c2eee206736 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -63,6 +63,7 @@ Board compatible values (alphabetically, grouped by SoC):
 
   - "minix,neo-x8" (Meson8)
 
+  - "endless,ec100" (Meson8b)
   - "hardkernel,odroid-c1" (Meson8b)
   - "tronfy,mxq" (Meson8b)
 
-- 
2.19.0
