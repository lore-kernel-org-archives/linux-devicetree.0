From: <yuantian.tang@nxp.com>
Subject: [PATCH 1/2] dt-bindings: ahci-fsl-qoriq: added explanation for reg-names
Date: Thu, 17 Nov 2016 15:59:19 +0800
Message-ID: <1479369560-9188-1-git-send-email-yuantian.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-ide-owner@vger.kernel.org>
Sender: linux-ide-owner@vger.kernel.org
To: tj@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, shawnguo@kernel.org, linux-ide@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tang Yuantian <Yuantian.Tang@nxp.com>, Tang Yuantian <yuantian.tang@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Tang Yuantian <Yuantian.Tang@nxp.com>

Added explanation for reg-names to make it more clear.

Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>
---
 Documentation/devicetree/bindings/ata/ahci-fsl-qoriq.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/ahci-fsl-qoriq.txt b/Documentation/devicetree/bindings/ata/ahci-fsl-qoriq.txt
index fc33ca0..80cf10c 100644
--- a/Documentation/devicetree/bindings/ata/ahci-fsl-qoriq.txt
+++ b/Documentation/devicetree/bindings/ata/ahci-fsl-qoriq.txt
@@ -10,6 +10,8 @@ Required properties:
 Optional properties:
   - dma-coherent: Enable AHCI coherent DMA operation.
   - reg-names: register area names when there are more than 1 register area.
+		example: 'ahci' is for sata controller register.
+			 'sata-ecc' is for sata ecc register.
 
 Examples:
 	sata@3200000 {
-- 
2.1.0.27.g96db324

