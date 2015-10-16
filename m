From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH v2 6/8] ARM: multi_v7_defconfig: Add Atmel SAMA5D2 SoC
Date: Fri, 16 Oct 2015 15:04:49 +0200
Message-ID: <1445000691-12402-7-git-send-email-ludovic.desroches@atmel.com>
References: <1445000691-12402-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445000691-12402-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com
Cc: plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cyrille.pitchen@atmel.com, Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: devicetree@vger.kernel.org

Add Atmel SAMA5D2 SoC family to multi_v7 image.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bf099b7..63703fa 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -21,6 +21,7 @@ CONFIG_MACH_ARMADA_39X=y
 CONFIG_MACH_ARMADA_XP=y
 CONFIG_MACH_DOVE=y
 CONFIG_ARCH_AT91=y
+CONFIG_SOC_SAMA5D2=y
 CONFIG_SOC_SAMA5D3=y
 CONFIG_SOC_SAMA5D4=y
 CONFIG_ARCH_BCM=y
-- 
2.5.0
