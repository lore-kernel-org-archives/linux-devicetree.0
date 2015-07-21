From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 0/3] mfd: flexcom: add a driver for Flexcom
Date: Tue, 21 Jul 2015 16:21:35 +0200
Message-ID: <cover.1437483537.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

ChangeLog

v5:
- create a header file containing macros used by DT bindings
- use numeric constants instead of strings to select the Flexcom mode
- change the license to "GPL v2"
- update the DT binding documentation to make it more readable and add
  references to USART, SPI and I2C DT binding documentations. remove the
  useless label in the Example section.
- change the register prefix from FX_ to FLEX_ to match the Flexcom
  programmer datasheet.
- rename some variables to make them more comprehensive.

v4:
- check clk_prepare_enable() return code in atmel_flexcom_probe()
- add a commit message to the DT binding patch

v3:
- remove MODULE_ALIAS()
- add Acked-by from Boris Brezillon and Alexandre Belloni

v2:
- enhance the documentation of DT bindings and change the way the "ranges"
  property is used.
- replace __raw_readl() and __raw_writel() by readl() and writel().
- change the module license to "GPL" for v2 or later
- print the selected flexcom mode after the hardware version

v1:
This series of patches a support to the Atmel Flexcom, a wrapper which
integrates an USART, a SPI controller and a TWI controller. Only one
peripheral can be used at a time. The active function is selected though
the Flexcom Mode Register.

Cyrille Pitchen (3):
  mfd: atmel-flexcom: create include file with macros used by DT
    bindings
  mfd: devicetree: add bindings for Atmel Flexcom
  mfd: atmel-flexcom: add a driver for Atmel Flexible Serial
    Communication Unit

 .../devicetree/bindings/mfd/atmel-flexcom.txt      |  67 +++++++++++++
 drivers/mfd/Kconfig                                |  11 +++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/atmel-flexcom.c                        | 104 +++++++++++++++++++++
 include/dt-bindings/mfd/atmel-flexcom.h            |  16 ++++
 5 files changed, 199 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
 create mode 100644 drivers/mfd/atmel-flexcom.c
 create mode 100644 include/dt-bindings/mfd/atmel-flexcom.h

-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
