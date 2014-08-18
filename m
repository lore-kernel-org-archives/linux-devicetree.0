From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/9] arm: dts: Build dtb for Mediatek board
Date: Mon, 18 Aug 2014 16:58:29 +0200
Message-ID: <1408373917-10002-2-git-send-email-matthias.bgg@gmail.com>
References: <1408373917-10002-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1408373917-10002-1-git-send-email-matthias.bgg@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, heiko@sntech.de, anders.berg@lsi.com, linus.walleij@linaro.org, stefan@agner.ch, lee.jones@linaro.org, linux@arm.linux.org.uk, pawel.moll@arm.com, srv_yingjoe.chen@mediatek.com, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, jason@lakedaemon.net, arnd@arndb.de, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, matthias.bgg@gmail.com, swarren@nvidia.com, linux-arm-kernel@lists.infradead.org, thomas.petazzoni@free-electrons.com, galak@codeaurora.org, olof@lixom.net, maxime.ripard@free-electrons.com
List-Id: devicetree@vger.kernel.org

This allows the "make dtbs" to build the aquaris5 dtb for the Mediatek
SoC.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/boot/dts/Makefile |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b8c5cd3..055b20c 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -491,6 +491,7 @@ dtb-$(CONFIG_MACH_DOVE) += dove-cm-a510.dtb \
 	dove-d2plug.dtb \
 	dove-d3plug.dtb \
 	dove-dove-db.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6589-aquaris5.dtb
 
 targets += dtbs dtbs_install
 targets += $(dtb-y)
-- 
1.7.9.5
