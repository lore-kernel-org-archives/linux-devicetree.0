From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree fixes for 4.14
Date: Sun, 24 Sep 2017 17:31:14 -0500
Message-ID: <CAL_JsqLyeh_-NjnvxhHZhDQ+rAMrrtOXdbBqRo+RtErKK6JzVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull. Details below.

Rob


The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.14

for you to fetch changes up to 127b8e2692b6c145955bb71e482ca1bc6ce10027:

  dt-bindings: clk: stm32h7: fix clock-cell size (2017-09-21 18:39:11 -0500)

----------------------------------------------------------------
DeviceTree fixes for 4.14:

- Fix build for !OF providing empty of_find_device_by_node

- Fix Abracon vendor prefix

- Sync dtx_diff include paths (again)

- A stm32h7 clock binding doc fix

----------------------------------------------------------------
Alexandre Belloni (1):
      dt-bindings: fix vendor prefix for Abracon

Arnd Bergmann (1):
      of: provide inline helper for of_find_device_by_node

Frank Rowand (1):
      scripts/dtc: dtx_diff - 2nd update of include dts paths to match build

Gabriel Fernandez (1):
      dt-bindings: clk: stm32h7: fix clock-cell size

 .../devicetree/bindings/clock/st,stm32h7-rcc.txt   |  2 +-
 .../devicetree/bindings/vendor-prefixes.txt        |  2 +-
 include/linux/of_platform.h                        |  7 +++++++
 scripts/dtc/dtx_diff                               | 22 +++++++++-------------
 4 files changed, 18 insertions(+), 15 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
