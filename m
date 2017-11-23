From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 6/6] ARM: configs: keystone_defconfig: Enable few peripheral drivers
Date: Thu, 23 Nov 2017 13:21:54 +0530
Message-ID: <20171123075154.3938-7-vigneshr@ti.com>
References: <20171123075154.3938-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171123075154.3938-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

Enable drivers for QSPI, LEDS, gpio-decoder that are present on 66AK2G EVM
and 66AK2G ICE boards.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 arch/arm/configs/keystone_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index f710c192b33a..2536c231eea1 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -228,3 +228,10 @@ CONFIG_CRYPTO_DES=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_USER_API_SKCIPHER=y
+CONFIG_SPI_CADENCE_QUADSPI=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_EVDEV=m
+CONFIG_INPUT_GPIO_DECODER=m
+CONFIG_GPIO_PCA953X=m
+CONFIG_LEDS_TRIGGER_ACTIVITY=y
+CONFIG_LEDS_TRIGGER_CPU=y
-- 
2.15.0
