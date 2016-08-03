From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
        <noltari@gmail.com>
Subject: [PATCH v2 1/7] MIPS: BMIPS: add missing bcm97435svmb to DT_NONE
Date: Wed,  3 Aug 2016 11:58:24 +0200
Message-ID: <1470218310-2978-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ralf@linux-mips.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, robh@kernel.org, simon@fire.lp0.eu, john@phrozen.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

Commit 380e4270 added support for bcm97435svmb.dtb but missed adding it to
DT_NONE.
Also refactor DT_NONE dtbs in order to add larger names in the future.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/Makefile | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/brcm/Makefile
index fda9d38..87e07e2 100644
--- a/arch/mips/boot/dts/brcm/Makefile
+++ b/arch/mips/boot/dts/brcm/Makefile
@@ -12,19 +12,20 @@ dtb-$(CONFIG_DT_BCM97420C)		+= bcm97420c.dtb
 dtb-$(CONFIG_DT_BCM97425SVMB)		+= bcm97425svmb.dtb
 dtb-$(CONFIG_DT_BCM97435SVMB)		+= bcm97435svmb.dtb
 
-dtb-$(CONFIG_DT_NONE)			+= \
-						bcm93384wvg.dtb		\
-						bcm93384wvg_viper.dtb	\
-						bcm96358nb4ser.dtb	\
-						bcm96368mvwg.dtb	\
-						bcm9ejtagprb.dtb	\
-						bcm97125cbmb.dtb	\
-						bcm97346dbsmb.dtb	\
-						bcm97358svmb.dtb	\
-						bcm97360svmb.dtb	\
-						bcm97362svmb.dtb	\
-						bcm97420c.dtb		\
-						bcm97425svmb.dtb
+dtb-$(CONFIG_DT_NONE) += \
+	bcm93384wvg.dtb \
+	bcm93384wvg_viper.dtb \
+	bcm96358nb4ser.dtb \
+	bcm96368mvwg.dtb \
+	bcm9ejtagprb.dtb \
+	bcm97125cbmb.dtb \
+	bcm97346dbsmb.dtb \
+	bcm97358svmb.dtb \
+	bcm97360svmb.dtb \
+	bcm97362svmb.dtb \
+	bcm97420c.dtb \
+	bcm97425svmb.dtb \
+	bcm97435svmb.dtb
 
 obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
 
-- 
2.1.4
