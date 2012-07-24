From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] Devicetree for 3.6
Date: Tue, 24 Jul 2012 16:01:40 -0500
Message-ID: <500F0D34.6000907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Linus,

While Grant's busy packing, please pull devicetree updates for 3.6.

Rob

The following changes since commit 6887a4131da3adaab011613776d865f4bcfb5678:

  Linux 3.5-rc5 (2012-06-30 16:08:57 -0700)

are available in the git repository at:

  git://sources.calxeda.com/kernel/linux.git tags/dt-for-3.6

for you to fetch changes up to e95d8aafa5d911bf523bc47fe89f3336eb8a1b51:

  of: mtd: nuke useless const qualifier (2012-07-10 10:32:06 -0500)

----------------------------------------------------------------
Devicetree updates for 3.6

A small set of changes for devicetree:
- Couple of Documentation fixes
- Addition of new helper function of_node_full_name
- Improve of_parse_phandle_with_args return values
- Some NULL related sparse fixes

----------------------------------------------------------------
Alexandre Courbot (1):
      of: return -ENOENT when no property

Artem Bityutskiy (1):
      of: mtd: nuke useless const qualifier

Grant Likely (1):
      devicetree: add helper inline for retrieving a node's full name

Marek Vasut (1):
      LED: Fix missing semicolon in OF documentation

Richard Genoud (1):
      usage-model.txt: fix typo machine_init->init_machine

Rob Herring (1):
      of: fix a few typos in the binding documentation

Sachin Kamat (1):
      of: Fix null pointer related warnings in base.c file

 Documentation/devicetree/bindings/gpio/led.txt     |    2 +-
 .../devicetree/bindings/mtd/partition.txt          |    2 +-
 Documentation/devicetree/usage-model.txt           |    2 +-
 arch/microblaze/pci/pci-common.c                   |    6 ++----
 arch/powerpc/kernel/pci-common.c                   |    6 ++----
 arch/powerpc/kernel/vio.c                          |    5 ++---
 arch/powerpc/platforms/cell/iommu.c                |    3 +--
 arch/powerpc/platforms/pseries/iommu.c             |    2 +-
 arch/sparc/kernel/of_device_64.c                   |    2 +-
 drivers/of/base.c                                  |   10 +++++-----
 drivers/of/irq.c                                   |    2 +-
 drivers/of/of_mtd.c                                |    2 +-
 include/linux/of.h                                 |   10 ++++++++++
 include/linux/of_mtd.h                             |    2 +-
 kernel/irq/irqdomain.c                             |    8 ++++----
 15 files changed, 34 insertions(+), 30 deletions(-)
