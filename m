From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree fixes for 4.12
Date: Thu, 18 May 2017 21:04:11 -0500
Message-ID: <CAL_JsqJ_p91oBtRaZnJLAUrWXObdgwYaNob1+fgQbZiMDfbV8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull a few fixes for DT. Details below.

Rob


The following changes since commit 17a70355ea576843a7ac851f1db26872a50b2850:

  of: fix sparse warnings in fdt, irq, reserved mem, and resolver code
(2017-05-04 14:01:13 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
devicetree-fixes-for-4.12

for you to fetch changes up to 49e67dd17649b60b4d54966e18ec9c80198227f0:

  of: fdt: add missing allocation-failure check (2017-05-17 11:36:52 -0500)

----------------------------------------------------------------
DeviceTree fixes for 4.12-rc:

- Fix missing allocation failure handling in fdt code

- Fix dtc compile error on 32-bit hosts

- Revert bad sparse changes causing GCC7 warnings

----------------------------------------------------------------
Johan Hovold (1):
      of: fdt: add missing allocation-failure check

Rob Herring (1):
      Partially Revert "of: fix sparse warnings in fdt, irq, reserved
mem, and resolver code"

Shuah Khan (1):
      dtc: check.c fix compile error

 drivers/of/fdt.c             | 3 +++
 drivers/of/of_reserved_mem.c | 2 +-
 include/linux/of_irq.h       | 2 +-
 scripts/dtc/checks.c         | 2 +-
 4 files changed, 6 insertions(+), 3 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
