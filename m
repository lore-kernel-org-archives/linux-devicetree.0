From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree fixes for 4.4
Date: Wed, 11 Nov 2015 14:51:24 -0600
Message-ID: <CAL_Jsq+r6TEe8TXVddt3dAVeU9bNBbeahm3zAMkKKgH8GAqGpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull. Details below.

Rob


The following changes since commit 2d799dde8e69494e0234b8ecd5ce95cd06224329:

  MAINTAINERS: update DT binding doc locations (2015-11-05 13:40:40 -0600)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.4

for you to fetch changes up to b1d06b60e90cd5016798b9984f8e420e753f4846:

  of: Provide static inline function for of_translate_address if
needed (2015-11-10 17:27:12 -0600)

----------------------------------------------------------------
DeviceTree fixes for 4.4-rc1:

- Add empty of_translate_address needed for HiSilicon network driver.

- Fix alignment requirements for CMA regions in DT.

- Fix booting on PPC systems which can't do WARN() early.

- Rename ak4554 binding doc from .c to .txt.

----------------------------------------------------------------
Guenter Roeck (1):
      of: Provide static inline function for of_translate_address if needed

Jason Liu (1):
      drivers: of: of_reserved_mem: fixup the alignment with CMA setup

Michael Ellerman (1):
      of: Print rather than WARN'ing when overlap check fails

Raphael Poggi (1):
      dt-bindings: ak4554: extension should be .txt

 .../devicetree/bindings/sound/{ak4554.c => ak4554.txt}        |  0
 drivers/of/of_reserved_mem.c                                  | 11 +++++++----
 include/linux/of.h                                            |  4 ++--
 include/linux/of_address.h                                    |  7 +++++++
 4 files changed, 16 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/sound/{ak4554.c => ak4554.txt} (100%)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
