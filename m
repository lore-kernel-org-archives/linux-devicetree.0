From: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: PCI: Add support for MT7629
Date: Thu, 6 Dec 2018 09:09:12 +0800
Message-ID: <1544058553-10936-2-git-send-email-jianjun.wang@mediatek.com>
References: <1544058553-10936-1-git-send-email-jianjun.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544058553-10936-1-git-send-email-jianjun.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ryder.lee@mediatek.com, bhelgaas@google.com, robh+dt@kernel.org, lorenzo.pieralisi@arm.com, matthias.bgg@gmail.com, linux-pci@vger.kernel.org
Cc: mark.rutland@arm.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, honghui.zhang@mediatek.com, youlin.pei@mediatek.com, Jianjun Wang <jianjun.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

MT7629 is an arm platform Soc which has the same PCIe IP with MT7622.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 Documentation/devicetree/bindings/pci/mediatek-pcie.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
index 20227a875ac8..3790c6cc108f 100644
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
2.19.1
