From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 01/15] dt-bindings: display: rockchip-lvds: Remove panel references
Date: Mon, 24 Jun 2019 15:56:35 -0600
Message-ID: <20190624215649.8939-2-robh@kernel.org>
References: <20190624215649.8939-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624215649.8939-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The panel bindings are outside the scope of the Rockchip LVDS interface
binding. The references are about to change too, so rather than update
them just drop the section on the panel bindings.

Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/rockchip/rockchip-lvds.txt       | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
index da6939efdb43..7849ff039229 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
@@ -32,17 +32,6 @@ Their connections are modeled using the OF graph bindings specified in
 - video port 0 for the VOP input, the remote endpoint maybe vopb or vopl
 - video port 1 for either a panel or subsequent encoder
 
-the lvds panel described by
-	Documentation/devicetree/bindings/display/panel/simple-panel.txt
-
-Panel required properties:
-- ports for remote LVDS output
-
-Panel optional properties:
-- data-mapping: should be "vesa-24","jeida-24" or "jeida-18".
-This describes decribed by:
-	Documentation/devicetree/bindings/display/panel/panel-lvds.txt
-
 Example:
 
 lvds_panel: lvds-panel {
-- 
2.20.1
