Return-Path: <SRS0=qowN=HZ=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/6] ARM: meson: add support for the Meson8m2 SoCs
Date: Sun,  6 May 2018 11:21:16 +0200
Message-Id: <20180506092119.467-4-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180506092119.467-1-martin.blumenstingl@googlemail.com>
References: <20180506092119.467-1-martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com, carlo@caione.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: balbes-150@yandex.ru, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

Add a new Kconfig entry as well as the newly introduced compatible
string for the Meson8m2 SoC.
The Kconfig entry selects the same drivers as Meson8b because Meson8m2
SoC is mostly compatible with Meson8 (both share the same pinctrl
driver, so they also share the same GPIO IRQ settings. also the same
Meson6 timer is used on Meson8m2).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/mach-meson/Kconfig | 7 +++++++
 arch/arm/mach-meson/meson.c | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index d90f61e6254f..44a489889bc1 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -32,4 +32,11 @@ config MACH_MESON8B
 	select COMMON_CLK_MESON8B
 	select MESON_IRQ_GPIO
 
+config MACH_MESON8M2
+	bool "Amlogic Meson8m2 SoCs support"
+	default ARCH_MESON
+	select MESON6_TIMER
+	select COMMON_CLK_MESON8B
+	select MESON_IRQ_GPIO
+
 endif
diff --git a/arch/arm/mach-meson/meson.c b/arch/arm/mach-meson/meson.c
index 4e2357178625..c8d99df32f9b 100644
--- a/arch/arm/mach-meson/meson.c
+++ b/arch/arm/mach-meson/meson.c
@@ -20,6 +20,7 @@ static const char * const meson_common_board_compat[] = {
 	"amlogic,meson6",
 	"amlogic,meson8",
 	"amlogic,meson8b",
+	"amlogic,meson8m2",
 	NULL,
 };
 
-- 
2.17.0
