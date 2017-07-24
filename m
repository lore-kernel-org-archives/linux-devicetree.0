From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 0/3] Allow to tune sampling time on STM32 ADC
Date: Mon, 24 Jul 2017 18:10:37 +0200
Message-ID: <1500912640-23927-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

STM32 ADC allows each channel to be sampled with a different sampling
time. This series fixes common clock rate and adds optional device
tree property, so minimum sampling time can be tuned. This is done via
device tree as it's tightly coupled with hardware (analog source).
---
Changes in v2:
- Better describe fix patch
- Use 'st,min-sample-time-nsecs' instead of 'min-sample-time'.
- Add a comment on of_property_read_u32_index() use.

Fabrice Gasnier (3):
  iio: adc: stm32: fix common clock rate
  dt-bindings: iio: adc: stm32: add optional st,min-sample-time-nsecs
  iio: adc: stm32: add optional st,min-sample-time-nsecs

 .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |   5 +
 drivers/iio/adc/stm32-adc-core.c                   |  10 +-
 drivers/iio/adc/stm32-adc.c                        | 140 ++++++++++++++++++++-
 3 files changed, 146 insertions(+), 9 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
