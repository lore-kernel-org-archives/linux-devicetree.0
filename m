From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] Devicetree fixes for 3.12
Date: Tue, 24 Sep 2013 21:53:53 -0500
Message-ID: <52425041.6030609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull these 3 DT fixes for 3.12.

Rob

The following changes since commit 4a10c2ac2f368583138b774ca41fac4207911983:

  Linux 3.12-rc2 (2013-09-23 15:41:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git

for you to fetch changes up to 53126a2f679382f3eac370a012290f19c672f088:

  dts: Fix misspelling of Synopsys (2013-09-24 21:13:38 -0500)

----------------------------------------------------------------
DeviceTree fixes for 3.12

Clean-up to fix some warnings for !OF builds and spelling fixes in docs

- Clean-up openrisc prom.h
- Fix warnings caused by of_irq.h ifdefs
- Spelling fix for Synopsys

----------------------------------------------------------------
Dinh Nguyen (1):
      dts: Fix misspelling of Synopsys

Rob Herring (2):
      openrisc: clean-up prom.h
      of: clean-up ifdefs in of_irq.h

 .../devicetree/bindings/mmc/exynos-dw-mshc.txt     | 10 ++---
 .../devicetree/bindings/mmc/rockchip-dw-mshc.txt   | 10 ++---
 .../{synopsis-dw-mshc.txt => synopsys-dw-mshc.txt} |  8 ++--
 .../devicetree/bindings/pci/designware-pcie.txt    |  2 +-
 arch/openrisc/include/asm/prom.h                   | 44
----------------------
 include/linux/of_irq.h                             | 20 ++++------
 6 files changed, 23 insertions(+), 71 deletions(-)
 rename Documentation/devicetree/bindings/mmc/{synopsis-dw-mshc.txt =>
synopsys-dw-mshc.txt} (93%)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
