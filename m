From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v8 0/2] mfd: flexcom: add a driver for Flexcom
Date: Fri, 24 Jul 2015 12:01:49 +0200
Message-ID: <cover.1437731428.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

ChangeLog

v8:
- fix the name of the spi node in the DT example: from spi@f8034400 to
  spi@2,0
- use the return code of op_property_read_u32_index() instead of -EINVAL
  to report error.
- add Acked-by from Nicolas Ferre

v7:
- read the operating mode from the very first u32 of the reg property from
  the first available child node (should be unique).
- update the DT bindings documentation accordingly.

v6:
- select the operating mode according to the "compatible" DT property of
  the first available child node (should be unique).
- remove the "atmel,flexcom-mode" DT property so the need of a header file
  defining macros for the possible values of this deprecated property.

v5:
- create a header file containing macros used by DT bindings
- use numeric constants instead of strings to select the Flexcom mode
- change the license to "GPL v2"
- update the DT binding documentation to make it more readable and add
  references to USART, SPI and I2C DT binding documentations. remove the
  useless label in the Example section.
- change the register prefix from FX_ to FLEX_ to match the Flexcom
  programmer datasheet.
- rename some variables to make them more understandable.

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

Cyrille Pitchen (2):
  mfd: devicetree: add bindings for Atmel Flexcom
  mfd: atmel-flexcom: add a driver for Atmel Flexible Serial
    Communication Unit

 .../devicetree/bindings/mfd/atmel-flexcom.txt      |  68 +++++++++++++
 drivers/mfd/Kconfig                                |  11 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/atmel-flexcom.c                        | 113 +++++++++++++++++++++
 4 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
 create mode 100644 drivers/mfd/atmel-flexcom.c

-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
