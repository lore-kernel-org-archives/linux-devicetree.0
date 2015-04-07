From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH V2 3/3] MIPS: pistachio: Enable USB PHY driver in defconfig
Date: Tue,  7 Apr 2015 15:04:18 -0700
Message-ID: <1428444258-25852-4-git-send-email-abrestic@chromium.org>
References: <1428444258-25852-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428444258-25852-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>
List-Id: devicetree@vger.kernel.org

Update pistachio_defconfig to enable Pistachio's USB PHY driver.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
New for v2.
---
 arch/mips/configs/pistachio_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/pistachio_defconfig b/arch/mips/configs/pistachio_defconfig
index f22e92e..1646cce 100644
--- a/arch/mips/configs/pistachio_defconfig
+++ b/arch/mips/configs/pistachio_defconfig
@@ -272,6 +272,7 @@ CONFIG_IIO=y
 CONFIG_CC10001_ADC=y
 CONFIG_PWM=y
 CONFIG_PWM_IMG=y
+CONFIG_PHY_PISTACHIO_USB=y
 CONFIG_ANDROID=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
-- 
2.2.0.rc0.207.ga3a616c
