From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 3/5] dt-bindings: usb: mtk-xhci: add an optional xhci_ck clock
Date: Wed, 12 Jun 2019 13:55:19 +0800
Message-ID: <9b6ad8dee142d73b56d653ecb7475c4ed28e5eb8.1560246390.git.chunfeng.yun@mediatek.com>
References: <5e06482a0be15476c7b5825f155accf98275afa8.1560246390.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5e06482a0be15476c7b5825f155accf98275afa8.1560246390.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Jumin Li <jumin.li@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add a new optional clock xhci_ck

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
index 266c2d917a28..91c0704b586b 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
@@ -29,6 +29,7 @@ Required properties:
 	"sys_ck": controller clock used by normal mode,
 	the following ones are optional:
 	"ref_ck": reference clock used by low power mode etc,
+	"xhci_ck": controller clock,
 	"mcu_ck": mcu_bus clock for register access,
 	"dma_ck": dma_bus clock for data transfer by DMA
 
@@ -100,7 +101,7 @@ Required properties:
  - clocks : a list of phandle + clock-specifier pairs, one for each
 	entry in clock-names
  - clock-names : must contain "sys_ck", and the following ones are optional:
-	"ref_ck", "mcu_ck" and "dma_ck"
+	"ref_ck", "xhci_ck", "mcu_ck" and "dma_ck"
 
 Optional properties:
  - vbus-supply : reference to the VBUS regulator;
-- 
2.21.0
