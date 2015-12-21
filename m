From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH 5/5] ARM: at91/defconfig: add sama5d2 adc support in sama5_defconfig
Date: Mon, 21 Dec 2015 10:24:12 +0100
Message-ID: <1450689852-22763-6-git-send-email-ludovic.desroches@atmel.com>
References: <1450689852-22763-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450689852-22763-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org, Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 arch/arm/configs/sama5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index c11bab7..afbda41 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -187,6 +187,7 @@ CONFIG_AT_XDMAC=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
 CONFIG_AT91_ADC=y
+CONFIG_AT91_SAMA5D2_ADC=y
 CONFIG_PWM=y
 CONFIG_PWM_ATMEL=y
 CONFIG_PWM_ATMEL_TCB=y
-- 
2.5.0
