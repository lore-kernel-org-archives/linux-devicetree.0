From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree fixes for 4.4
Date: Wed, 9 Dec 2015 15:01:13 -0600
Message-ID: <CAL_Jsq+ZcJth9YedqswMZaLFtSidOVEWawO8MhMefhr38sJCjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DT fixes for 4.4. I think this should be all for 4.4.

Rob

The following changes since commit 31ade3b83e1821da5fbb2f11b5b3d4ab2ec39db8:

  Linux 4.4-rc3 (2015-11-29 18:58:26 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.4-rc4

for you to fetch changes up to eaddb5725357e9f05ffe5d271630f8197d089da4:

  of/irq: move of_msi_map_rid declaration to the correct ifdef section
(2015-12-09 09:23:28 -0600)

----------------------------------------------------------------
DeviceTree fixes for 4.4-rc4:

- Fix incorrect warning about overlapping memory regions

- Export of_irq_find_parent again which was made static in 4.4, but has
  users pending for 4.5.

- Fix of_msi_map_rid declaration location

- Fix re-entrancy for of_fdt_unflatten_tree

- Clean-up of phys_addr_t printks

----------------------------------------------------------------
Carlo Caione (1):
      of/irq: Export of_irq_find_parent again

Dmitry V. Krivenok (1):
      of: do not use 0x in front of %pa

Guenter Roeck (1):
      of/fdt: Add mutex protection for calls to __unflatten_device_tree()

Masahiro Yamada (1):
      of/address: fix typo in comment block of of_translate_one()

Michael Ellerman (1):
      of: Fix comparison of reserved memory regions

Rob Herring (1):
      of/irq: move of_msi_map_rid declaration to the correct ifdef section

 drivers/of/address.c         |  5 +++--
 drivers/of/fdt.c             |  7 ++++++-
 drivers/of/irq.c             |  3 ++-
 drivers/of/of_reserved_mem.c |  8 +++++++-
 include/linux/of_irq.h       | 19 ++++++++++++-------
 5 files changed, 30 insertions(+), 12 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
