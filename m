From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 2/2] ARM: qcom_defconfig: add support for USB networking
Date: Sun,  2 Jun 2019 21:04:55 -0400
Message-ID: <20190603010455.17060-2-masneyb@onstation.org>
References: <20190603010455.17060-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603010455.17060-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org
Cc: bjorn.andersson@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linus.walleij@linaro.org, frank.rowand@sony.com, miquel.raynal@bootlin.com, absahu@codeaurora.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add support for USB networking as a module to qcom_defconfig since its
a useful feature to have for development purposes.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
This is to be applied on top of the display patch series:
https://lore.kernel.org/lkml/20190531094619.31704-1-masneyb@onstation.org/

 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 4f02636f832e..f26103eae564 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -186,6 +186,7 @@ CONFIG_USB_CONFIGFS_NCM=y
 CONFIG_USB_CONFIGFS_ECM=y
 CONFIG_USB_CONFIGFS_F_FS=y
 CONFIG_USB_ULPI_BUS=y
+CONFIG_USB_ETH=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
-- 
2.20.1
