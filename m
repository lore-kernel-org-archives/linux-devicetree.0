From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 1/5] dt-bindings: usb: mtu3: fix typo of DMA clock name
Date: Wed, 12 Jun 2019 13:55:17 +0800
Message-ID: <5e06482a0be15476c7b5825f155accf98275afa8.1560246390.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Jumin Li <jumin.li@mediatek.com>
List-Id: devicetree@vger.kernel.org

Fix typo of dma_ck

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
index 3382b5cb471d..5d740e9d4525 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
@@ -16,7 +16,7 @@ Required properties:
 	entry in clock-names
  - clock-names : must contain "sys_ck" for clock of controller,
 	the following clocks are optional:
-	"ref_ck", "mcu_ck" and "dam_ck";
+	"ref_ck", "mcu_ck" and "dma_ck";
  - phys : see usb-hcd.txt in the current directory
  - dr_mode : should be one of "host", "peripheral" or "otg",
 	refer to usb/generic.txt
-- 
2.21.0
