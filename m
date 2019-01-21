From: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: [v1,1/2] dt-bindings: PCI: Add support for MT7629
Date: Mon, 21 Jan 2019 19:11:01 +0800
Message-ID: <1548069062-12430-2-git-send-email-jianjun.wang@mediatek.com>
References: <1548069062-12430-1-git-send-email-jianjun.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548069062-12430-1-git-send-email-jianjun.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kernel.org, lorenzo.pieralisi@arm.com, ryder.lee@mediatek.com, mark.rutland@arm.com
Cc: matthias.bgg@gmail.com, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, honghui.zhang@mediatek.com, youlin.pei@mediatek.com, jianjun.wang@mediatek.com
List-Id: devicetree@vger.kernel.org

MT7629 is an ARM platform Soc which has the same PCIe IP with MT7622.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 Documentation/devicetree/bindings/pci/mediatek-pcie.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
index 92437a366e5f..7468d666763a 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
@@ -6,6 +6,7 @@ Required properties:
 	"mediatek,mt2712-pcie"
 	"mediatek,mt7622-pcie"
 	"mediatek,mt7623-pcie"
+	"mediatek,mt7629-pcie"
 - device_type: Must be "pci"
 - reg: Base addresses and lengths of the PCIe subsys and root ports.
 - reg-names: Names of the above areas to use during resource lookup.
-- 
2.20.1
