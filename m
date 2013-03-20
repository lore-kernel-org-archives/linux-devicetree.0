From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 07/11] ARM: versatile: add versatile dtbs to dtbs target
Date: Wed, 20 Mar 2013 17:54:07 -0500
Message-ID: <1363820051-24428-8-git-send-email-robherring2@gmail.com>
References: <1363820051-24428-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363820051-24428-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Arnd Bergmann <arnd@arndb.de>, linus.walleij@linaro.org, Russell King <linux@arm.linux.org.uk>, haojian.zhuang@linaro.org, pawel.moll@arm.com, john.stultz@linaro.org, tglx@linutronix.de, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Add the versatile platform dtbs to the dtbs make rule.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
---
 arch/arm/boot/dts/Makefile |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 9c62558..08d298d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -165,6 +165,8 @@ dtb-$(CONFIG_ARCH_TEGRA) += tegra20-harmony.dtb \
 	tegra30-cardhu-a04.dtb \
 	tegra114-dalmore.dtb \
 	tegra114-pluto.dtb
+dtb-$(CONFIG_ARCH_VERSATILE) += versatile-ab.dtb \
+	versatile-pb.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += vexpress-v2p-ca5s.dtb \
 	vexpress-v2p-ca9.dtb \
 	vexpress-v2p-ca15-tc1.dtb \
-- 
1.7.10.4
