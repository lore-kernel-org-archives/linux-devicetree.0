From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/4] CMA & device tree, once again
Date: Wed, 02 Jul 2014 12:48:48 +0200
Message-ID: <1404298132-6050-1-git-send-email-m.szyprowski@samsung.com>
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
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Jon Medhurst <tixy@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Tomasz Figa <t.figa@samsung.com>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Paul Mackerras <paulus@samba.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Josh Cartwright <joshc@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Grant Likely <grant.likely@linaro.org>, Laura Abbott <lauraa@codeaurora.org>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, Michal Nazarewicz <mina86@mina86.com>, Marc <marc.ceeeee@gmail.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V." <aneesh.kumar@linux.v>
List-Id: devicetree@vger.kernel.org

Hello,

This is one more respin of the patches which add support for creating
reserved memory regions defined in device tree. The last attempt
(http://lists.linaro.org/pipermail/linaro-mm-sig/2014-February/003738.html)
ended in merging only half of the code, so right now we have complete
documentation merged and only basic code, which implements a half of it
is written in the documentation. Although the merged patches allow to
reserve memory, there is no way of using it for devices and drivers.

This situation makes CMA rather useless, as the main architecture (ARM),
which used it, has been converted from board-file based system
initialization to device tree. Thus there is no place to use direct
calls to dma_declare_contiguous() and some new solution, which bases on
device tree, is urgently needed.

This patch series fixes this issue. It provides two, already widely
discussed and already present in the kernel, drivers for reserved
memory: first based on DMA-coherent allocator, second using Contiguous
Memory Allocator. The first one nicely implements typical 'carved out'
reserved memory way of allocating contiguous buffers in a kernel-style
way. The memory is used exclusively by devices assigned to the given
memory region. The second one allows to reuse reserved memory for
movable kernel pages (like disk buffers, anonymous memory) and migrates
it out when device to allocates contiguous memory buffer. Both driver
provides memory buffers via standard dma-mapping API.

The patches have been rebased on top of latest CMA and mm changes merged
to akmp kernel tree.

To define a 64MiB CMA region following node is needed:

multimedia_reserved: multimedia_mem_region {
	compatible = "shared-dma-pool";
	reusable;
	size = <0x4000000>;
	alignment = <0x400000>;
};

Similarly, one can define 64MiB region with DMA coherent memory:

multimedia_reserved: multimedia_mem_region {
	compatible = "shared-dma-pool";
	no-map;
	size = <0x4000000>;
	alignment = <0x400000>;
};

Then the defined region can be assigned to devices:

scaler: scaler@12500000 {
	memory-region = <&multimedia_reserved>;
	/* ... */
};
codec: codec@12600000 {
	memory-region = <&multimedia_reserved>;
	/* ... */
};

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Changes since the version posted in '[PATCH v6 00/11] reserved-memory 
regions/CMA in devicetree, again' thread 
http://lists.linaro.org/pipermail/linaro-mm-sig/2014-February/003738.html:
- rebased on top of '[PATCH v3 -next 0/9] CMA: generalize CMA reserved
area management code' patch series on v3.16-rc3
- improved dma-coherent driver, now it correctly handles assigning more
than one device to the given memory region


Patch summary:

Marek Szyprowski (4):
  drivers: of: add automated assignment of reserved regions to client
    devices
  drivers: of: initialize and assign reserved memory to newly created
    devices
  drivers: dma-coherent: add initialization from device tree
  drivers: dma-contiguous: add initialization from device tree

 drivers/base/dma-coherent.c     | 137 ++++++++++++++++++++++++++++++++++------
 drivers/base/dma-contiguous.c   |  67 ++++++++++++++++++++
 drivers/of/of_reserved_mem.c    |  70 ++++++++++++++++++++
 drivers/of/platform.c           |   7 ++
 include/linux/cma.h             |   3 +
 include/linux/of_reserved_mem.h |   7 ++
 mm/cma.c                        |  69 +++++++++++++++-----
 7 files changed, 324 insertions(+), 36 deletions(-)

-- 
1.9.2
