From: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 0/3] *** iio:adc:imx: Add Freescale vf610 ADC driver support ***
Date: Tue, 26 Nov 2013 18:56:31 +0800
Message-ID: <1385463394-11157-1-git-send-email-B38611@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, b20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch set is to enable Vybrid VF610 ADC driver.

Please see the Reference Manual of the ADC:
http://cache.freescale.com/files/32bit/doc/ref_manual/VYBRIDRM.pdf?fpsp=1&WT_TYPE=
Reference%20Manuals&WT_VENDOR=FREESCALE&WT_FILE_FORMAT=pdf&WT_ASSET=Documentation

*** Change ***
* V3: (review by Shawn Guo)
- DTS properties: use prefix "fsl," instead of "vf610".
- Drop DTS unnessary comments, and add "vref" optional propert comments.
- Modify driver format.
- Remove driver debug code.
- Remove the of_device_id .data init.
- Remove unnecessary device node check.
- Add clk_prepare_enable() return check.

* V2: (Simply review by Jonathan Cameron)
- Rename the driver after "vf610_adc".

* V1:
Feature:
- Enable Vybrid vf610 board ADC0 in dts file.
- ADC driver only support software trigger for the init version.
- ADC configuration support dts set.
Note: Since the ADC IP is used for Freescale Vybrid VF610, i.MX6SLX, i.MX7 serial sillicons.

Fugang Duan (3):
  ARM: dts: vf610-twr: Add ADC support
  iio:adc:imx: add Freescale Vybrid vf610 adc driver
  Documentation: add the binding file for Freescale vf610 ADC driver

 .../devicetree/bindings/iio/adc/vf610-adc.txt      |   57 ++
 arch/arm/boot/dts/vf610-twr.dts                    |   14 +
 arch/arm/boot/dts/vf610.dtsi                       |   26 +
 drivers/iio/adc/Kconfig                            |   11 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/vf610_adc.c                        |  744 ++++++++++++++++++++
 6 files changed, 853 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
 create mode 100644 drivers/iio/adc/vf610_adc.c

-- 
1.7.2.rc3
