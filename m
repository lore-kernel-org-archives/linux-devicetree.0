From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] Devicetree fixes for 4.7
Date: Sat, 11 Jun 2016 11:06:04 -0500
Message-ID: <CAL_Jsq+yGBq6f6Xaq6p3gCzGXJUdrtuM2woiyeEsHSd4Jr+iRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DT fixes for 4.7. Details below.

Rob

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.7

for you to fetch changes up to 06dfeef88573cf032e5c27e37f80ff5237b3318a:

  drivers: of: add definition of
early_init_dt_alloc_reserved_memory_arch (2016-06-09 14:38:22 -0500)

----------------------------------------------------------------
DeviceTree fixes for 4.7-rc:

- Fix unflatten_dt_nodes when dad parameter is set.

- Add vendor prefixes for TechNexion and UniWest

- Documentation fix for Marvell BT

- OF IRQ kerneldoc fixes

- Restrict CMA alignment adjustments to non dma-coherent

- Couple of warning fixes in reserved-memory code

- DT maintainers updates

----------------------------------------------------------------
Ben Dooks (1):
      drivers: of: add definition of early_init_dt_alloc_reserved_memory_arch

Fabio Estevam (1):
      dt-bindings: Add vendor prefix for TechNexion

Gavin Shan (1):
      drivers/of: Fix depth for sub-tree blob in unflatten_dt_nodes()

Jaewon (1):
      drivers: of: of_reserved_mem: fixup the CMA alignment not to
affect dma-coherent

Joshua Clayton (1):
      of: add vendor prefix for UniWest

Kuninori Morimoto (1):
      of: add missing const for of_parse_phandle_with_args() in !CONFIG_OF

Rob Herring (1):
      MAINTAINERS: DeviceTree maintainer updates

Robin Murphy (1):
      drivers: of: Fix of_pci.h header guard

Sergei Shtylyov (1):
      of: irq: fix of_irq_get[_byname]() kernel-doc

Stephen Rothwell (1):
      of: silence warnings due to max() usage

Wei-Ning Huang (1):
      dt: bindings: fix documentation for MARVELL's bt-sd8xxx wireless device

 .../devicetree/bindings/net/marvell-bt-sd8xxx.txt     |  8 ++++----
 Documentation/devicetree/bindings/vendor-prefixes.txt |  2 ++
 MAINTAINERS                                           |  7 ++-----
 drivers/of/fdt.c                                      | 15 +++++++++++++--
 drivers/of/irq.c                                      | 19 ++++++++++---------
 drivers/of/of_reserved_mem.c                          | 11 +++++++++--
 include/linux/of.h                                    |  2 +-
 include/linux/of_pci.h                                |  2 +-
 include/linux/of_reserved_mem.h                       |  7 +++++++
 9 files changed, 49 insertions(+), 24 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
