From: Neal Liu <neal.liu@mediatek.com>
Subject: [PATCH v4 2/3] dt-bindings: rng: add bindings for MediaTek ARMv8 SoCs
Date: Mon, 24 Jun 2019 15:24:11 +0800
Message-ID: <1561361052-13072-3-git-send-email-neal.liu@mediatek.com>
References: <1561361052-13072-1-git-send-email-neal.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561361052-13072-1-git-send-email-neal.liu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: Neal Liu <neal.liu@mediatek.com>, Crystal Guo <Crystal.Guo@mediatek.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Document the binding used by the MediaTek ARMv8 SoCs random
number generator with TrustZone enabled.

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
---
 .../devicetree/bindings/rng/mtk-sec-rng.txt        |   10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/mtk-sec-rng.txt

diff --git a/Documentation/devicetree/bindings/rng/mtk-sec-rng.txt b/Documentation/devicetree/bindings/rng/mtk-sec-rng.txt
new file mode 100644
index 0000000..c04ce15
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/mtk-sec-rng.txt
@@ -0,0 +1,10 @@
+MediaTek random number generator with TrustZone enabled
+
+Required properties:
+- compatible : Should be "mediatek,mtk-sec-rng"
+
+Example:
+
+hwrng: hwrng {
+	compatible = "mediatek,mtk-sec-rng";
+}
-- 
1.7.9.5
