From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 0/4] Add STM32H7 DAC driver
Date: Fri, 31 Mar 2017 13:45:03 +0200
Message-ID: <1490960707-22422-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amelie.delaunay-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the STM32H7 DAC controller

It's a 12-bit, voltage output digital-to-analog converter. It has two
output channels, each with its own converter, trigger sources and
waveform generator.

Each channel can be used independently, so common resources are managed
in stm32-dac-core driver (e.g. clock, reset, regulator, registers).
One IIO device is instantiated per DAC output channel, in stm32-dac
driver, so each channel can have its own trigger.

Please find bellow basic examples, using this driver to:
- generate DC voltage output on channel1
- generate a triangle waveform on channel2

# set max DC voltage / enable / min DC voltage / disable on out1:
cd /sys/bus/iio/devices/iio\:device0
echo 4095 > out_voltage1_raw 
echo 1 > out_voltage1_en
echo 0 > out_voltage1_raw
echo 0 > out_voltage1_en

# configure timer trigger, and set triangle waveform with max
# amplitude on out2:
cd /sys/bus/iio/devices/trigger9
cat name
tim2_trgo
echo 10000 > sampling_frequency

cd /sys/bus/iio/devices/iio\:device1
echo triangle > wave
echo 11 > mamp
echo tim2_trgo > trigger/current_trigger
echo 1 > out_voltage2_en

Fabrice Gasnier (4):
  dt-bindings: iio: stm32-dac: Add support for STM32 DAC
  iio: dac: add support for stm32 DAC
  iio: dac: stm32: add support for trigger events
  iio: dac: stm32: add support for waveform generator

 Documentation/ABI/testing/sysfs-bus-iio-dac-stm32  |  32 ++
 .../devicetree/bindings/iio/dac/st,stm32-dac.txt   |  56 +++
 drivers/iio/dac/Kconfig                            |  18 +
 drivers/iio/dac/Makefile                           |   2 +
 drivers/iio/dac/stm32-dac-core.c                   | 180 +++++++
 drivers/iio/dac/stm32-dac-core.h                   |  63 +++
 drivers/iio/dac/stm32-dac.c                        | 538 +++++++++++++++++++++
 7 files changed, 889 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-dac-stm32
 create mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
 create mode 100644 drivers/iio/dac/stm32-dac-core.c
 create mode 100644 drivers/iio/dac/stm32-dac-core.h
 create mode 100644 drivers/iio/dac/stm32-dac.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
