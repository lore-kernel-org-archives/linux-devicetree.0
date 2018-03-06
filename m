From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v4 5/6] dt-bindings: clock: mediatek: add audsys support for
 MT2701
Date: Tue, 6 Mar 2018 17:09:30 +0800
Message-ID: <9ff8a4ae99e50bc5f9f1ae6c7a454cb80451fd5b.1520327262.git.ryder.lee@mediatek.com>
References: <cover.1520327262.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1520327262.git.ryder.lee@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Garlic Tseng <garlic.tseng@mediatek.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds a compatible string for MT2701.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
index 97b304e..34a69ba 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
@@ -6,6 +6,7 @@ The MediaTek AUDSYS controller provides various clocks to the system.
 Required Properties:
 
 - compatible: Should be one of:
+	- "mediatek,mt2701-audsys", "syscon"
 	- "mediatek,mt7622-audsys", "syscon"
 - #clock-cells: Must be 1
 
-- 
1.9.1
