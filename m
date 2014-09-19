From: Joe.C <srv_yingjoe.chen@mediatek.com>
Subject: [PATCH v3 6/7] arm: dts: Build dtb for mt8127 & mt8135
Date: Fri, 19 Sep 2014 11:04:18 +0800
Message-ID: <1411095859-18737-7-git-send-email-srv_yingjoe.chen@mediatek.com>
References: <1411095859-18737-1-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411095859-18737-1-git-send-email-srv_yingjoe.chen@mediatek.com>
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

This allows the "make dtbs" to build the moose and mt8135-evbp1
for MediaTek SoC

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 arch/arm/boot/dts/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 055b20c..1e7380d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -491,7 +491,9 @@ dtb-$(CONFIG_MACH_DOVE) += dove-cm-a510.dtb \
 	dove-d2plug.dtb \
 	dove-d3plug.dtb \
 	dove-dove-db.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt6589-aquaris5.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6589-aquaris5.dtb \
+	mt8127-moose.dtb \
+	mt8135-evbp1.dtb
 
 targets += dtbs dtbs_install
 targets += $(dtb-y)
-- 
1.8.1.1.dirty
