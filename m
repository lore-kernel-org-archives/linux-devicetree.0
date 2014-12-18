From: Josh Wu <josh.wu@atmel.com>
Subject: [PATCH 7/7] ARM: at91: sama5: enable atmel-isi and ov2640 in defconfig
Date: Thu, 18 Dec 2014 16:51:07 +0800
Message-ID: <1418892667-27428-8-git-send-email-josh.wu@atmel.com>
References: <1418892667-27428-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1418892667-27428-1-git-send-email-josh.wu@atmel.com>
Sender: linux-media-owner@vger.kernel.org
To: nicolas.ferre@atmel.com
Cc: voice.shen@atmel.com, plagnioj@jcrosoft.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-media@vger.kernel.org, g.liakhovetski@gmx.de, laurent.pinchart@ideasonboard.com, Josh Wu <josh.wu@atmel.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 arch/arm/configs/sama5_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index b58fb32..92f1d71 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -139,6 +139,12 @@ CONFIG_POWER_RESET=y
 CONFIG_SSB=m
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_ACT8865=y
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_SOC_CAMERA=y
+CONFIG_SOC_CAMERA_OV2640=y
+CONFIG_VIDEO_ATMEL_ISI=y
 CONFIG_FB=y
 CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_LCD_CLASS_DEVICE is not set
-- 
1.9.1
