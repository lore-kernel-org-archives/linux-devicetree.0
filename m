From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/7] arm: multi_v7_defconfig: Enable Mediatek platform
Date: Thu, 31 Jul 2014 18:42:18 +0200
Message-ID: <1406824943-24052-3-git-send-email-matthias.bgg@gmail.com>
References: <1406824943-24052-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406824943-24052-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, olof@lixom.net, arnd@arndb.de, jason@lakedaemon.net, thomas.petazzoni@free-electrons.com, swarren@nvidia.com, sebastian.hesselbarth@gmail.com, stefan@agner.ch, maxime.ripard@free-electrons.com, matthias.bgg@gmail.com, anders.berg@lsi.com, linus.walleij@linaro.org, heiko@sntech.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable Mediatek platform support for multi_v7_defconfig.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e2d6204..a92559f 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -39,6 +39,7 @@ CONFIG_SOC_AM33XX=y
 CONFIG_SOC_AM43XX=y
 CONFIG_SOC_DRA7XX=y
 CONFIG_ARCH_QCOM=y
+CONFIG_ARCH_MEDIATEK=y
 CONFIG_ARCH_MSM8X60=y
 CONFIG_ARCH_MSM8960=y
 CONFIG_ARCH_MSM8974=y
-- 
1.7.9.5
