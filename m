From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH-v2 0/5] clk: 88pm800: Add new clk provider driver for 88PM800 MFD
Date: Tue, 25 Aug 2015 00:26:28 +0530
Message-ID: <1440442594-3102-1-git-send-email-vaibhav.hiremath@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

88PM800 family of devices provides multiple buffered 32.768 KHz clock
output.
88PM800 : CLK32k_1, CLK32k_2 and CLK32k_3
88PM860 : CLK32k_1 and CLK32k_2

This patch-series adds new clock provider driver for enabling/disabling
buffered 32Khz clock output from 88PM800 family of device. Adds clock device to
MFD and updates the binding documentation.

The PATCH [1/4], created separately, as it would be easy between maintainers to
queue it.


Note that, I have access to only 88PM800 and 88PM860 datasheet,
so enabling support for only above two devices.

Testing:
  - Boot tested on 88PM860 based platform
  - Clock enable/disable
  - Non PM860, to make sure that it won't lead to any issues

V1 => V2:
========
Link to  V1: https://lkml.org/lkml/2015/7/21/298

  - Added new patch to the series [1/5], fixing tabbing issue in the file
  - Removed unnecessary brackets around macro value
  - Used devm_kcalloc variants for array allocation instead of kzalloc.
  - Fixed all other trivial issues.

Vaibhav Hiremath (5):
  mfd: 88pm800: Fix tabbing issue
  mfd: 88pm800: Update the header file with 32K clk related macros
  mfd: devicetree: bindings: Add clock subdevice node information
  clk: 88pm800: Add clk provider driver for 88pm800 family of devices
  mfd: 88pm800: Add support for clk subdevice

 Documentation/devicetree/bindings/mfd/88pm800.txt |  27 ++
 drivers/clk/Kconfig                               |   8 +
 drivers/clk/Makefile                              |   1 +
 drivers/clk/clk-88pm800.c                         | 341 ++++++++++++++++++++++
 drivers/mfd/88pm800.c                             | 150 ++++++----
 include/linux/mfd/88pm80x.h                       |  12 +
 6 files changed, 475 insertions(+), 64 deletions(-)
 create mode 100644 drivers/clk/clk-88pm800.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
