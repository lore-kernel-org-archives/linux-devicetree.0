From: Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.com>
Subject: [RFC PATCH v3 0/4] arm64:numa: Add numa support for arm64 platforms.
Date: Wed, 31 Dec 2014 13:06:15 +0530
Message-ID: <1420011379-7116-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Will.Deacon@arm.com, catalin.marinas@arm.com, grant.likely@linaro.org, devicetree@vger.kernel.org, leif.lindholm@linaro.org, roy.franz@linaro.org, ard.biesheuvel@linaro.org, msalter@redhat.com, robh+dt@kernel.org, steve.capper@linaro.org, hanjun.guo@linaro.org, jchandra@broadcom.com, al.stone@linaro.org, arnd@arndb.de
Cc: gpkulkarni@gmail.com
List-Id: devicetree@vger.kernel.org

This is v3 patch set to support numa on arm64 based platforms.
Tested these patches on cavium's multinode(2 node topology) platform.

In this patchset, defined and implemented dt bindings for numa mapping for core and memory.
using device node property arm,associativity.

v2:
Defined and implemented numa map for memory, cores to node and
proximity distance matrix of nodes to each other.

v1:
Initial patchset to support numa on arm64 platforms.

Ganapatrao Kulkarni (4):
  arm64: defconfig: increase NR_CPUS range to 2-4096.
  Documentation: arm64/arm: dt bindings for numa.
  arm64:thunder: Add initial dts for Cavium's Thunder SoC in 2 Node
    topology.
  arm64:numa: adding numa support for arm64 platforms.

 Documentation/devicetree/bindings/arm/numa.txt | 198 +++++++
 arch/arm64/Kconfig                             |  36 +-
 arch/arm64/boot/dts/thunder-88xx-2n.dts        |  78 +++
 arch/arm64/boot/dts/thunder-88xx-2n.dtsi       | 789 +++++++++++++++++++++++++
 arch/arm64/include/asm/mmzone.h                |  32 +
 arch/arm64/include/asm/numa.h                  |  45 ++
 arch/arm64/kernel/Makefile                     |   1 +
 arch/arm64/kernel/dt_numa.c                    | 296 ++++++++++
 arch/arm64/kernel/setup.c                      |   8 +
 arch/arm64/kernel/smp.c                        |   2 +
 arch/arm64/mm/Makefile                         |   1 +
 arch/arm64/mm/init.c                           |  34 +-
 arch/arm64/mm/numa.c                           | 520 ++++++++++++++++
 13 files changed, 2032 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/numa.txt
 create mode 100644 arch/arm64/boot/dts/thunder-88xx-2n.dts
 create mode 100644 arch/arm64/boot/dts/thunder-88xx-2n.dtsi
 create mode 100644 arch/arm64/include/asm/mmzone.h
 create mode 100644 arch/arm64/include/asm/numa.h
 create mode 100644 arch/arm64/kernel/dt_numa.c
 create mode 100644 arch/arm64/mm/numa.c

-- 
1.8.1.4
