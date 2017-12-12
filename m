From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/5] ARM: shmobile: defconfig: Enable SGTL5000 audio codec
Date: Tue, 12 Dec 2017 18:25:07 +0000
Message-ID: <1513103111-45830-2-git-send-email-biju.das@bp.renesas.com>
References: <1513103111-45830-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513103111-45830-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

The iWave RZ/G1M Q7 carrier board supports I2S audio codec "SGTL5000".

To increase hardware support enable the driver in the shmobile_defconfig
multiplatform configuration.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 7b4fc01..d60dbe1 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -173,6 +173,7 @@ CONFIG_SND_SOC=y
 CONFIG_SND_SOC_SH4_FSI=y
 CONFIG_SND_SOC_RCAR=y
 CONFIG_SND_SOC_AK4642=y
+CONFIG_SND_SOC_SGTL5000=y
 CONFIG_SND_SOC_WM8978=y
 CONFIG_SND_SIMPLE_SCU_CARD=y
 CONFIG_USB=y
-- 
1.9.1
