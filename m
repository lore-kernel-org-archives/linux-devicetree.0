From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 3/4] dt-bindings: display: amlogic: DT fix
 s/resets-names/reset-names/
Date: Fri,  6 Jul 2018 10:32:48 +0200
Message-ID: <20180706083249.25399-4-geert+renesas@glider.be>
References: <20180706083249.25399-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180706083249.25399-1-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, "David S . Miller" <davem@davemloft.net>, Chanho Min <chanho.min@lge.com>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Neil Armstrong <narmstrong@baylibre.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fixes: 8cceda5349377e30 ("dt-bindings: Add bindings for the Amlogic Meson dw-hdmi extension")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
v5:
  - Add Acked-by,

v4:
  - Add Acked-by,

v3:
  - New.
---
 .../devicetree/bindings/display/amlogic,meson-dw-hdmi.txt       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
index bf4a18047309a5f8..d8f6268849f43621 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
@@ -43,7 +43,7 @@ Required properties:
   and the Amlogic Meson venci clocks as described in
   Documentation/devicetree/bindings/clock/clock-bindings.txt,
   the clocks are soc specific, the clock-names should be "iahb", "isfr", "venci"
-- resets, resets-names: must have the phandles to the HDMI apb, glue and phy
+- resets, reset-names: must have the phandles to the HDMI apb, glue and phy
   resets as described in :
   Documentation/devicetree/bindings/reset/reset.txt,
   the reset-names should be "hdmitx_apb", "hdmitx", "hdmitx_phy"
-- 
2.17.1
