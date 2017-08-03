From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 0/3] iio: trigger: stm32-timer: add STM32H7 variant
Date: Thu, 3 Aug 2017 11:14:11 +0200
Message-ID: <1501751654-14153-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

STM32H7 variant has additional timer instances, and slightly different
valid triggers.
This patchset introduces a new compatible for STM32H7 timers, to handle
this new variant, with appropriate configuration data.

Fabrice Gasnier (3):
  dt-bindings: iio: timer: stm32: add support for STM32H7
  iio: trigger: stm32-timer: add support for STM32H7
  iio: trigger: stm32-timer: add output compare triggers

 .../bindings/iio/timer/stm32-timer-trigger.txt     |  4 +-
 drivers/iio/trigger/stm32-timer-trigger.c          | 78 +++++++++++++++++++---
 include/linux/iio/timer/stm32-timer-trigger.h      | 14 ++++
 3 files changed, 84 insertions(+), 12 deletions(-)

-- 
1.9.1
