From: hean.loong.ong@intel.com
Subject: [PATCHv3 2/3] ARM: socfpga: drm driver updates in socfpga_defconfig
Date: Thu, 13 Jul 2017 09:40:46 +0800
Message-ID: <1499910047-25936-3-git-send-email-hean.loong.ong@intel.com>
References: <1499910047-25936-1-git-send-email-hean.loong.ong@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499910047-25936-1-git-send-email-hean.loong.ong@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, hean.loong.ong@intel.com, Ong@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: "Ong, Hean Loong" <hean.loong.ong@intel.com>

Intel FPGA Video and Image Processing Suite Frame Buffer II
driver config for Arria 10 devkit and its variants

Signed-off-by: Ong, Hean Loong <hean.loong.ong@intel.com>
---
 arch/arm/configs/socfpga_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index 2620ce7..255f553 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -111,6 +111,12 @@ CONFIG_MFD_ALTERA_A10SR=y
 CONFIG_MFD_STMPE=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_DRM=m
+CONFIG_DRM_IVIP=m
+CONFIG_DRM_IVIP_OF=m
+CONFIG_FB=y
+CONFIG_FB_SIMPLE=y
+CONFIG_FRAMEBUFFER_CONSOLE=m
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC2=y
-- 
2.7.4
