From: Fei Wang <w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/8] Add Support for Hi6220 PMIC Hi6553 MFD Core and Regulator
Date: Wed, 30 Sep 2015 19:05:03 +0800
Message-ID: <1443611111-3196-1-git-send-email-w.f@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, william.wfei-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch sets add support for Hi6220 PMIC Hi655x MFD core and its regulator driver.
Current testing and support board is Hikey  which is one of Linaro 96boards.
It is an arm64 open source board. For more information about this board,
please access https://www.96boards.org.

This is hardware layout for access PMIC Hi655x from AP SoC Hi6220.
Between PMIC Hi655x and Hi6220, the physical signal channel is SSI.We can use memory-mapped I/O to communicate.

+----------------+             +-------------+
|                |             |             |
|    Hi6220      |   SSI bus   |   Hi655x    |
|                |-------------|             |
|                |(REGMAP_MMIO)|             |
+----------------+             +-------------+

This patchset are based on 4.3-rc1.

Fei Wang (8):
  dt-bindings: pmic: Document Hi655x pmic driver
  mfd: Hi655x: Add support for PMIC Hi655x MFD
  arm64: dts: add Hi655x pmic node
  regulator: Hi655x: Add support for Hi655x regulator
  arm64: dts: Add Hi655x regulator config node
  dt-bindings: mtcmos: Document Hi6220 mtcmos driver
  mtcmos: Hi6220: Add Hi6220 mtcmos regulator driver
  arm64: dts: Add Hi6220 mtcmos regulator node

 .../devicetree/bindings/mfd/hisilicon,hi655x.txt   |   80 +++
 .../bindings/regulator/hisilicon,hi6220-mtcmos.txt |   32 ++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |  275 +++++++++++
 drivers/mfd/Kconfig                                |    9 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/hi655x-pmic.c                          |  358 ++++++++++++++
 drivers/regulator/Kconfig                          |   16 +
 drivers/regulator/Makefile                         |    2 +
 drivers/regulator/hi6220-mtcmos.c                  |  281 +++++++++++
 drivers/regulator/hi655x-regulator.c               |  517 ++++++++++++++++++++
 include/linux/mfd/hi655x-pmic.h                    |   56 +++
 include/linux/regulator/hi655x-regulator.h         |   69 +++
 12 files changed, 1696 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/hisilicon,hi6220-mtcmos.txt
 create mode 100644 drivers/mfd/hi655x-pmic.c
 create mode 100644 drivers/regulator/hi6220-mtcmos.c
 create mode 100644 drivers/regulator/hi655x-regulator.c
 create mode 100644 include/linux/mfd/hi655x-pmic.h
 create mode 100644 include/linux/regulator/hi655x-regulator.h

-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
