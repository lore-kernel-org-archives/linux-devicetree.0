From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC/PATCH v2 0/2] Device Tree support for CMA (Contiguous Memory
 Allocator)
Date: Thu, 11 Apr 2013 13:22:08 +0200
Message-ID: <1365679330-2514-1-git-send-email-m.szyprowski@samsung.com>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This is an update for my proposal for device tree integration for
Contiguous Memory Allocator. The code is quite straightforward, but
expect again that the device tree bindings will trigger some discussion.

Just a few words for those who see this code for the first time:

The proposed bindings allows to define contiguous memory regions of
specified base address and size. Then, the defined regions can be
assigned to the given device(s) by adding a property with a phanle to
the defined contiguous memory region. From the device tree perspective
that's all. Once the bindings are added, all the memory allocations from
dma-mapping subsystem will be served from the defined contiguous memory
regions.

Contiguous Memory Allocator is a framework, which lets to provide a
large contiguous memory buffers for (usually a multimedia) devices. The
contiguous memory is reserved during early boot and then shared with
kernel, which is allowed to allocate it for movable pages. Then, when
device driver requests a contigouous buffer, the framework migrates
movable pages out of contiguous region and gives it to the driver. When
device driver frees the buffer, it is added to kernel memory pool again.
For more information, please refer to commit c64be2bb1c6eb43c838b2c6d57
("drivers: add Contiguous Memory Allocator") and d484864dd96e1830e76895
(CMA merge commit).

Why we need device tree bindings for CMA at all?

Older ARM kernels used so called board-based initialization. Those board
files contained a definition of all hardware blocks available on the
target system and particular kernel and driver software configuration
selected by the board maintainer. 

In the new approach the board files will be removed completely and
Device Tree approach is used to describe all hardware blocks available
on the target system. By definition, the bindings should be software
independent, so at least in theory it should be possible to use those
bindings with other operating systems than Linux kernel. 

However we also need to pass somehow the information about kernel and
device driver software-only configuration data, which were earlier
encoded in the board file. For such data I propose to use /chosen node,
where kernel command line has been already stored. Future bootloaders
will allow to modify or replace particular nodes and one will be able to
use custom /chosen node to configure his system. The proposed patches
introduce /chosen/contiguous-memory node and related bindings, to avoid
complicated encoding of CMA related configuration to kernel command
line.

Best regards
Marek Szyprowski
Samsung Poland R&D Center

Changelog:

v2:
- moved contiguous-memory bindings from /memory to /chosen/contiguous-memory/
  node to avoid spreading Linux specific parameters over the whole device
  tree definitions
- added support for autoconfigured regions (use zero base)
- fixes minor bugs

v1: http://thread.gmane.org/gmane.linux.drivers.devicetree/30111/
- initial proposal

Patch summary:

Marek Szyprowski (2):
  drivers: dma-contiguous: clean source code and prepare for device
    tree
  drivers: dma-contiguous: add initialization from device tree

 Documentation/devicetree/bindings/memory.txt |  101 ++++++++++
 arch/arm/boot/dts/skeleton.dtsi              |    7 +-
 drivers/base/dma-contiguous.c                |  278 +++++++++++++++++++-------
 include/asm-generic/dma-contiguous.h         |    4 +-
 include/linux/dma-contiguous.h               |   32 ++-
 5 files changed, 338 insertions(+), 84 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory.txt

-- 
1.7.9.5
