From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 1/3] ARM: configs: stm32: enable ADC driver
Date: Fri, 2 Dec 2016 14:57:00 +0100
Message-ID: <1480687022-12851-2-git-send-email-fabrice.gasnier@st.com>
References: <1480687022-12851-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480687022-12851-1-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alexandre.torgue-qxv4g6HH51o@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

ADC driver depends on REGULATOR and IIO that are not yet selected.
Current hardware boards (like stm32f429i-eval) is using fixed
regulators.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/configs/stm32_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index a60b5cb..92ccc3c 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -49,6 +49,8 @@ CONFIG_SERIAL_STM32=y
 CONFIG_SERIAL_STM32_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
 # CONFIG_USB_SUPPORT is not set
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
@@ -57,6 +59,9 @@ CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_DMADEVICES=y
 CONFIG_STM32_DMA=y
+CONFIG_IIO=y
+CONFIG_STM32_ADC_CORE=y
+CONFIG_STM32_ADC=y
 # CONFIG_FILE_LOCKING is not set
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
