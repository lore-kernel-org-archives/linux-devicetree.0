From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [RESEND PATCH v3 2/5] MAINTAINERS: add entry for Atmel SAMA5D2 ADC driver
Date: Fri, 15 Jan 2016 09:54:18 +0100
Message-ID: <1452848058-32068-1-git-send-email-ludovic.desroches@atmel.com>
References: <1452785897-16270-3-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452785897-16270-3-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---

I have forgotten to update this patch with the new name of the driver.

 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dac3be0..144422c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1951,6 +1951,12 @@ M:	Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
 S:	Supported
 F:	drivers/tty/serial/atmel_serial.c
 
+ATMEL SAMA5D2 ADC DRIVER
+M:	Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
+L:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+S:	Supported
+F:	drivers/iio/adc/at91-sama5d2_adc.c
+
 ATMEL Audio ALSA driver
 M:	Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
 L:	alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org (moderated for non-subscribers)
-- 
2.5.0
