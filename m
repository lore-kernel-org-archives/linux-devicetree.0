From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [GIT PULL] ARM: multi-cluster aware boot protocol
Date: Mon, 19 Nov 2012 16:07:25 +0000
Message-ID: <20121119160725.GA25721@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux@arm.linux.org.uk
Cc: nicolas.pitre@linaro.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Russell,

please consider pulling this patch series that adds cluster awareness to
the ARM cpu_logical_map, adds DT cpu bindings, introduces GIC autoprobing for
CPU interfaces and cleans up the topology definitions based on the MPIDR
register.

It is a small step, though pivotal, towards cluster awareness in the ARM kernel
that allows us to generalize the MPIDR concept for future systems and prepare
for some changes that have been on the backburner for a while (eg MPIDR
linearization in cpu_{suspend}/{resume}).

Thank you very much indeed,
Lorenzo

The following changes since commit 77b67063bb6bce6d475e910d3b886a606d0d91f7:

  Linux 3.7-rc5 (2012-11-11 13:44:33 +0100)

are available in the git repository at:

  git://linux-arm.org/linux-2.6-lp.git cluster-boot-protocol

for you to fetch changes up to 384a290283fde63ba8dc671fca5420111cdac19a:

  ARM: gic: use a private mapping for CPU target interfaces (2012-11-19 15:44:34 +0000)

----------------------------------------------------------------
Lorenzo Pieralisi (6):
      ARM: kernel: enhance MPIDR macro definitions
      ARM: kernel: update topology to use new MPIDR macros
      ARM: kernel: smp_setup_processor_id() updates
      ARM: kernel: add device tree init map function
      ARM: kernel: add cpu logical map DT init in setup_arch
      ARM: kernel: add logical mappings look-up

Nicolas Pitre (1):
      ARM: gic: use a private mapping for CPU target interfaces

 Documentation/devicetree/bindings/arm/cpus.txt |  77 +++++++++++++++++++
 arch/arm/common/gic.c                          |  45 ++++++++---
 arch/arm/include/asm/cputype.h                 |  13 ++++
 arch/arm/include/asm/prom.h                    |   2 +
 arch/arm/include/asm/smp_plat.h                |  17 +++++
 arch/arm/kernel/devtree.c                      | 100 +++++++++++++++++++++++++
 arch/arm/kernel/setup.c                        |   8 +-
 arch/arm/kernel/topology.c                     |  42 ++---------
 8 files changed, 256 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/cpus.txt
