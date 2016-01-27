From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 3/3] dts: hikey: Add hikey support for sram-reboot-mode
Date: Tue, 26 Jan 2016 16:38:00 -0800
Message-ID: <1453855080-17760-4-git-send-email-john.stultz@linaro.org>
References: <1453855080-17760-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453855080-17760-1-git-send-email-john.stultz@linaro.org>
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
Cc: Heiko St=C3=BCbner <heiko@sntech.de>
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
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 36 ++++++++++++++++++=
++++++++
 arch/arm64/configs/hikey_defconfig             |  3 +++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm6=
4/boot/dts/hisilicon/hi6220-hikey.dts
index 92f1704..67d12d0 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -52,6 +52,11 @@
 			      <0x0 0x0740f000 0x0 0x00001000>;	/* MCU firmware section */
 		};
=20
+		reboot-reason@05f01000 {
+			no-map;
+			reg =3D <0x0 0x05f01000 0x0 0x00001000>;
+		};
+
 		mbox-buf@06dff000 {
 			no-map;
 			reg =3D <0x0 0x06dff000 0x0 0x00001000>;	/* Mailbox message buf */
@@ -71,6 +76,37 @@
 		ftrace-size	=3D <0x0 0x00020000>;
 	};
=20
+
+	/* This entry should really be provided by the UEFI firmware */
+	sram@5f01000 {
+		compatible =3D "mmio-sram", "simple-bus";
+		reg =3D <0x0 0x05f01000 0x0 0x00001000>;
+		ranges =3D <0x0 0x0 0x05f01000 0x00001000>;
+
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+
+		reboot-mode@0 {
+			compatible =3D "sram-reboot-mode";
+			reg =3D <0x0 0x4>;
+
+			none {
+				linux,mode =3D "none";
+				loader,magic =3D <0x77665501>;
+			};
+
+			bootloader {
+				linux,mode =3D "bootloader";
+				loader,magic =3D <0x77665500>;
+			};
+
+			recovery {
+				linux,mode =3D "recovery";
+				loader,magic =3D <0x77665502>;
+			};
+		};
+	};
+
 	smb {
 		uart0: uart@f8015000 {	/* console */
 			status =3D "ok";
diff --git a/arch/arm64/configs/hikey_defconfig b/arch/arm64/configs/hi=
key_defconfig
index a8375aa..e9db588 100644
--- a/arch/arm64/configs/hikey_defconfig
+++ b/arch/arm64/configs/hikey_defconfig
@@ -201,6 +201,7 @@ CONFIG_BLK_DEV_LOOP=3Dy
 CONFIG_BLK_DEV_RAM=3Dy
 CONFIG_BLK_DEV_RAM_SIZE=3D16384
 CONFIG_VIRTIO_BLK=3Dy
+CONFIG_SRAM=3Dy
 CONFIG_TI_ST=3Dy
 CONFIG_ST_HCI=3Dy
 # CONFIG_SCSI_PROC_FS is not set
@@ -266,6 +267,8 @@ CONFIG_SPI_PL022=3Dy
 CONFIG_GPIO_SYSFS=3Dy
 CONFIG_GPIO_XGENE=3Dy
 CONFIG_POWER_RESET_SYSCON=3Dy
+CONFIG_SYSCON_REBOOT_MODE=3Dy
+CONFIG_SRAM_REBOOT_MODE=3Dy
 CONFIG_THERMAL=3Dy
 CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
 CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR=3Dy
--=20
1.9.1
