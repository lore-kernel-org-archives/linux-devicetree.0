From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2] dt-bindings: phy-rockchip-inno-usb2: add documentation for extcon property
Date: Wed,  9 Jan 2019 18:17:39 +0100
Message-ID: <20190109171739.11494-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: kernel@collabora.com, bleung@chromium.org, heiko@sntech.de, groeck@google.com, kieran.bingham@ideasonboard.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Commit 98898f3bc83c8 ("phy: rockchip-inno-usb2: support otg-port for
rk3399") introduces the extcon property that is used to detect the
cable-state. Document this property in the documentation binding.

Fixes: 98898f3bc83c8 ("phy: rockchip-inno-usb2: support otg-port for rk3399")
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
Hi all,

This patch was send for the first time within these series [1], but
might have more sense sent alone as doesn't depends on the rest of
the series, so, remove from these series and send a second version
that can be applied independently.

Best regards,
Enric

[1] https://lkml.org/lkml/2018/8/15/141

Changes in v2:
- Split from the first version and send as a separate patch.
- Mention that the extcon provides the cable-state. (Heiko)
- Remove the introduced utmi-avalid documentation.

 .../devicetree/bindings/phy/phy-rockchip-inno-usb2.txt          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
index 074a7b3b0425..00639baae74a 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
@@ -23,6 +23,8 @@ Optional properties:
 		 register files". When set driver will request its
 		 phandle as one companion-grf for some special SoCs
 		 (e.g RV1108).
+ - extcon : phandle to the extcon device providing the cable state for
+		 the otg phy.
 
 Required nodes : a sub-node is required for each port the phy provides.
 		 The sub-node name is used to identify host or otg port,
-- 
2.20.1
