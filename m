From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] mtd/m25p80: add device tree probe support
Date: Thu, 28 Jul 2011 15:45:21 -0600
Message-ID: <20110728214521.GA4674@ponder.secretlab.ca>
References: <1311601063-16581-1-git-send-email-shawn.guo@linaro.org>
	<20110725211910.GG26735@ponder.secretlab.ca>
	<4E31B713.1030901@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E31B713.1030901-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: manu <manuel.pezzin-GANU6spQydw@public.gmane.org>
Cc: Artem Bityutskiy <artem.bityutskiy-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 28, 2011 at 09:22:59PM +0200, manu wrote:
> Dear Grant, Shawn,
> I don't this patch is required as m25p** serial flashes are
> supported already with generic OF/SPI and OF/MTD schemes.
> I have successfully used it myself on an unmodified 2.6.36.3 vanilla
> kernel on a xilinx/powerpc platform with a m25p32 part from STM.
> You will find attached the corresponding working defconfig + dts
> files (appart from partitions which I didn't managed to configure
> properly...).
> Best Regards,
> =

> Manuel

There is a heuristic which allows spi and i2c devices to get bound
without a match table, which is why it works for you, but there is no
guarantee that the heuristic will continue to exist in the long term.
This is still probably the right thing to do.

g.

> =

> =

> Le 25/07/2011 23:19, Grant Likely a =E9crit :
> >On Mon, Jul 25, 2011 at 09:37:43PM +0800, Shawn Guo wrote:
> >>It adds device tree probe support for m25p80 driver.
> >>
> >>Signed-off-by: Shawn Guo<shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>Cc: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >>Cc: Artem Bityutskiy<artem.bityutskiy-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> >Acked-by: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >>---
> >>  Documentation/devicetree/bindings/mtd/st-m25p.txt |   14 ++++++++++++=
++
> >>  drivers/mtd/devices/m25p80.c                      |   12 ++++++++++++
> >>  2 files changed, 26 insertions(+), 0 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/mtd/st-m25p.txt
> >>
> >>diff --git a/Documentation/devicetree/bindings/mtd/st-m25p.txt b/Docume=
ntation/devicetree/bindings/mtd/st-m25p.txt
> >>new file mode 100644
> >>index 0000000..a8c0485
> >>--- /dev/null
> >>+++ b/Documentation/devicetree/bindings/mtd/st-m25p.txt
> >>@@ -0,0 +1,14 @@
> >>+* STMicroelectronics SPI Flash
> >>+
> >>+Required properties:
> >>+- compatible : "st,<model>", "st,m25p".
> >>+
> >>+Examples:
> >>+
> >>+flash: m25p32@1 {
> >>+	#address-cells =3D<1>;
> >>+	#size-cells =3D<1>;
> >>+	compatible =3D "st,m25p32", "st,m25p";
> >>+	spi-max-frequency =3D<20000000>;
> >>+	reg =3D<1>;
> >>+};
> >>diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> >>index e6ba034..d9d4101 100644
> >>--- a/drivers/mtd/devices/m25p80.c
> >>+++ b/drivers/mtd/devices/m25p80.c
> >>@@ -26,6 +26,7 @@
> >>  #include<linux/slab.h>
> >>  #include<linux/sched.h>
> >>  #include<linux/mod_devicetable.h>
> >>+#include<linux/of_device.h>
> >>
> >>  #include<linux/mtd/cfi.h>
> >>  #include<linux/mtd/mtd.h>
> >>@@ -767,6 +768,16 @@ static const struct spi_device_id m25p_ids[] =3D {
> >>  };
> >>  MODULE_DEVICE_TABLE(spi, m25p_ids);
> >>
> >>+#ifdef CONFIG_OF
> >>+static const struct of_device_id m25p_dt_ids[] =3D {
> >>+	{ .compatible =3D "st,m25p", },
> >>+	{ /* sentinel */ }
> >>+};
> >>+MODULE_DEVICE_TABLE(of, m25p_dt_ids);
> >>+#else
> >>+#define m25p_dt_ids NULL
> >>+#endif
> >>+
> >>  static const struct spi_device_id *__devinit jedec_probe(struct spi_d=
evice *spi)
> >>  {
> >>  	int			tmp;
> >>@@ -986,6 +997,7 @@ static struct spi_driver m25p80_driver =3D {
> >>  		.name	=3D "m25p80",
> >>  		.bus	=3D&spi_bus_type,
> >>  		.owner	=3D THIS_MODULE,
> >>+		.of_match_table =3D m25p_dt_ids,
> >>  	},
> >>  	.id_table	=3D m25p_ids,
> >>  	.probe	=3D m25p_probe,
> >>-- =

> >>1.7.4.1
> >>
> >>
> >_______________________________________________
> >devicetree-discuss mailing list
> >devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> >https://lists.ozlabs.org/listinfo/devicetree-discuss
> >
> >
> =


> #
> # Automatically generated make config: don't edit
> # Linux kernel version: 2.6.36.3
> # Wed Feb  9 11:27:22 2011
> #
> # CONFIG_PPC64 is not set
> =

> #
> # Processor support
> #
> # CONFIG_PPC_BOOK3S_32 is not set
> # CONFIG_PPC_85xx is not set
> # CONFIG_PPC_8xx is not set
> CONFIG_40x=3Dy
> # CONFIG_44x is not set
> # CONFIG_E200 is not set
> CONFIG_4xx=3Dy
> CONFIG_PPC_MMU_NOHASH=3Dy
> CONFIG_PPC_MMU_NOHASH_32=3Dy
> # CONFIG_PPC_MM_SLICES is not set
> CONFIG_NOT_COHERENT_CACHE=3Dy
> CONFIG_PPC32=3Dy
> CONFIG_WORD_SIZE=3D32
> # CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
> CONFIG_MMU=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_HARDIRQS=3Dy
> CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
> # CONFIG_HAVE_SETUP_PER_CPU_AREA is not set
> # CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK is not set
> CONFIG_IRQ_PER_CPU=3Dy
> CONFIG_NR_IRQS=3D512
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> CONFIG_ARCH_HAS_ILOG2_U32=3Dy
> CONFIG_GENERIC_HWEIGHT=3Dy
> CONFIG_GENERIC_FIND_NEXT_BIT=3Dy
> # CONFIG_ARCH_NO_VIRT_TO_BUS is not set
> CONFIG_PPC=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_GENERIC_NVRAM=3Dy
> CONFIG_SCHED_OMIT_FRAME_POINTER=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_PPC_OF=3Dy
> CONFIG_PPC_UDBG_16550=3Dy
> # CONFIG_GENERIC_TBSYNC is not set
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_DEFAULT_UIMAGE=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_PPC_DCR_NATIVE=3Dy
> # CONFIG_PPC_DCR_MMIO is not set
> CONFIG_PPC_DCR=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_PPC_ADV_DEBUG_REGS=3Dy
> CONFIG_PPC_ADV_DEBUG_IACS=3D2
> CONFIG_PPC_ADV_DEBUG_DACS=3D2
> CONFIG_PPC_ADV_DEBUG_DVCS=3D0
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> CONFIG_CONSTRUCTORS=3Dy
> =

> #
> # General setup
> #
> CONFIG_EXPERIMENTAL=3Dy
> CONFIG_BROKEN_ON_SMP=3Dy
> CONFIG_LOCK_KERNEL=3Dy
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> CONFIG_CROSS_COMPILE=3D""
> CONFIG_LOCALVERSION=3D""
> # CONFIG_LOCALVERSION_AUTO is not set
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> # CONFIG_BSD_PROCESS_ACCT is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> # CONFIG_TREE_PREEMPT_RCU is not set
> # CONFIG_TINY_RCU is not set
> # CONFIG_RCU_TRACE is not set
> CONFIG_RCU_FANOUT=3D32
> # CONFIG_RCU_FANOUT_EXACT is not set
> # CONFIG_TREE_RCU_TRACE is not set
> # CONFIG_IKCONFIG is not set
> CONFIG_LOG_BUF_SHIFT=3D12
> # CONFIG_CGROUPS is not set
> # CONFIG_SYSFS_DEPRECATED_V2 is not set
> # CONFIG_RELAY is not set
> # CONFIG_NAMESPACES is not set
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D"../rootfs_dev_script_ppc"
> CONFIG_INITRAMFS_ROOT_UID=3D0
> CONFIG_INITRAMFS_ROOT_GID=3D0
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> # CONFIG_RD_LZMA is not set
> # CONFIG_RD_LZO is not set
> CONFIG_INITRAMFS_COMPRESSION_NONE=3Dy
> # CONFIG_INITRAMFS_COMPRESSION_GZIP is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_EMBEDDED=3Dy
> CONFIG_SYSCTL_SYSCALL=3Dy
> CONFIG_KALLSYMS=3Dy
> # CONFIG_KALLSYMS_EXTRA_PASS is not set
> CONFIG_HOTPLUG=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> # CONFIG_PERF_EVENTS is not set
> # CONFIG_PERF_COUNTERS is not set
> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_COMPAT_BRK=3Dy
> CONFIG_SLAB=3Dy
> # CONFIG_SLUB is not set
> # CONFIG_SLOB is not set
> # CONFIG_PROFILING is not set
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_ATTRS=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_DMA_API_DEBUG=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> CONFIG_SLABINFO=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> # CONFIG_MODULES is not set
> # CONFIG_BLOCK is not set
> # CONFIG_INLINE_SPIN_TRYLOCK is not set
> # CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
> # CONFIG_INLINE_SPIN_LOCK is not set
> # CONFIG_INLINE_SPIN_LOCK_BH is not set
> # CONFIG_INLINE_SPIN_LOCK_IRQ is not set
> # CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
> # CONFIG_INLINE_SPIN_UNLOCK is not set
> # CONFIG_INLINE_SPIN_UNLOCK_BH is not set
> # CONFIG_INLINE_SPIN_UNLOCK_IRQ is not set
> # CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
> # CONFIG_INLINE_READ_TRYLOCK is not set
> # CONFIG_INLINE_READ_LOCK is not set
> # CONFIG_INLINE_READ_LOCK_BH is not set
> # CONFIG_INLINE_READ_LOCK_IRQ is not set
> # CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
> # CONFIG_INLINE_READ_UNLOCK is not set
> # CONFIG_INLINE_READ_UNLOCK_BH is not set
> # CONFIG_INLINE_READ_UNLOCK_IRQ is not set
> # CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
> # CONFIG_INLINE_WRITE_TRYLOCK is not set
> # CONFIG_INLINE_WRITE_LOCK is not set
> # CONFIG_INLINE_WRITE_LOCK_BH is not set
> # CONFIG_INLINE_WRITE_LOCK_IRQ is not set
> # CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
> # CONFIG_INLINE_WRITE_UNLOCK is not set
> # CONFIG_INLINE_WRITE_UNLOCK_BH is not set
> # CONFIG_INLINE_WRITE_UNLOCK_IRQ is not set
> # CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
> # CONFIG_MUTEX_SPIN_ON_OWNER is not set
> # CONFIG_FREEZER is not set
> =

> #
> # Platform support
> #
> # CONFIG_PPC_CELL is not set
> # CONFIG_PPC_CELL_NATIVE is not set
> # CONFIG_PQ2ADS is not set
> # CONFIG_ISS4xx is not set
> # CONFIG_PPC4xx_GPIO is not set
> CONFIG_XILINX_VIRTEX=3Dy
> # CONFIG_ACADIA is not set
> # CONFIG_EP405 is not set
> # CONFIG_HCU4 is not set
> # CONFIG_HOTFOOT is not set
> # CONFIG_KILAUEA is not set
> # CONFIG_MAKALU is not set
> # CONFIG_WALNUT is not set
> CONFIG_XILINX_VIRTEX_GENERIC_BOARD=3Dy
> # CONFIG_PPC40x_SIMPLE is not set
> CONFIG_XILINX_VIRTEX_II_PRO=3Dy
> CONFIG_XILINX_VIRTEX_4_FX=3Dy
> CONFIG_IBM405_ERR77=3Dy
> CONFIG_IBM405_ERR51=3Dy
> # CONFIG_IPIC is not set
> # CONFIG_MPIC is not set
> # CONFIG_MPIC_WEIRD is not set
> # CONFIG_PPC_I8259 is not set
> # CONFIG_PPC_RTAS is not set
> # CONFIG_MMIO_NVRAM is not set
> # CONFIG_MPIC_U3_HT_IRQS is not set
> # CONFIG_PPC_MPC106 is not set
> # CONFIG_PPC_970_NAP is not set
> # CONFIG_PPC_INDIRECT_IO is not set
> # CONFIG_GENERIC_IOMAP is not set
> # CONFIG_CPU_FREQ is not set
> # CONFIG_FSL_ULI1575 is not set
> # CONFIG_SIMPLE_GPIO is not set
> =

> #
> # Kernel options
> #
> # CONFIG_HIGHMEM is not set
> # CONFIG_NO_HZ is not set
> # CONFIG_HIGH_RES_TIMERS is not set
> CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
> # CONFIG_HZ_100 is not set
> CONFIG_HZ_250=3Dy
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D250
> # CONFIG_SCHED_HRTICK is not set
> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_BINFMT_ELF=3Dy
> # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> # CONFIG_HAVE_AOUT is not set
> # CONFIG_BINFMT_MISC is not set
> CONFIG_MATH_EMULATION=3Dy
> # CONFIG_IOMMU_HELPER is not set
> # CONFIG_SWIOTLB is not set
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_HAS_WALK_MEMORY=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_MAX_ACTIVE_REGIONS=3D32
> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> CONFIG_ARCH_POPULATES_NODE_MAP=3Dy
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_FLATMEM_MANUAL=3Dy
> CONFIG_FLATMEM=3Dy
> CONFIG_FLAT_NODE_MEM_MAP=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_PAGEFLAGS_EXTENDED=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> # CONFIG_MIGRATION is not set
> # CONFIG_PHYS_ADDR_T_64BIT is not set
> CONFIG_ZONE_DMA_FLAG=3D1
> CONFIG_VIRT_TO_BUS=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_PPC_4K_PAGES=3Dy
> CONFIG_FORCE_MAX_ZONEORDER=3D11
> CONFIG_CMDLINE_BOOL=3Dy
> CONFIG_CMDLINE=3D""
> CONFIG_EXTRA_TARGETS=3D""
> # CONFIG_PM is not set
> CONFIG_SECCOMP=3Dy
> CONFIG_ISA_DMA_API=3Dy
> =

> #
> # Bus options
> #
> CONFIG_ZONE_DMA=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_4xx_SOC=3Dy
> CONFIG_PPC_PCI_CHOICE=3Dy
> # CONFIG_PCI is not set
> # CONFIG_PCI_DOMAINS is not set
> # CONFIG_PCI_SYSCALL is not set
> # CONFIG_ARCH_SUPPORTS_MSI is not set
> # CONFIG_PCCARD is not set
> # CONFIG_HAS_RAPIDIO is not set
> =

> #
> # Advanced setup
> #
> # CONFIG_ADVANCED_OPTIONS is not set
> =

> #
> # Default settings for advanced configuration options are used
> #
> CONFIG_LOWMEM_SIZE=3D0x30000000
> CONFIG_PAGE_OFFSET=3D0xc0000000
> CONFIG_KERNEL_START=3D0xc0000000
> CONFIG_PHYSICAL_START=3D0x00000000
> CONFIG_TASK_SIZE=3D0xc0000000
> CONFIG_CONSISTENT_SIZE=3D0x00200000
> # CONFIG_NET is not set
> =

> #
> # Device Drivers
> #
> =

> #
> # Generic Driver Options
> #
> CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
> # CONFIG_DEVTMPFS is not set
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> CONFIG_FW_LOADER=3Dy
> # CONFIG_FIRMWARE_IN_KERNEL is not set
> CONFIG_EXTRA_FIRMWARE=3D""
> # CONFIG_SYS_HYPERVISOR is not set
> CONFIG_MTD=3Dy
> # CONFIG_MTD_DEBUG is not set
> # CONFIG_MTD_CONCAT is not set
> CONFIG_MTD_PARTITIONS=3Dy
> # CONFIG_MTD_REDBOOT_PARTS is not set
> # CONFIG_MTD_CMDLINE_PARTS is not set
> CONFIG_MTD_OF_PARTS=3Dy
> # CONFIG_MTD_AR7_PARTS is not set
> =

> #
> # User Modules And Translation Layers
> #
> # CONFIG_MTD_CHAR is not set
> # CONFIG_MTD_OOPS is not set
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> # CONFIG_MTD_CFI is not set
> # CONFIG_MTD_JEDECPROBE is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> # CONFIG_MTD_CFI_I4 is not set
> # CONFIG_MTD_CFI_I8 is not set
> # CONFIG_MTD_RAM is not set
> # CONFIG_MTD_ROM is not set
> # CONFIG_MTD_ABSENT is not set
> =

> #
> # Mapping drivers for chip access
> #
> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> # CONFIG_MTD_PLATRAM is not set
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_DATAFLASH is not set
> CONFIG_MTD_M25P80=3Dy
> CONFIG_M25PXX_USE_FAST_READ=3Dy
> # CONFIG_MTD_SST25L is not set
> # CONFIG_MTD_SLRAM is not set
> # CONFIG_MTD_PHRAM is not set
> # CONFIG_MTD_MTDRAM is not set
> =

> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOC2000 is not set
> # CONFIG_MTD_DOC2001 is not set
> # CONFIG_MTD_DOC2001PLUS is not set
> # CONFIG_MTD_NAND is not set
> # CONFIG_MTD_ONENAND is not set
> =

> #
> # LPDDR flash memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> =

> #
> # UBI - Unsorted block images
> #
> # CONFIG_MTD_UBI is not set
> CONFIG_DTC=3Dy
> CONFIG_OF=3Dy
> =

> #
> # Flattened Device Tree and Open Firmware support
> #
> CONFIG_PROC_DEVICETREE=3Dy
> CONFIG_OF_FLATTREE=3Dy
> CONFIG_OF_DYNAMIC=3Dy
> CONFIG_OF_ADDRESS=3Dy
> CONFIG_OF_IRQ=3Dy
> CONFIG_OF_DEVICE=3Dy
> CONFIG_OF_SPI=3Dy
> # CONFIG_PARPORT is not set
> # CONFIG_MISC_DEVICES is not set
> CONFIG_HAVE_IDE=3Dy
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # CONFIG_SCSI_DMA is not set
> # CONFIG_SCSI_NETLINK is not set
> # CONFIG_MACINTOSH_DRIVERS is not set
> # CONFIG_PHONE is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> # CONFIG_INPUT_FF_MEMLESS is not set
> # CONFIG_INPUT_POLLDEV is not set
> # CONFIG_INPUT_SPARSEKMAP is not set
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> # CONFIG_INPUT_JOYDEV is not set
> # CONFIG_INPUT_EVDEV is not set
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> # CONFIG_INPUT_KEYBOARD is not set
> # CONFIG_INPUT_MOUSE is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> # CONFIG_SERIO_I8042 is not set
> # CONFIG_SERIO_SERPORT is not set
> # CONFIG_SERIO_LIBPS2 is not set
> # CONFIG_SERIO_RAW is not set
> # CONFIG_SERIO_XILINX_XPS_PS2 is not set
> # CONFIG_SERIO_ALTERA_PS2 is not set
> # CONFIG_GAMEPORT is not set
> =

> #
> # Character devices
> #
> CONFIG_VT=3Dy
> CONFIG_CONSOLE_TRANSLATIONS=3Dy
> CONFIG_VT_CONSOLE=3Dy
> CONFIG_HW_CONSOLE=3Dy
> # CONFIG_VT_HW_CONSOLE_BINDING is not set
> # CONFIG_DEVKMEM is not set
> # CONFIG_SERIAL_NONSTANDARD is not set
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> # CONFIG_SERIAL_MAX3107 is not set
> CONFIG_SERIAL_UARTLITE=3Dy
> CONFIG_SERIAL_UARTLITE_CONSOLE=3Dy
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_SERIAL_OF_PLATFORM=3Dy
> # CONFIG_SERIAL_OF_PLATFORM_NWPSERIAL is not set
> # CONFIG_SERIAL_TIMBERDALE is not set
> # CONFIG_SERIAL_GRLIB_GAISLER_APBUART is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> CONFIG_UNIX98_PTYS=3Dy
> # CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> # CONFIG_HVC_UDBG is not set
> # CONFIG_IPMI_HANDLER is not set
> # CONFIG_HW_RANDOM is not set
> # CONFIG_NVRAM is not set
> # CONFIG_GEN_RTC is not set
> # CONFIG_XILINX_HWICAP is not set
> # CONFIG_R3964 is not set
> # CONFIG_TCG_TPM is not set
> # CONFIG_RAMOOPS is not set
> # CONFIG_I2C is not set
> CONFIG_SPI=3Dy
> CONFIG_SPI_MASTER=3Dy
> =

> #
> # SPI Master Controller Drivers
> #
> CONFIG_SPI_BITBANG=3Dy
> # CONFIG_SPI_PPC4xx is not set
> CONFIG_SPI_XILINX=3Dy
> CONFIG_SPI_XILINX_OF=3Dy
> # CONFIG_SPI_XILINX_PLTFM is not set
> # CONFIG_SPI_DESIGNWARE is not set
> =

> #
> # SPI Protocol Masters
> #
> # CONFIG_SPI_SPIDEV is not set
> # CONFIG_SPI_TLE62X0 is not set
> =

> #
> # PPS support
> #
> # CONFIG_PPS is not set
> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> # CONFIG_GPIOLIB is not set
> # CONFIG_W1 is not set
> # CONFIG_POWER_SUPPLY is not set
> # CONFIG_HWMON is not set
> # CONFIG_THERMAL is not set
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> =

> #
> # Sonics Silicon Backplane
> #
> # CONFIG_SSB is not set
> CONFIG_MFD_SUPPORT=3Dy
> # CONFIG_MFD_CORE is not set
> # CONFIG_MFD_SM501 is not set
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_MFD_TMIO is not set
> # CONFIG_MFD_MC13783 is not set
> # CONFIG_ABX500_CORE is not set
> # CONFIG_EZX_PCAP is not set
> # CONFIG_AB8500_CORE is not set
> # CONFIG_REGULATOR is not set
> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> # CONFIG_DRM is not set
> # CONFIG_VGASTATE is not set
> # CONFIG_VIDEO_OUTPUT_CONTROL is not set
> # CONFIG_FB is not set
> # CONFIG_BACKLIGHT_LCD_SUPPORT is not set
> =

> #
> # Display device support
> #
> # CONFIG_DISPLAY_SUPPORT is not set
> =

> #
> # Console display driver support
> #
> CONFIG_DUMMY_CONSOLE=3Dy
> # CONFIG_SOUND is not set
> # CONFIG_HID_SUPPORT is not set
> # CONFIG_USB_SUPPORT is not set
> # CONFIG_MMC is not set
> # CONFIG_MEMSTICK is not set
> # CONFIG_NEW_LEDS is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_EDAC is not set
> # CONFIG_RTC_CLASS is not set
> # CONFIG_DMADEVICES is not set
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_UIO is not set
> # CONFIG_STAGING is not set
> =

> #
> # File systems
> #
> CONFIG_FILE_LOCKING=3Dy
> # CONFIG_FSNOTIFY is not set
> # CONFIG_DNOTIFY is not set
> # CONFIG_INOTIFY_USER is not set
> # CONFIG_QUOTA is not set
> # CONFIG_AUTOFS_FS is not set
> # CONFIG_AUTOFS4_FS is not set
> # CONFIG_FUSE_FS is not set
> =

> #
> # Caches
> #
> # CONFIG_FSCACHE is not set
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_HUGETLB_PAGE is not set
> # CONFIG_CONFIGFS_FS is not set
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_JFFS2_FS=3Dy
> CONFIG_JFFS2_FS_DEBUG=3D0
> CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
> # CONFIG_JFFS2_FS_WBUF_VERIFY is not set
> # CONFIG_JFFS2_SUMMARY is not set
> # CONFIG_JFFS2_FS_XATTR is not set
> # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> CONFIG_JFFS2_ZLIB=3Dy
> # CONFIG_JFFS2_LZO is not set
> CONFIG_JFFS2_RTIME=3Dy
> # CONFIG_JFFS2_RUBIN is not set
> # CONFIG_LOGFS is not set
> # CONFIG_ROMFS_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> # CONFIG_NLS_CODEPAGE_737 is not set
> # CONFIG_NLS_CODEPAGE_775 is not set
> # CONFIG_NLS_CODEPAGE_850 is not set
> # CONFIG_NLS_CODEPAGE_852 is not set
> # CONFIG_NLS_CODEPAGE_855 is not set
> # CONFIG_NLS_CODEPAGE_857 is not set
> # CONFIG_NLS_CODEPAGE_860 is not set
> # CONFIG_NLS_CODEPAGE_861 is not set
> # CONFIG_NLS_CODEPAGE_862 is not set
> # CONFIG_NLS_CODEPAGE_863 is not set
> # CONFIG_NLS_CODEPAGE_864 is not set
> # CONFIG_NLS_CODEPAGE_865 is not set
> # CONFIG_NLS_CODEPAGE_866 is not set
> # CONFIG_NLS_CODEPAGE_869 is not set
> # CONFIG_NLS_CODEPAGE_936 is not set
> # CONFIG_NLS_CODEPAGE_950 is not set
> # CONFIG_NLS_CODEPAGE_932 is not set
> # CONFIG_NLS_CODEPAGE_949 is not set
> # CONFIG_NLS_CODEPAGE_874 is not set
> # CONFIG_NLS_ISO8859_8 is not set
> # CONFIG_NLS_CODEPAGE_1250 is not set
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dy
> # CONFIG_NLS_ISO8859_2 is not set
> # CONFIG_NLS_ISO8859_3 is not set
> # CONFIG_NLS_ISO8859_4 is not set
> # CONFIG_NLS_ISO8859_5 is not set
> # CONFIG_NLS_ISO8859_6 is not set
> # CONFIG_NLS_ISO8859_7 is not set
> # CONFIG_NLS_ISO8859_9 is not set
> # CONFIG_NLS_ISO8859_13 is not set
> # CONFIG_NLS_ISO8859_14 is not set
> # CONFIG_NLS_ISO8859_15 is not set
> # CONFIG_NLS_KOI8_R is not set
> # CONFIG_NLS_KOI8_U is not set
> CONFIG_NLS_UTF8=3Dy
> # CONFIG_BINARY_PRINTF is not set
> =

> #
> # Library routines
> #
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_FIND_LAST_BIT=3Dy
> CONFIG_CRC_CCITT=3Dy
> # CONFIG_CRC16 is not set
> # CONFIG_CRC_T10DIF is not set
> # CONFIG_CRC_ITU_T is not set
> CONFIG_CRC32=3Dy
> # CONFIG_CRC7 is not set
> # CONFIG_LIBCRC32C is not set
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_GENERIC_ATOMIC64=3Dy
> =

> #
> # Kernel hacking
> #
> # CONFIG_PRINTK_TIME is not set
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=3D1024
> # CONFIG_MAGIC_SYSRQ is not set
> # CONFIG_STRIP_ASM_SYMS is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> # CONFIG_DEBUG_FS is not set
> # CONFIG_HEADERS_CHECK is not set
> # CONFIG_DEBUG_KERNEL is not set
> # CONFIG_HARDLOCKUP_DETECTOR is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # CONFIG_DEBUG_MEMORY_INIT is not set
> # CONFIG_RCU_CPU_STALL_DETECTOR is not set
> # CONFIG_SYSCTL_SYSCALL_CHECK is not set
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> # CONFIG_FTRACE is not set
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_ATOMIC64_SELFTEST is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_PPC_DISABLE_WERROR is not set
> CONFIG_PPC_WERROR=3Dy
> CONFIG_PRINT_STACK_DEPTH=3D64
> # CONFIG_PPC_EARLY_DEBUG is not set
> =

> #
> # Security options
> #
> # CONFIG_KEYS is not set
> # CONFIG_SECURITY is not set
> # CONFIG_SECURITYFS is not set
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
> # CONFIG_CRYPTO is not set
> # CONFIG_PPC_CLOCK is not set
> # CONFIG_VIRTUALIZATION is not set

> /*
>  * Device Tree Generator version: 1.3
>  *
>  * (C) Copyright 2007-2008 Xilinx, Inc.
>  * (C) Copyright 2007-2009 Michal Simek
>  *
>  * Michal SIMEK <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
>  *
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU General Public License as
>  * published by the Free Software Foundation; either version 2 of
>  * the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
>  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>  * GNU General Public License for more details.
>  *
>  * You should have received a copy of the GNU General Public License
>  * along with this program; if not, write to the Free Software
>  * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
>  * MA 02111-1307 USA
>  *
>  * CAUTION: This file is automatically generated by libgen.
>  * Version: Xilinx EDK 10.1.03 EDK_K_SP3.6
>  *
>  * XPS project directory: macsoft5
>  */
> =

> /dts-v1/;
> / {
> 	#address-cells =3D <1>;
> 	#size-cells =3D <1>;
> 	compatible =3D "xlnx,virtex405", "xlnx,virtex";
> 	model =3D "testing";
> 	Generic_SDRAM: memory@0 {
> 		device_type =3D "memory";
> 		reg =3D < 0x0 0x800000 >;
> 	} ;
> 	aliases {
> 		serial0 =3D &RS232;
> 		serial1 =3D &RS232_1;
> 	} ;
> 	chosen {
> 		bootargs =3D "console=3DttyUL0";
> 		linux,stdout-path =3D "/plb@0/opb@40000000/serial@40620000";
> 	} ;
> 	cpus {
> 		#address-cells =3D <1>;
> 		#cpus =3D <0x1>;
> 		#size-cells =3D <0>;
> 		ppc405_0: cpu@0 {
> 			clock-frequency =3D <200000000>;
> 			compatible =3D "PowerPC,405", "ibm,ppc405";
> 			d-cache-line-size =3D <0x20>;
> 			d-cache-size =3D <0x4000>;
> 			dcr-access-method =3D "native";
> 			dcr-controller ;
> 			device_type =3D "cpu";
> 			i-cache-line-size =3D <0x20>;
> 			i-cache-size =3D <0x4000>;
> 			model =3D "PowerPC,405";
> 			reg =3D <0>;
> 			timebase-frequency =3D <200000000>;
> 			xlnx,apu-control =3D <0xde00>;
> 			xlnx,apu-udi-1 =3D <0xa18983>;
> 			xlnx,apu-udi-2 =3D <0xa38983>;
> 			xlnx,apu-udi-3 =3D <0xa589c3>;
> 			xlnx,apu-udi-4 =3D <0xa789c3>;
> 			xlnx,apu-udi-5 =3D <0xa98c03>;
> 			xlnx,apu-udi-6 =3D <0xab8c03>;
> 			xlnx,apu-udi-7 =3D <0xad8c43>;
> 			xlnx,apu-udi-8 =3D <0xaf8c43>;
> 			xlnx,deterministic-mult =3D <0x0>;
> 			xlnx,disable-operand-forwarding =3D <0x1>;
> 			xlnx,mmu-enable =3D <0x1>;
> 			xlnx,pvr-high =3D <0x0>;
> 			xlnx,pvr-low =3D <0x0>;
> 		} ;
> 	} ;
> 	plb: plb@0 {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <1>;
> 		compatible =3D "xlnx,plb-v34-1.02.a", "simple-bus";
> 		ranges ;
> 		Generic_SDRAM: plb-sdram@0 {
> 			compatible =3D "xlnx,plb-sdram-1.00.e";
> 			reg =3D < 0x0 0x800000 >;
> 			xlnx,family =3D "virtex4";
> 			xlnx,include-burst-cacheln-support =3D <0x1>;
> 			xlnx,include-highspeed-pipe =3D <0x1>;
> 			xlnx,sdram-awidth =3D <0xc>;
> 			xlnx,sdram-bank-awidth =3D <0x2>;
> 			xlnx,sdram-cas-lat =3D <0x2>;
> 			xlnx,sdram-col-awidth =3D <0x8>;
> 			xlnx,sdram-dwidth =3D <0x10>;
> 			xlnx,sdram-refresh-numrows =3D <0x1000>;
> 			xlnx,sdram-tccd =3D <0x1>;
> 			xlnx,sdram-tmrd =3D <0x2>;
> 			xlnx,sdram-tras =3D <0x9c40>;
> 			xlnx,sdram-trc =3D <0xfde8>;
> 			xlnx,sdram-trcd =3D <0x4e20>;
> 			xlnx,sdram-tref =3D <0x40>;
> 			xlnx,sdram-trefi =3D <0xee6b28>;
> 			xlnx,sdram-trfc =3D <0x124f8>;
> 			xlnx,sdram-trp =3D <0x4e20>;
> 			xlnx,sdram-trrd =3D <0x3a98>;
> 			xlnx,sdram-twr =3D <0x3a98>;
> 			xlnx,sim-init-time-ps =3D <0x5f5e100>;
> 			xlnx,use-posedge-outregs =3D <0x0>;
> 		} ;
> 		opb: opb@40000000 {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <1>;
> 			compatible =3D "xlnx,opb-v20-1.10.c", "simple-bus";
> 			ranges =3D < 0x40000000 0x40000000 0x40000000 >;
> 			RS232: serial@40620000 {
> 				clock-frequency =3D "";
> 				compatible =3D "xlnx,opb-uartlite-1.00.b";
> 				current-speed =3D <115200>;
> 				device_type =3D "serial";
> 				interrupt-parent =3D <&opb_intc_0>;
> 				interrupts =3D < 5 0 >;
> 				port-number =3D <0>;
> 				reg =3D < 0x40620000 0x10000 >;
> 				xlnx,baudrate =3D <0x1c200>;
> 				xlnx,clk-freq =3D <0x5f5e100>;
> 				xlnx,data-bits =3D <0x8>;
> 				xlnx,odd-parity =3D <0x1>;
> 				xlnx,use-parity =3D <0x0>;
> 			} ;
> 			RS232_1: serial@40600000 {
> 				clock-frequency =3D "";
> 				compatible =3D "xlnx,opb-uartlite-1.00.b";
> 				current-speed =3D <115200>;
> 				device_type =3D "serial";
> 				interrupt-parent =3D <&opb_intc_0>;
> 				interrupts =3D < 4 0 >;
> 				port-number =3D <1>;
> 				reg =3D < 0x40600000 0x10000 >;
> 				xlnx,baudrate =3D <0x1c200>;
> 				xlnx,clk-freq =3D <0x5f5e100>;
> 				xlnx,data-bits =3D <0x8>;
> 				xlnx,odd-parity =3D <0x1>;
> 				xlnx,use-parity =3D <0x0>;
> 			} ;
> 			opb_intc_0: interrupt-controller@41200000 {
> 				#interrupt-cells =3D <0x2>;
> 				compatible =3D "xlnx,opb-intc-1.00.c", "xlnx,xps-intc-1.00.a";
> 				interrupt-controller ;
> 				reg =3D < 0x41200000 0x10000 >;
> 				xlnx,kind-of-intr =3D <0x30>;
> 				xlnx,num-intr-inputs =3D <0x6>;
> 			} ;
> 			opb_spi_0: opb-spi@55000000 {
> 				compatible =3D "xlnx,opb-spi-1.00.e";
> 				interrupt-parent =3D <&opb_intc_0>;
> 				interrupts =3D < 2 2 >;
> 				reg =3D < 0x55000000 0x10000 >;
> 				xlnx,depth =3D <0x10>;
> 				xlnx,dev-blk-id =3D <0x4>;
> 				xlnx,dev-mir-enable =3D <0x0>;
> 				xlnx,family =3D "virtex4";
> 				xlnx,fifo-exist =3D <0x1>;
> 				xlnx,interrupt-present =3D <0x1>;
> 				xlnx,ip-reg-bar-offset =3D <0x60>;
> 				xlnx,num-bits-reg =3D <0x8>;
> 				xlnx,num-bits-sr =3D <0x8>;
> 				xlnx,num-offchip-ss-bits =3D <0x4>;
> 				xlnx,num-ss-bits =3D <0x4>;
> 				xlnx,occupancy-num-bits =3D <0x4>;
> 				xlnx,spi-slave-only =3D <0x0>;
> 				#address-cells =3D <1>;
> 				#size-cells =3D <0>;
> 				spi_flash@0 {
> 					compatible =3D "stm,m25p32", "m25p80";
> 					reg =3D <0>;
> 					spi-max-frequency =3D <10000000>;
> 				};
> 				spi_flash@1 {
> 					compatible =3D "stm,m25p32", "m25p80";
> 					reg =3D <1>;
> 					spi-max-frequency =3D <10000000>;
> 					#address-cells =3D <1>;
> 					#size-cells =3D <1>;
> 					partition@0x00000000 {
> 						label =3D "test-part1";
> 						reg =3D <0x00000000 0x00400000>;
> 					};
> 				};
> 			} ;
> 		} ;
> 	} ;
> }  ;
