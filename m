From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [GIT PULL] DT changes for v3.16
Date: Tue, 27 May 2014 16:09:44 +0100
Message-ID: <CACxGe6uAY48UEF1qY=ATZ3rsm3h=dUpgUA07iuizrciX-j8=fQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Here's the stuff I've got queued up. Please pull it into your tree in
preparation for the merge window. I may have some more patches
tomorrow from Panto. If so, then I'll send those as a separate pull.

g.

The following changes since commit eafd370dfe487facfdef499057f4eac9aa0b4bf5:

  Merge branch 'dt-bus-name' into for-next (2014-05-13 18:34:35 -0500)

are available in the git repository at:


  git://git.secretlab.ca/git/linux tags/dt-for-robh

for you to fetch changes up to 08cf78ed41feaa21017487bad0a5a405c6cede43:

  of_pci_irq: kill useless variable in of_irq_parse_pci() (2014-05-27
12:13:34 +0100)

----------------------------------------------------------------
DT queued up for v3.16

Mostly bug fixes, but also some rework to improve path handling and
device naming

----------------------------------------------------------------
Grant Likely (6):
      of: Ensure unique names without sacrificing determinism
      of: Stop naming platform_device using dcr address
      lib: add glibc style strchrnul() variant
      of: Create unlocked version of for_each_child_of_node()
      of: Make of_find_node_by_path() handle /aliases
      of: Add a testcase for of_find_node_by_path()

Grygorii Strashko (1):
      of/irq: do irq resolution in platform_get_irq_byname()

Ian Molton (1):
      pci/of: Remove dead code

Leif Lindholm (1):
      of: Handle memory@0 node on PPC32 only

Sergei Shtylyov (1):
      of_pci_irq: kill useless variable in of_irq_parse_pci()

Thierry Reding (1):
      of: Use NULL for pointers

Xiubo Li (1):
      of: fix race between search and remove in of_update_property()

 arch/powerpc/include/asm/dcr-mmio.h         |   4 -
 arch/powerpc/sysdev/dcr.c                   |   6 +-
 drivers/base/platform.c                     |   7 +-
 drivers/of/base.c                           | 115 ++++++++++++++++++++++------
 drivers/of/fdt.c                            |   4 +-
 drivers/of/irq.c                            |  22 ++++++
 drivers/of/of_pci_irq.c                     |   8 +-
 drivers/of/platform.c                       |  62 +++++----------
 drivers/of/selftest.c                       |  46 +++++++++++
 drivers/of/testcase-data/tests-phandle.dtsi |   6 +-
 include/linux/of_irq.h                      |   5 ++
 include/linux/string.h                      |   3 +
 lib/string.c                                |  18 +++++
 13 files changed, 222 insertions(+), 84 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
