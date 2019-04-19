From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 2/6] dt-bindings: reset: hisilicon: Update compatible
 documentation
Date: Fri, 19 Apr 2019 09:32:57 +0100
Message-ID: <1555662781-22570-3-git-send-email-peter.griffin@linaro.org>
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

The reset driver now supports the ao reset controller, so update the
documentation to match.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt b/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt
index c25da39..ea0a6a9 100644
--- a/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt
+++ b/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt
@@ -11,6 +11,7 @@ Required properties:
 - compatible: should be one of the following:
   - "hisilicon,hi6220-sysctrl", "syscon" : For peripheral reset controller.
   - "hisilicon,hi6220-mediactrl", "syscon" : For media reset controller.
+  - "hisilicon,hi6220-aoctrl", "syscon" : For ao reset controller.
 - reg: should be register base and length as documented in the
   datasheet
 - #reset-cells: 1, see below
-- 
2.7.4
