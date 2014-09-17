From: Joe.C <srv_yingjoe.chen@mediatek.com>
Subject: [PATCH v2 5/7] dt-bindings: add more chips in documentation for
 Mediatek SoC
Date: Wed, 17 Sep 2014 22:24:12 +0800
Message-ID: <1410963854-17154-6-git-send-email-srv_yingjoe.chen@mediatek.com>
References: <1410963854-17154-1-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1410963854-17154-1-git-send-email-srv_yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Anders Berg <anders.berg@lsi.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, yingjoe.chen@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, hc.yen@mediatek.com, Linus Walleij <linus.walleij@linaro.org>, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, nathan.chung@mediatek.com, Kumar Gala <galak@codeaurora.org>, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen@mediatek.com>

Add MT8127 & MT8135 from Mediatek.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index fa25226..40a9745 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -1,10 +1,13 @@
-Mediatek MT6589 Platforms Device Tree Bindings
+Mediatek Platforms Device Tree Bindings
 
-Boards with a SoC of the Mediatek MT6589 shall have the following property:
+Boards with a SoC of the Mediatek shall have the following property:
 
 Required root node property:
 
-compatible: must contain "mediatek,mt6589"
+compatible: Must contain one of
+   "mediatek,mt6589"
+   "mediatek,mt8127"
+   "mediatek,mt8135"
 
 
 Supported boards:
-- 
1.8.1.1.dirty
