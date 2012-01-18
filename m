From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC PATCH 0/5] ARM: introducing DT topology
Date: Wed, 18 Jan 2012 14:36:43 +0000
Message-ID: <1326897408-11204-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Vincent Guittot <vincent.guittot@linaro.org>
List-Id: devicetree@vger.kernel.org

The introduction of multi-cluster ARM systems in SoC designs requires the kernel
to become cluster aware, so that it can be booted on every CPU in the system
and it can build an appropriate representation of topology levels.

Current code in the kernel, in particular the boot sequence, hinges upon a
sequential mapping of MPIDR values for cpus and related interrupt
controller CPU interfaces to logical cpu indexing. 
This hypothesis is not valid when the concept of cluster is introduced since
the MPIDR cannot be represented as a single index and interrupt controller
CPU interfaces might be wired with a numbering scheme following per-SoC
design parameters which cannot be extrapolated easily through generic functions
by the primary CPU.

Furthermore, relying on the MPIDR to be wired according to real topology levels
might turn out to be an unreliable solution, hence a SW representation is
needed to override possibly incorrect MPIDR register values.

Through the device tree and relative bindings, the kernel is provided
with HW values for MPIDR registers, interrupt controller CPU interfaces and
with a topology representation of hierarchy levels and connection between cores.

The device tree bindings allow to boot the Linux kernel on a multi-cluster
system without relying on platform specific hook to identify the number of CPUs
and interrupt controller wiring definition.

The patchset has been tested against:

git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/linux-arm-arch.git master

to boot an 8-core dual-cluster system on every possible CPU and to describe
the relative cpu topology according to the affinity levels.

Compile tested against linux-next, with a dependency on the following patch:

http://www.spinics.net/lists/arm-kernel/msg155873.html

Documentation of new device tree bindings is provided in the corresponding
patches and provided for discussion.

Lorenzo Pieralisi (5):
  ARM: kernel: add device tree init map function
  ARM: kernel: add cpu logical map DT init in setup_arch
  ARM: kernel: add logical mappings look-up
  ARM: gic: add cpuif topology description
  ARM: kernel: build CPU topology from DT

 Documentation/devicetree/bindings/arm/cpus.txt     |   42 +++++
 Documentation/devicetree/bindings/arm/gic.txt      |   69 ++++++++
 Documentation/devicetree/bindings/arm/topology.txt |  167 ++++++++++++++++++++
 arch/arm/common/gic.c                              |   94 +++++++++++-
 arch/arm/include/asm/prom.h                        |    2 +
 arch/arm/include/asm/smp_plat.h                    |   12 ++
 arch/arm/kernel/devtree.c                          |   40 +++++
 arch/arm/kernel/setup.c                            |    1 +
 arch/arm/kernel/topology.c                         |  110 +++++++++++---
 9 files changed, 513 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/cpus.txt
 create mode 100644 Documentation/devicetree/bindings/arm/topology.txt

-- 
1.7.4.4
