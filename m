From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/7] arm: dts: Build dtb for Mediatek board
Date: Thu, 31 Jul 2014 18:42:17 +0200
Message-ID: <1406824943-24052-2-git-send-email-matthias.bgg@gmail.com>
References: <1406824943-24052-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406824943-24052-1-git-send-email-matthias.bgg@gmail.com>
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
Cc: mark.rutland@arm.com, thomas.petazzoni@free-electrons.com, linux@arm.linux.org.uk, arnd@arndb.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linus.walleij@linaro.org, heiko@sntech.de, stefan@agner.ch, matthias.bgg@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, galak@codeaurora.org, olof@lixom.net, swarren@nvidia.com, maxime.ripard@free-electrons.com, sebastian.hesselbarth@gmail.com, anders.berg@lsi.com, jason@lakedaemon.net
List-Id: devicetree@vger.kernel.org

This allows the "make dtbs" to build the aquaris5 dtb for the Mediatek
SoC.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/boot/dts/Makefile |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5986ff6..f9567b9 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -445,6 +445,7 @@ dtb-$(CONFIG_MACH_DOVE) += dove-cm-a510.dtb \
 	dove-d2plug.dtb \
 	dove-d3plug.dtb \
 	dove-dove-db.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6589-aquaris5.dtb
 
 targets += dtbs dtbs_install
 targets += $(dtb-y)
-- 
1.7.9.5
