From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH] usb: dwc3: rockchip: Fix PHY documentation links.
Date: Tue, 10 Jul 2018 14:58:48 +0200
Message-ID: <20180710125848.15915-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Commit 34962fb8070c ("docs: Fix more broken references") replaced the
broken reference to rockchip,dwc3-usb-phy.txt binding for the Qualcomm
DWC3 binding (qcom-dwc3-usb-phy.txt). That's wrong, so replace that
reference for the correct ones.

Fixes: 34962fb8070c ("docs: Fix more broken references")
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 Documentation/devicetree/bindings/usb/rockchip,dwc3.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
index 252a05c5d976..c8c4b00ecb94 100644
--- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
@@ -16,7 +16,8 @@ A child node must exist to represent the core DWC3 IP block. The name of
 the node is not important. The content of the node is defined in dwc3.txt.
 
 Phy documentation is provided in the following places:
-Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
+Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt - USB2.0 PHY
+Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt     - Type-C PHY
 
 Example device nodes:
 
-- 
2.18.0
