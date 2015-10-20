From: Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>
Subject: [PATCH v6 0/4] arm64, numa: Add numa support for arm64 platforms
Date: Tue, 20 Oct 2015 16:15:27 +0530
Message-ID: <1445337931-11344-1-git-send-email-gkulkarni@caviumnetworks.com>
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
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Will.Deacon@arm.com, catalin.marinas@arm.com, grant.likely@linaro.org, leif.lindholm@linaro.org, rfranz@cavium.com, ard.biesheuvel@linaro.org, msalter@redhat.com, robh+dt@kernel.org, steve.capper@linaro.org, hanjun.guo@linaro.org, al.stone@linaro.org, arnd@arndb.de, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rjw@rjwysocki.net, lenb@kernel.org, marc.zyngier@arm.com, rrichter@cavium.com, Prasun.Kapoor@caviumnetworks.com
Cc: gpkulkarni@gmail.com
List-Id: devicetree@vger.kernel.org

v6:
	- defined and implemented the numa dt binding using
	node property proximity and device node distance-map.
	- renamed dt_numa to of_numa

v5:
        - created base verion of numa.c which creates dummy numa without using dt
          on single socket platforms. Then added patches for dt support.
        - Incorporated review comments from Hanjun Guo.

v4:
done changes as per Arnd review comments.

v3:
Added changes to support numa on arm64 based platforms.
Tested these patches on cavium's multinode(2 node topology) platform.
In this patchset, defined and implemented dt bindings for numa mapping
for core and memory using device node property arm,associativity.

v2:
Defined and implemented numa map for memory, cores to node and
proximity distance matrix of nodes.

v1:
Initial patchset to support numa on arm64 platforms.

Note:
        1. This patchset is tested for numa with dt on
           thunderx single socket and dual socket boards.
        2. Numa DT booting needs the dt memory nodes, which are deleted in current efi-stub,
        hence to try numa with dt, you need to rebase with ard's patchset.
        http://git.linaro.org/people/ard.biesheuvel/linux-arm.git/shortlog/refs/heads/arm64-uefi-early-fdt-handling

Ganapatrao Kulkarni (4):
  arm64, numa: adding numa support for arm64 platforms.
  Documentation, dt, arm64/arm: dt bindings for numa.
  arm64/arm, numa, dt: adding numa dt binding implementation for arm64
    platforms
  arm64, dt, thunderx: Add initial dts for Cavium Thunderx in 2 node
    topology.

 Documentation/devicetree/bindings/arm/numa.txt  | 275 ++++++++
 arch/arm64/Kconfig                              |  35 +
 arch/arm64/boot/dts/cavium/Makefile             |   2 +-
 arch/arm64/boot/dts/cavium/thunder-88xx-2n.dts  |  82 +++
 arch/arm64/boot/dts/cavium/thunder-88xx-2n.dtsi | 806 ++++++++++++++++++++++++
 arch/arm64/include/asm/mmzone.h                 |  17 +
 arch/arm64/include/asm/numa.h                   |  73 +++
 arch/arm64/kernel/Makefile                      |   1 +
 arch/arm64/kernel/of_numa.c                     | 221 +++++++
 arch/arm64/kernel/setup.c                       |   9 +
 arch/arm64/kernel/smp.c                         |   3 +
 arch/arm64/mm/Makefile                          |   1 +
 arch/arm64/mm/init.c                            |  31 +-
 arch/arm64/mm/numa.c                            | 539 ++++++++++++++++
 14 files changed, 2090 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/numa.txt
 create mode 100644 arch/arm64/boot/dts/cavium/thunder-88xx-2n.dts
 create mode 100644 arch/arm64/boot/dts/cavium/thunder-88xx-2n.dtsi
 create mode 100644 arch/arm64/include/asm/mmzone.h
 create mode 100644 arch/arm64/include/asm/numa.h
 create mode 100644 arch/arm64/kernel/of_numa.c
 create mode 100644 arch/arm64/mm/numa.c

-- 
1.8.1.4
