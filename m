From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH v3 0/6] Basic ARM devicetree support
Date: Sat, 12 Feb 2011 01:14:27 -0700
Message-ID: <20110212080634.15682.21141.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Third posting.  v3 reverts the v2 changes to the handling of the dtb
during early init.  The real problem turned out to be using the wrong
function for allocating early memory.  Switching to alloc_bootmem()
fixed the corruption issue.  Memory reservation was never the issue.

v3 also simplifies the handling of reserved memory sections and adds
parsing of the dtb reserved map.

I'm not asking for these patches to be merged into mainline yet, but
I'm fairly confident that they should be pretty close to their final
form.

Not included in this series is Russell's patch to remove early vetting
of the machine type number and Rob's patch to map the region if atags
or the dtb are not within the first 1MB.  However, I am carrying those
patches in my devicetree/arm and devicetree/test branches.

Please test.

...

This patch series allows CONFIG_OF to be enabled on ARM and allows the
kernel to accept a dtb pointer from boot firmware instead of atags.
If a dtb is passed, then the kernel will use the root 'compatible'
property to find a matching machine_desc, and it will use it to obtain
the memory layout, initrd location and kernel parameters string.

Only limited device tree support is enabled here.  It does not perform
any kind of device registration from device tree data.  That support
will be enabled in a later patch set.  Rather, this series is a stable
base that other engineers can use to start working on device tree
support for their platforms.

Tested on Versatile (qemu) and nVidia Tegra Harmony.  Kernel compiles
and boots with CONFIG_OF both on and off, both with and without passing
a device tree blob.

This series is reflected in the following branch (stable; will not be
rebased):

 git://git.secretlab.ca/git/linux-2.6 devicetree/arm

The 'clean' patches (rebased) can be found here:

 git://git.secretlab.ca/git/linux-2.6 devicetree/test

---

Grant Likely (5):
      arm/dt: Make __vet_atags also accept a dtb image
      arm/dt: consolidate atags setup into setup_machine_atags
      arm/dt: probe for platforms via the device tree
      arm/dt: Basic versatile devicetree support
      arm/dt: Basic tegra devicetree support

Jeremy Kerr (1):
      arm/dt: Allow CONFIG_OF on ARM


 arch/arm/Kconfig                       |    7 ++
 arch/arm/include/asm/mach/arch.h       |    2 
 arch/arm/include/asm/prom.h            |   37 +++++++++
 arch/arm/include/asm/setup.h           |    3 +
 arch/arm/kernel/Makefile               |    1 
 arch/arm/kernel/devtree.c              |  136 ++++++++++++++++++++++++++++++++
 arch/arm/kernel/head-common.S          |   24 ++++--
 arch/arm/kernel/head.S                 |    8 +-
 arch/arm/kernel/setup.c                |   78 ++++++++++--------
 arch/arm/mach-tegra/board-harmony.c    |    6 +
 arch/arm/mach-versatile/versatile_ab.c |    6 +
 arch/arm/mach-versatile/versatile_pb.c |    6 +
 arch/arm/mm/init.c                     |   11 +++
 13 files changed, 280 insertions(+), 45 deletions(-)
 create mode 100644 arch/arm/include/asm/prom.h
 create mode 100644 arch/arm/kernel/devtree.c

-- 
Signature
