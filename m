From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 4/4] dts: hikey: Add hikey support for sram-reboot-mode
Date: Wed,  3 Aug 2016 16:05:23 -0700
Message-ID: <1470265523-27557-5-git-send-email-john.stultz@linaro.org>
References: <1470265523-27557-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470265523-27557-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Kees Cook <keescook@chromium.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

Add support to hikey dts and defconfig for the
sram-reboot-mode driver.

The dts entries added here should really be generated
by the UEFI firmware, and not be static in the dts,
since one may be using different firmware on HiKey.
But this patch provides an example of how the
sram-reboot-mode entry would otherwise look.

Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Heiko Stübner <heiko@sntech.de>
Cc: Caesar Wang <wxt@rock-chips.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Guodong Xu <guodong.xu@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Vishal Bhoj <vishal.bhoj@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: devicetree@vger.kernel.org
Cc: Android Kernel Team <kernel-team@android.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 593c7e4..62326ab 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -29,6 +29,7 @@
 	 * Reserve below regions from memory node:
 	 *
 	 *  0x05e0,0000 - 0x05ef,ffff: MCU firmware runtime using
+	 *  0x05f0,1000 - 0x05f0,1fff: Reboot reason
 	 *  0x06df,f000 - 0x06df,ffff: Mailbox message data
 	 *  0x0740,f000 - 0x0740,ffff: MCU firmware section
 	 *  0x3e00,0000 - 0x3fff,ffff: OP-TEE
@@ -36,11 +37,30 @@
 	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x00000000 0x00000000 0x05e00000>,
-		      <0x00000000 0x05f00000 0x00000000 0x00eff000>,
+		      <0x00000000 0x05f00000 0x00000000 0x00001000>,
+		      <0x00000000 0x05f02000 0x00000000 0x00efd000>,
 		      <0x00000000 0x06e00000 0x00000000 0x0060f000>,
 		      <0x00000000 0x07410000 0x00000000 0x36bf0000>;
 	};
 
+	sram@5f01000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x05f01000 0x0 0x00001000>;
+		ranges = <0x0 0x0 0x05f01000 0x00001000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		reboot-mode@0 {
+			compatible = "sram-reboot-mode";
+			reg = <0x0 0x4>;
+
+			mode-normal	= <0x77665501>;
+			mode-bootloader	= <0x77665500>;
+			mode-recovery	= <0x77665502>;
+		};
+	};
+
 	soc {
 		spi0: spi@f7106000 {
 			status = "ok";
-- 
1.9.1
