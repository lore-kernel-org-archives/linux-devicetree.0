From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH RFC 0/3] coresight: enable debug module
Date: Mon, 13 Feb 2017 14:11:35 +0800
Message-ID: <1486966298-16767-1-git-send-email-leo.yan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series is to enable coresight debug module. With debug
module we can check CPU state and PC value, etc. So this is helpful for
CPU lockup bugs, e.g. if one CPU has run into infinite loop with IRQ
disabled. The hang CPU cannot switch context and handle any interrupt,
so it cannot handle SMP call for stack dump, etc.

Furthermore, now ARMv8 introduces some runtime firmwares like ARM
trusted firmware BL31, so sometime CPU lockup may happen in the
firmware and cannot return back to kernel.

This initial patch series enable debug module and registers call back
notifier for PCSR register dumping when panic happens, so we can see
below dumping info for panic:

[   13.751777] Coresight debug module:
[   13.755275] CPU[0]: PSCR=0xffff000008090cbc
[   13.759469] CPU[1]: PSCR=0xffff0000088bf9e4
[   13.763662] CPU[2]: PSCR=0xffff000008090cc0
[   13.767856] CPU[3]: PSCR=0xffff000008090cb8
[   13.772049] CPU[4]: PSCR=0xffff000008090cc0
[   13.776243] CPU[5]: PSCR=0xffff000008090cbc
[   13.780436] CPU[6]: PSCR=0xffff000008090cc0
[   13.784630] CPU[7]: PSCR=0xffff000008090cbc

This patch series has been verified on 96boards Hikey.


Leo Yan (3):
  coresight: binding for coresight debug driver
  coresight: add support for debug module
  arm64: dts: register Hi6220's coresight debug module

 .../devicetree/bindings/arm/coresight.txt          |   9 +-
 .../boot/dts/hisilicon/hikey_6220_coresight.dtsi   |  73 +++++++++
 drivers/hwtracing/coresight/Kconfig                |   8 +
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-debug.c      | 169 +++++++++++++++++++++
 5 files changed, 258 insertions(+), 2 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-debug.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
