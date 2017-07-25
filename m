From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/4] Removing full paths from DT full_name
Date: Tue, 25 Jul 2017 16:44:23 -0500
Message-ID: <20170725214427.25768-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: devicetree@vger.kernel.org

This series is the last steps to remove storing the full path for every 
DT node. Instead, we can create full path strings dynamically as needed 
with printf %pOF specifiers (commit ce4fecf1fe15). There are a number of 
remaining direct users of full_name after this series. I don't believe 
there should be any functional impact for those users with the change to 
only the node name (+unit-address). The majority are for struct 
resource.name. This should only affect /proc/iomem display.

Patches 1 and 2 can be applied now for 4.14. For patches 3 and 4, my 
target is 4.15 after all the dependencies have been merged.

PPC folks, Please test! The PPC parts are untested. A git branch with 
all the dependencies is here[1].

Rob

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-printf

Rob Herring (4):
  powerpc: pseries: vio: match parent nodes with of_find_node_by_path
  powerpc: pseries: remove dlpar_attach_node dependency on full path
  powerpc: pseries: only store the device node basename in full_name
  of/fdt: only store the device node basename in full_name

 arch/powerpc/platforms/pseries/dlpar.c       | 26 +++--------
 arch/powerpc/platforms/pseries/hotplug-cpu.c |  2 +-
 arch/powerpc/platforms/pseries/mobility.c    |  2 +-
 arch/powerpc/platforms/pseries/pseries.h     |  2 +-
 arch/powerpc/platforms/pseries/reconfig.c    |  2 +-
 arch/powerpc/platforms/pseries/vio.c         |  4 +-
 drivers/of/fdt.c                             | 69 +++++-----------------------
 7 files changed, 23 insertions(+), 84 deletions(-)

-- 
2.11.0
