From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH v3 5/6] arm: multi_v7_defconfig: add MACH_ARTPEC6
Date: Thu, 11 Feb 2016 17:06:20 +0100
Message-ID: <2ad1a7abcbbfc0861ac788d2df16241a501880d8.1455205057.git.larper@axis.com>
References: <cover.1455205057.git.larper@axis.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1455205057.git.larper@axis.com>
In-Reply-To: <cover.1455205057.git.larper@axis.com>
References: <cover.1455205057.git.larper@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lars Persson <larper@axis.com>
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 8e8b2ac..1149642 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -16,6 +16,8 @@ CONFIG_ARCH_MULTI_V7=y
 # CONFIG_ARCH_MULTI_V4 is not set
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_ALPINE=y
+CONFIG_ARCH_ARTPEC=y
+CONFIG_MACH_ARTPEC6=y
 CONFIG_ARCH_MVEBU=y
 CONFIG_MACH_ARMADA_370=y
 CONFIG_MACH_ARMADA_375=y
@@ -227,6 +229,7 @@ CONFIG_R8169=y
 CONFIG_SH_ETH=y
 CONFIG_SMSC911X=y
 CONFIG_STMMAC_ETH=y
+CONFIG_SYNOPSYS_DWC_ETH_QOS=y
 CONFIG_TI_CPSW=y
 CONFIG_XILINX_EMACLITE=y
 CONFIG_AT803X_PHY=y
-- 
2.1.4
