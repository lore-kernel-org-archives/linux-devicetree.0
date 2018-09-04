From: Argus Lin <argus.lin@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: pwrap: mediatek: add pwrap support for MT6765
Date: Tue, 4 Sep 2018 20:31:52 +0800
Message-ID: <1536064314-31967-2-git-send-email-argus.lin@mediatek.com>
References: <1536064314-31967-1-git-send-email-argus.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1536064314-31967-1-git-send-email-argus.lin@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, argus.lin@mediatek.com, wsd_upstream@mediatek.com, Chenglin Xu <chenglin.xu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com, flora.fu@mediatek.com, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Chen Zhong <chen.zhong@mediatek.com>, "shailendra.v" <shailendra.v@samsung.com>
List-Id: devicetree@vger.kernel.org

Add binding document of pwrap for MT6765 SoCs.

Signed-off-by: Argus Lin <argus.lin@mediatek.com>
---
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index f9987c3..359d64f 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -19,6 +19,7 @@ IP Pairing
 Required properties in pwrap device node.
 - compatible:
 	"mediatek,mt2701-pwrap" for MT2701/7623 SoCs
+	"mediatek,mt6765-pwrap" for MT6765 SoCs
 	"mediatek,mt6797-pwrap" for MT6797 SoCs
 	"mediatek,mt7622-pwrap" for MT7622 SoCs
 	"mediatek,mt8135-pwrap" for MT8135 SoCs
-- 
1.8.1.1.dirty
