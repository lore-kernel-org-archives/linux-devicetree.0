From: Chen Gang <xili_gchen_5257@hotmail.com>
Subject: [PATCH] of: Kconfig: Let OF_UNITTEST depend on "I2C=y" and "I2C_MUX=y"
Date: Wed, 4 Mar 2015 14:37:51 +0800
Message-ID: <BLU437-SMTP82811F6F904D6C74EE62E3B91E0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

They need several symbols which are in I2C and I2C_MUX, the related
error:

  drivers/built-in.o: In function `selftest_i2c_mux_remove':
  unittest.c:(.text+0xb0ce4): undefined reference to `i2c_del_mux_adapter'
  unittest.c:(.text+0xb0ce8): undefined reference to `i2c_del_mux_adapter'
  drivers/built-in.o: In function `selftest_i2c_mux_probe':
  unittest.c:(.text+0xb0f20): undefined reference to `i2c_add_mux_adapter'
  unittest.c:(.text+0xb0f24): undefined reference to `i2c_add_mux_adapter'
  unittest.c:(.text+0xb0f94): undefined reference to `i2c_del_mux_adapter'
  unittest.c:(.text+0xb0f9c): undefined reference to `i2c_del_mux_adapter'
  drivers/built-in.o: In function `selftest_i2c_bus_remove':
  unittest.c:(.text+0xb10cc): undefined reference to `i2c_del_adapter'
  unittest.c:(.text+0xb10d4): undefined reference to `i2c_del_adapter'
  drivers/built-in.o: In function `selftest_i2c_bus_probe':
  unittest.c:(.text+0xb1298): undefined reference to `i2c_add_numbered_adapter'
  unittest.c:(.text+0xb12a0): undefined reference to `i2c_add_numbered_adapter'
  drivers/built-in.o: In function `of_selftest_overlay':
  unittest.c:(.init.text+0xc9d0): undefined reference to `i2c_register_driver'
  unittest.c:(.init.text+0xc9dc): undefined reference to `i2c_register_driver'
  unittest.c:(.init.text+0xcdb4): undefined reference to `i2c_del_driver'
  unittest.c:(.init.text+0xcdb8): undefined reference to `i2c_del_driver'
  drivers/built-in.o: In function `of_selftest_device_exists':
  unittest.c:(.text.unlikely+0xd70): undefined reference to `of_find_i2c_device_by_node'
  unittest.c:(.text.unlikely+0xd7c): undefined reference to `of_find_i2c_device_by_node'
  make: *** [vmlinux] Error 1

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 drivers/of/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 7bcaeec..b60fc66 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -9,7 +9,7 @@ menu "Device Tree and Open Firmware support"
 
 config OF_UNITTEST
 	bool "Device Tree runtime unit tests"
-	depends on OF_IRQ && OF_EARLY_FLATTREE
+	depends on OF_IRQ && OF_EARLY_FLATTREE && I2C=y && I2C_MUX=y
 	select OF_RESOLVE
 	help
 	  This option builds in test cases for the device tree infrastructure
-- 
1.9.3
