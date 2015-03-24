From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v4 0/3] iio: adc: vf610: respect ADC clocking limitations
Date: Tue, 24 Mar 2015 13:47:46 +0100
Message-ID: <1427201269-4902-1-git-send-email-stefan@agner.ch>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org, maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Respect ADC clocking limitations which lead to bogous reading on
500MHz clocked Vybrid SoC's. Additionally, also implement a
sysfs-property to configure the conversion mode available in this
ADC peripherial.

The clock limitations are specified using the device tree, hence
I seek an Ack from the device tree maintainers here...

Changes since v3:
- Move device tree bindings to driver changes

Changes since v2:
- Add sysfs ABI documentation
- Fix commit message spelling errors

Changes since v1:
- Use ext_info for conversion mode


Stefan Agner (3):
  iio: adc: vf610: use ADC clock within specification
  iio: adc: vf610: implement configurable conversion modes
  ARM: dts: add property for maximum ADC clock frequencies

 Documentation/ABI/testing/sysfs-bus-iio-vf610      |   7 +
 .../devicetree/bindings/iio/adc/vf610-adc.txt      |   9 +
 arch/arm/boot/dts/vfxxx.dtsi                       |   4 +
 drivers/iio/adc/vf610_adc.c                        | 225 +++++++++++++++------
 4 files changed, 179 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-vf610

-- 
2.3.3
