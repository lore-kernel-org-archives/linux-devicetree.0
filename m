From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [RFC v4 2/8] gpio: rename gpio-generic.c into gpio-mmio.c
Date: Thu, 28 Apr 2016 11:05:12 +0200
Message-ID: <5d6d06726e8ed05aea6cae0aaa9166b10c408dd0.1461806071.git.chunkeey@googlemail.com>
References: <cover.1461806071.git.chunkeey@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1461806071.git.chunkeey@googlemail.com>
In-Reply-To: <cover.1461806071.git.chunkeey@googlemail.com>
References: <cover.1461806071.git.chunkeey@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Christian Lamparter <chunkeey@googlemail.com>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch renames the gpio-generic.c into gpio-mmio.c.
This is because currently the file only contains code
for a memory-mapped GPIO driver. There isn't any support
for ioports or other resource type.

Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/gpio/Makefile                        | 3 +++
 drivers/gpio/{gpio-generic.c => gpio-mmio.c} | 0
 2 files changed, 3 insertions(+)
 rename drivers/gpio/{gpio-generic.c => gpio-mmio.c} (100%)

diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 74eb1a7..991598e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -12,6 +12,9 @@ obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 # Device drivers. Generally keep list sorted alphabetically
 obj-$(CONFIG_GPIO_GENERIC)	+= gpio-generic.o
 
+# directly supported by gpio-generic
+gpio-generic-$(CONFIG_GPIO_GENERIC)	+= gpio-mmio.o
+
 obj-$(CONFIG_GPIO_104_DIO_48E)	+= gpio-104-dio-48e.o
 obj-$(CONFIG_GPIO_104_IDIO_16)	+= gpio-104-idio-16.o
 obj-$(CONFIG_GPIO_104_IDI_48)	+= gpio-104-idi-48.o
diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-mmio.c
similarity index 100%
rename from drivers/gpio/gpio-generic.c
rename to drivers/gpio/gpio-mmio.c
-- 
2.8.1
