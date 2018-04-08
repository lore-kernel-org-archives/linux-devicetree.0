From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 2/3] dt-bindings: interrupt-controller: New binding for
 Meson-AXG SoC
Date: Sun, 8 Apr 2018 14:56:59 +0000
Message-ID: <20180408145700.23520-3-yixun.lan@amlogic.com>
References: <20180408145700.23520-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180408145700.23520-1-yixun.lan@amlogic.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

Update the dt-binding documentation to support new compatible string
for the GPIO interrupt controller which found in Amlogic's Meson-AXG SoC.

Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 .../devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
index c753d99d43db..89674ad8a097 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
@@ -14,6 +14,7 @@ Required properties:
     "amlogic,meson8b-gpio-intc" for meson8b SoCs (S805) or
     "amlogic,meson-gxbb-gpio-intc" for GXBB SoCs (S905) or
     "amlogic,meson-gxl-gpio-intc" for GXL SoCs (S905X, S912)
+    "amlogic,meson-axg-gpio-intc" for AXG SoCs (A113D, A113X)
 - interrupt-parent : a phandle to the GIC the interrupts are routed to.
    Usually this is provided at the root level of the device tree as it is
    common to most of the SoC.
-- 
2.16.2
