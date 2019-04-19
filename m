From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 1/6] dt-bindings: gpu: mali-utgard: add hisilicon,
 hi6220-mali compatible
Date: Fri, 19 Apr 2019 09:32:56 +0100
Message-ID: <1555662781-22570-2-git-send-email-peter.griffin@linaro.org>
References: <1555662781-22570-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1555662781-22570-1-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de, xuwei5@hisilicon.com, mturquette@baylibre.com, sboyd@kernel.org, yuq825@gmail.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

The Hisilicon hi6220 uses a Mali-450MP4 with 4 PPs, so add
a compatible for it.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
index 3f128e4..2a16b0c 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
@@ -21,6 +21,7 @@ Required properties:
       + rockchip,rk3228-mali
       + rockchip,rk3328-mali
       + stericsson,db8500-mali
+      + hisilicon,hi6220-mali
 
   - reg: Physical base address and length of the GPU registers
 
@@ -91,6 +92,10 @@ to specify one more vendor-specific compatible, among:
       * interrupt-names and interrupts:
         + combined: combined interrupt of all of the above lines
 
+  - hisilicon,hi6220-mali
+    Required properties:
+      * resets: phandles to the reset lines for the GPU
+
 Example:
 
 mali: gpu@1c40000 {
-- 
2.7.4
