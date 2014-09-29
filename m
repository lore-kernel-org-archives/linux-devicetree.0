From: zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 0/6] Add Spreadtrum Shark64 SoC support
Date: Mon, 29 Sep 2014 20:04:47 +0800
Message-ID: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "chunyan.zhang" <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "chunyan.zhang" <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>

Spreadtrum is a rapid growing chip vendor providing smart phone total solutions. 
Shark64 is nominated as a SoC infrastructure that supports 4G/3G/2G standards based on ARMv8 multiple core architecture.

This patchset adds shark64 supports in arm64 device tree and implements the basic earlycon serial driver.

chunyan.zhang (6):
  Documentation: DT: Add bindings for Spreadtrum serial
  arm64: Add DTS support for Spreadtrum's Shark64 SoC
  arm64: dts/Makefile: Add support for Spreadtrum's Shark64 SoC.
  arm64: Add support for Spreadtrum's Shark64 SoC in Kconfig and defconfig
  tty/serial: add Spreadtrum's serial earlycon
  Documentation: Add entry for Spreadtrum's Shark64 SoC

 Documentation/devicetree/bindings/arm/sprd.txt     |    6 ++
 .../devicetree/bindings/serial/of-serial.txt       |    1 +
 arch/arm64/Kconfig                                 |    5 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/sprd_shark64.dts               |  110 ++++++++++++++++++++
 arch/arm64/configs/defconfig                       |    1 +
 drivers/tty/serial/Kconfig                         |   12 +++
 drivers/tty/serial/Makefile                        |    1 +
 drivers/tty/serial/serial_sprd_early.c             |   64 ++++++++++++
 9 files changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/sprd.txt
 create mode 100644 arch/arm64/boot/dts/sprd_shark64.dts
 create mode 100644 drivers/tty/serial/serial_sprd_early.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
