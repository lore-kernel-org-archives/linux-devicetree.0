From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v4 1/4] dt-bindings: clock: add compatible variant for the
 Meson-AXG
Date: Fri, 1 Dec 2017 09:24:49 +0800
Message-ID: <20171201012452.27086-2-yixun.lan@amlogic.com>
References: <20171201012452.27086-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171201012452.27086-1-yixun.lan@amlogic.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yixun Lan <yixun.lan@amlogic.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Qiufang Dai <qiufang.dai@amlogic.com>, Rob Herring <robh+dt@kernel.org>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Update the documentation to support clock driver for the Amlogic's
Meson-AXG SoC.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index 924040769186..e2b377ed6f91 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -5,8 +5,11 @@ controllers within the SoC.
 
 Required Properties:
 
-- compatible: should be "amlogic,gxbb-clkc" for GXBB SoC,
-	      or "amlogic,gxl-clkc" for GXL and GXM SoC.
+- compatible: should be:
+		"amlogic,gxbb-clkc" for GXBB SoC,
+		"amlogic,gxl-clkc" for GXL and GXM SoC,
+		"amlogic,axg-clkc" for AXG SoC.
+
 - reg: physical base address of the clock controller and length of memory
        mapped region.
 
-- 
2.15.0
