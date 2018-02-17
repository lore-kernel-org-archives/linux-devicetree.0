From: <sean.wang@mediatek.com>
Subject: [PATCH v5 3/3] dmaengine: mediatek: update MAINTAINERS entry with
 MediaTek DMA driver
Date: Sun, 18 Feb 2018 03:08:31 +0800
Message-ID: <4ebffd841fc3b2093fb35c3d10b8b167a9e42bcc.1518857747.git.sean.wang@mediatek.com>
References: <cover.1518857746.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1518857746.git.sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: vinod.koul@intel.com, dan.j.williams@intel.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

I work for MediaTek and maintain SoC targeting to home gateway and
also will keep extending and testing the function.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bdc260..d3c33d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8785,6 +8785,15 @@ M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained
 F:	drivers/media/rc/mtk-cir.c
 
+MEDIATEK DMA DRIVER
+M:	Sean Wang <sean.wang@mediatek.com>
+L:	dmaengine@vger.kernel.org
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/mtk-*
+F:	drivers/dma/mediatek/
+
 MEDIATEK PMIC LED DRIVER
 M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained
-- 
2.7.4
