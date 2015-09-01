From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree for 4.3
Date: Tue, 1 Sep 2015 16:20:13 -0500
Message-ID: <CAL_JsqLCzSXMxV3QyFRWcnvksjZNZeNETtht6qY62vcHMzHHSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull. A small set of changes this cycle even by DT standards.
However, there is a significant change here with Grant stepping down
as maintainer. His contributions as maintainer have been invaluable to
the kernel community, and I thank him for that as well as his guidance
over the years.

Rob


The following changes since commit cbfe8fa6cd672011c755c3cd85c9ffd4e2d10a6f:

  Linux 4.2-rc4 (2015-07-26 12:26:21 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.3

for you to fetch changes up to c8fb70a3e8dd60e31c4422bae85783cf1733f038:

  MAINTAINERS: Add Frank Rowand as DT maintainer (2015-09-01 08:18:12 -0500)

----------------------------------------------------------------
DeviceTree updates for 4.3:
- Adding Frank Rowand as DT maintainer in preparation for Grant's
  retirement.
- Generic MSI binding documentation and a few other minor doc updates
- Fix long standing issue with DT platorm device unregistration
- Fix loop forever bug in of_find_matching_node_by_address()

----------------------------------------------------------------
David Daney (1):
      of/address: Don't loop forever in of_find_matching_node_by_address().

Geert Uytterhoeven (1):
      of: Add vendor prefix for JEDEC Solid State Technology Association

Grant Likely (2):
      drivercore: Fix unregistration path of platform devices
      MAINTAINERS: Add Frank Rowand as DT maintainer

Hauke Mehrtens (1):
      of/platform: add function to populate default bus

Mark Rutland (1):
      Docs: dt: add generic MSI bindings

Mugunthan V N (1):
      Documentation: DT: cpsw: document missing compatible

Robert Jarzmik (1):
      mtd: nand: pxa3xx: add optional dma for pxa architecture

Thierry Reding (1):
      of: Add vendor prefix for Sharp Corporation

 .../bindings/interrupt-controller/msi.txt          | 135 +++++++++++++++++++++
 .../devicetree/bindings/mtd/pxa3xx-nand.txt        |   3 +
 Documentation/devicetree/bindings/net/cpsw.txt     |   6 +-
 .../devicetree/bindings/vendor-prefixes.txt        |   2 +
 MAINTAINERS                                        |   3 +-
 drivers/base/platform.c                            |   8 +-
 drivers/of/address.c                               |   6 +-
 drivers/of/platform.c                              |   9 ++
 include/linux/of_platform.h                        |   9 ++
 9 files changed, 170 insertions(+), 11 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/interrupt-controller/msi.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
