From: "Hean-Loong, Ong" <hean.loong.ong@intel.com>
Subject: [PATCH10 2/3] ARM:socfpga-defconfig Intel FPGA Video and Image Processing Suite
Date: Tue, 14 Aug 2018 16:57:08 +0800
Message-ID: <1534237029-2648-3-git-send-email-hean.loong.ong@intel.com>
References: <1534237029-2648-1-git-send-email-hean.loong.ong@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534237029-2648-1-git-send-email-hean.loong.ong@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, David Airlie <airlied@linux.ie>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, hean.loong.ong@intel.com, yves.vandervennet@intel.com, chin.liang.see@intel.com, Ong@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Ong Hean Loong <hean.loong.ong@intel.com>

Intel FPGA Video and Image Processing Suite Frame Buffer II
driver config for Arria 10 devkit and its variants

Signed-off-by: Ong, Hean Loong <hean.loong.ong@intel.com>
---
 arch/arm/configs/socfpga_defconfig |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index 371fca4..21d8d2b 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -112,6 +112,11 @@ CONFIG_MFD_ALTERA_A10SR=y
 CONFIG_MFD_STMPE=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_DRM=m
+CONFIG_DRM_IVIP=m
+CONFIG_DRM_IVIP_OF=m
+CONFIG_FB=y
+CONFIG_FB_SIMPLE=y
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC2=y
-- 
1.7.1
