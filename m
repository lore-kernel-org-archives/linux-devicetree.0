From: <yt.shen@mediatek.com>
Subject: [RFC 1/3] dt-bindings: drm/mediatek: Add display binding for Mediatek SoC MT2701
Date: Thu, 12 May 2016 19:49:53 +0800
Message-ID: <1463053795-55455-2-git-send-email-yt.shen@mediatek.com>
References: <1463053795-55455-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463053795-55455-1-git-send-email-yt.shen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, YT Shen <yt.shen@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: YT Shen <yt.shen@mediatek.com>

Add device tree binding documentation for the display subsystem in
Mediatek SoC MT2701

Signed-off-by: YT Shen <yt.shen@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,disp.txt    |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index db6e77e..53b3cc3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -40,6 +40,7 @@ Required properties (all function blocks):
 	"mediatek,<chip>-dpi"        - DPI controller, see mediatek,dpi.txt
 	"mediatek,<chip>-disp-mutex" - display mutex
 	"mediatek,<chip>-disp-od"    - overdrive
+	"mediatek,<chip>-disp-bls"   - backlight
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
-- 
1.7.9.5
