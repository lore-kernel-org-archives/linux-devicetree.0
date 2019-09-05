From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 16/19] GPIO: loongson: Drop Loongson-3A/3B support
Date: Thu,  5 Sep 2019 22:43:13 +0800
Message-ID: <20190905144316.12527-17-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

GPIOs on Loongson-3A/B should never be touched by user,
it may damage hardware.
And nobody is using this driver in realworld.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/gpio/Kconfig         | 6 +++---
 drivers/gpio/gpio-loongson.c | 9 +--------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 6ed3f380a45e..95e75b2a5392 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -297,10 +297,10 @@ config GPIO_IXP4XX
 	  If unsure, say N.
 
 config GPIO_LOONGSON
-	bool "Loongson-2/3 GPIO support"
-	depends on CPU_LOONGSON2EF || CPU_LOONGSON64
+	bool "Loongson-2F GPIO support"
+	depends on CPU_LOONGSON2EF
 	help
-	  driver for GPIO functionality on Loongson-2F/3A/3B processors.
+	  driver for GPIO functionality on Loongson-2F processors.
 
 config GPIO_LPC18XX
 	tristate "NXP LPC18XX/43XX GPIO support"
diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index 7b72846a6dc7..1d65b9a3607a 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -19,14 +19,7 @@
 #include <asm/types.h>
 #include <loongson2ef.h>
 
-#define STLS2F_N_GPIO		4
-#define STLS3A_N_GPIO		16
-
-#ifdef CONFIG_CPU_LOONGSON64
-#define LOONGSON_N_GPIO	STLS3A_N_GPIO
-#else
-#define LOONGSON_N_GPIO	STLS2F_N_GPIO
-#endif
+#define LOONGSON_N_GPIO	4
 
 /*
  * Offset into the register where we read lines, we write them from offset 0.
-- 
2.22.0
