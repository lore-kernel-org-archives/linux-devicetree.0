From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 0/3] iio: adc: stm32: Add support for differential channels
Date: Wed, 25 Oct 2017 11:27:42 +0200
Message-ID: <1508923665-2274-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for differential channels that can be found on STM32H7 ADC:
- Introduce new DT property 'st,adc-diff-channels'.
- Slightly rework single-ended channels definition in stm32-adc driver.
- Add support for differential channels to stm32-adc driver.

---
Changes in v2:
- Add an example and a note in dt-bindings to better explain
 'st,adc-diff-channels' usage (based on Jonathan & Rob remarks).
- Update variable names in stm32_adc_chan_init_one() based on Jonathan remark.

Fabrice Gasnier (3):
  dt-bindings: iio: adc: stm32: add support for diff channels
  iio: adc: stm32: remove const channel names definition
  iio: adc: stm32: add support for differential channels

 .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |  24 +++
 drivers/iio/adc/stm32-adc.c                        | 181 +++++++++++++--------
 2 files changed, 137 insertions(+), 68 deletions(-)

-- 
1.9.1
