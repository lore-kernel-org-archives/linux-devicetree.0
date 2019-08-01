From: Ran Bi <ran.bi@mediatek.com>
Subject: [PATCH v2 4/4] MAINTAINERS: add MT2712 RTC files
Date: Thu, 1 Aug 2019 19:01:22 +0800
Message-ID: <20190801110122.26834-5-ran.bi@mediatek.com>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190801110122.26834-1-ran.bi@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Flora Fu <flora.fu@mediatek.com>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Ran Bi <ran.bi@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, YT Shen <yt.shen@mediatek.com>, linux-mediatek@lists.infradead.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch add MT2712 RTC related files to MAINTAINERS.

Signed-off-by: Ran Bi <ran.bi@mediatek.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 783569e3c4b4..11f73a4c75eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1892,7 +1892,9 @@ M:	Sean Wang <sean.wang@mediatek.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
 F:	Documentation/devicetree/bindings/rtc/rtc-mt7622.txt
+F:	drivers/rtc/rtc-mt2712.c
 F:	drivers/rtc/rtc-mt6397.c
 F:	drivers/rtc/rtc-mt7622.c
 
-- 
2.21.0
