From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 1/2] MIPS: Ci20: Enable SPI/GPIO driver
Date: Wed,  6 Jun 2018 21:37:29 +0200
Message-ID: <20180606193730.15087-1-malat@debian.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <jhogan@kernel.org>
Cc: Mathieu Malaterre <malat@debian.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update the Ci20's defconfig to enable the JZ4780's SPI/GPIO driver.

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 0ddef6ad2652..0c08c7675b42 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -93,6 +93,8 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 CONFIG_I2C_JZ4780=y
+CONFIG_SPI=y
+CONFIG_SPI_GPIO=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_INGENIC=y
 # CONFIG_HWMON is not set
-- 
2.11.0
