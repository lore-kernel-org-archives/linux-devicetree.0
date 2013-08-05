From: Michal Nazarewicz <mina86@mina86.com>
Subject: Re: [PATCH v4 3/4] drivers: of: add initialization code for dma
 reserved memory
Date: Mon, 05 Aug 2013 20:59:23 +0200
Message-ID: <xa1teha8ufp0.fsf@mina86.com>
References: <1375275119-12787-1-git-send-email-m.szyprowski@samsung.com>
 <1375275119-12787-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1375275119-12787-4-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, devicetree-discuss@lists.ozlabs.org
Cc: Laura Abbott <lauraa@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Marc <marc.ceeeee@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>, Sascha Hauer <s.hauer@pengutronix.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31 2013, Marek Szyprowski wrote:
> Add device tree support for contiguous and reserved memory regions
> defined in device tree. Initialization is done in 2 steps. First, the
> memory is reserved, what happens very early when only flattened device
> tree is available. Then on device initialization the corresponding cma
> and reserved regions are assigned to each device structure.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Acked-by: Michal Nazarewicz <mina86@mina86.com>

Minor comments inline.

> ---
>  Documentation/devicetree/bindings/memory.txt |  152 ++++++++++++++++++++=
++
>  drivers/of/Kconfig                           |    6 +
>  drivers/of/Makefile                          |    1 +
>  drivers/of/of_reserved_mem.c                 |  175 ++++++++++++++++++++=
++++++
>  include/asm-generic/dma-coherent.h           |    6 +
>  5 files changed, 340 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory.txt
>  create mode 100644 drivers/of/of_reserved_mem.c
>
> diff --git a/Documentation/devicetree/bindings/memory.txt b/Documentation=
/devicetree/bindings/memory.txt
> new file mode 100644
> index 0000000..4aece19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory.txt
> @@ -0,0 +1,152 @@
> +*** Memory binding ***
> +
> +The /memory node provides basic information about the address and size
> +of the physical memory. This node is usually filled or updated by the
> +bootloader, depending on the actual memory configuration of the given
> +hardware.
> +
> +The memory layout is described by the folllowing node:
> +
> +memory {
> +	reg =3D  <(baseaddr1) (size1)
> +		(baseaddr2) (size2)
> +		...
> +		(baseaddrN) (sizeN)>;
> +};
> +
> +baseaddrX:	the base address of the defined memory bank
> +sizeX:		the size of the defined memory bank
> +
> +More than one memory bank can be defined.
> +
> +
> +*** Reserved memory regions ***
> +
> +In /memory/reserved-memory node one can create additional nodes
> +describing particular reserved (excluded from normal use) memory
> +regions. Such memory regions are usually designed for the special usage
> +by various device drivers. A good example are contiguous memory
> +allocations or memory sharing with other operating system on the same
> +hardware board. Those special memory regions might depend on the board
> +configuration and devices used on the target system.
> +
> +Parameters for each memory region can be encoded into the device tree
> +wit the following convention:
> +
> +[(label):] (name)@(address) {
> +	compatible =3D "contiguous-memory-region", "reserved-memory-region";
> +	reg =3D <(address) (size)>;
> +	(linux,contiguous-region);
> +	(linux,default-contiguous-region);
> +};
> +
> +label:		label given to the defined region (optional)
> +name:		an name given to the defined region
> +address:	the base address of the defined region
> +size:		the size of the memory region
> +
> +compatible:	"contiguous-memory-region" - enables binding of this
> +		region to Contiguous Memory Allocator (special region for
> +		contiguous memory allocations, shared with movable system
> +		memory, Linux kernel-specific), alternatively if
> +		"reserved-memory-region" - compatibility is defined, given
> +		region is assigned for exclusive usage for DMA transfers
> +
> +linux,default-contiguous-region: property indicating that the region
> +		is the default region for all contiguous memory
> +		allocations, Linux specific (optional)
> +
> +Each defined region must use unique name. It is optional to specify the
> +base address, so if one wants to use autoconfiguration of the base
> +address, he must specify the '0' as base address in the 'reg' property
> +and assign ann uniqe name to such regions.
> +
> +
> +*** Device node's properties ***
> +
> +Once the regions in the /memory/reserved-memory node are defined, they
> +can be assigned to device nodes to enable drivers for their special use.
> +The following properties are defined:
> +
> +dma-memory-region =3D <&phandle_to_defined_region>;
> +
> +This property indicates that the device driver should use the
> +memory region pointed by the given phandle.
> +
> +
> +*** Example ***
> +
> +This example defines a memory consisting of 4 memory banks. 3 contiguous
> +regions are defined for Linux kernel, one default of all device drivers
> +(named contig_mem, placed at 0x72000000, 64MiB), one dedicated to the
> +framebuffer device (labelled display_mem, placed at 0x78000000, 8MiB)
> +and one for multimedia processing (labelled multimedia_mem, placed at
> +0x77000000, 64MiB). 'display_mem' region is then assigned to fb@12300000
> +device for DMA memory allocations (Linux kernel drivers will use CMA is
> +available or dma-exclusive usage otherwise). 'multimedia_mem' is
> +assigned to scaller@12500000 and codec@12600000 devices for contiguous
> +memory allocations when CMA driver is enabled.
> +
> +The reason for creating a separate region for framebuffer device is to
> +match the framebuffer base address to the one configured by bootloader,
> +so once Linux kernel drivers starts no glitches on the displayed boot
> +logo appears. Scaller and codec drivers should share the memory
> +allocations.
> +
> +/ {
> +	/* ... */
> +	memory {
> +		reg =3D  <0x40000000 0x10000000
> +			0x50000000 0x10000000
> +			0x60000000 0x10000000
> +			0x70000000 0x10000000>;
> +
> +		reserved-memory {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			/*
> +			 * global autoconfigured region for contiguous allocations
> +			 * (used only with Contiguous Memory Allocator)
> +			 */
> +			contig_region@0 {
> +				compatible =3D "contiguous-memory-region";
> +				reg =3D <0x0 0x4000000>;
> +				linux,default-contiguous-region;
> +			};
> +
> +			/*
> +			 * special region for framebuffer
> +			 */
> +			display_mem: region@78000000 {
> +				compatible =3D "contiguous-memory-region", "reserved-memory-region";
> +				reg =3D <0x78000000 0x800000>;
> +			};
> +
> +			/*
> +			 * special region for multimedia processing devices
> +			 */
> +			multimedia_mem: region@77000000 {
> +				compatible =3D "contiguous-memory-region";
> +				reg =3D <0x77000000 0x4000000>;
> +			};
> +		};
> +	};
> +
> +	/* ... */
> +
> +	fb0: fb@12300000 {
> +		status =3D "okay";
> +		dma-memory-region =3D <&display_mem>;
> +	};
> +
> +	scaller: scaller@12500000 {
> +		status =3D "okay";
> +		dma-memory-region =3D <&multimedia_mem>;
> +	};
> +
> +	codec: codec@12600000 {
> +		status =3D "okay";
> +		dma-memory-region =3D <&multimedia_mem>;
> +	};
> +};
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 80e5c13..a83ab43 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -80,4 +80,10 @@ config OF_MTD
>  	depends on MTD
>  	def_bool y
>=20=20
> +config OF_RESERVED_MEM
> +	depends on CMA || (HAVE_GENERIC_DMA_COHERENT && HAVE_MEMBLOCK)
> +	def_bool y
> +	help
> +	  Initialization code for DMA reserved memory
> +
>  endmenu # OF
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index 1f9c0c4..e7e3322 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_OF_MDIO)	+=3D of_mdio.o
>  obj-$(CONFIG_OF_PCI)	+=3D of_pci.o
>  obj-$(CONFIG_OF_PCI_IRQ)  +=3D of_pci_irq.o
>  obj-$(CONFIG_OF_MTD)	+=3D of_mtd.o
> +obj-$(CONFIG_OF_RESERVED_MEM) +=3D of_reserved_mem.o
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> new file mode 100644
> index 0000000..d97fcdf
> --- /dev/null
> +++ b/drivers/of/of_reserved_mem.c
> @@ -0,0 +1,175 @@
> +/*
> + * Device tree based initialization code for reserved memory.
> + *
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + * Author: Marek Szyprowski <m.szyprowski@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of the
> + * License or (at your optional) any later version of the license.
> + */
> +
> +#include <asm/dma-contiguous.h>
> +
> +#include <linux/memblock.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_platform.h>
> +#include <linux/mm.h>
> +#include <linux/sizes.h>
> +#include <linux/mm_types.h>
> +#include <linux/dma-contiguous.h>
> +#include <linux/dma-mapping.h>
> +
> +#define MAX_RESERVED_REGIONS	16
> +struct reserved_mem {
> +	phys_addr_t		base;
> +	unsigned long		size;
> +	struct cma		*cma;
> +	char			name[32];
> +};
> +static struct reserved_mem reserved_mem[MAX_RESERVED_REGIONS];
> +static int reserved_mem_count;
> +
> +static int __init reserved_mem_fdt_scan(unsigned long node, const char *=
uname,
> +				    int depth, void *data)
> +{
> +	phys_addr_t base, size;
> +	int is_cma, is_reserved;
> +	unsigned long len;
> +	void *prop;
> +
> +	is_cma =3D of_flat_dt_is_compatible(node, "contiguous-memory-region");

Perhaps:

+	is_cma =3D IS_ENABLED(CONFIG_CMA) &&=20
+		of_flat_dt_is_compatible(node, "contiguous-memory-region");

which will save on typing IS_ENABLED(CONFIG_CMA) later on.

> +	is_reserved =3D of_flat_dt_is_compatible(node, "reserved-memory-region"=
);

is_reserved value is used only if !is_cma, so maybe skip computing it if
is_cma?  Just a thought.

> +
> +	if (!is_reserved && !(is_cma && IS_ENABLED(CONFIG_CMA)))
> +		return 0;
> +
> +	prop =3D of_get_flat_dt_prop(node, "reg", &len);
> +	if (!prop || (len !=3D 2 * sizeof(unsigned long))) {
> +		pr_err("Reserved mem: node %s, incorrect \"reg\" property\n",
> +		       uname);
> +		return 0;
> +	}
> +
> +	if (sizeof(unsigned long) =3D=3D 4) {
> +		base =3D be32_to_cpu(((__be32 *)prop)[0]);
> +		size =3D be32_to_cpu(((__be32 *)prop)[1]);
> +	} else {
> +		base =3D be64_to_cpu(((__be64 *)prop)[0]);
> +		size =3D be64_to_cpu(((__be64 *)prop)[1]);
> +	}
> +
> +	pr_info("Reserved mem: found %s, memory base %lx, size %ld MiB\n",
> +		uname, (unsigned long)base, (unsigned long)size / SZ_1M);
> +
> +	if (reserved_mem_count =3D=3D ARRAY_SIZE(reserved_mem))
> +		return -ENOMEM;

+		return -ENOSPC;

> +
> +	reserved_mem[reserved_mem_count].base =3D base;
> +	reserved_mem[reserved_mem_count].size =3D size;
> +	strcpy(reserved_mem[reserved_mem_count].name, uname);

strlcpy(reserved_mem[reserved_mem_count].name,
        sizeof(reserved_mem[reserved_mem_count].name), uname);

> +
> +	if (IS_ENABLED(CONFIG_CMA) && is_cma) {
> +		struct cma *cma;
> +		if (dma_contiguous_reserve_area(size, base, 0, &cma) =3D=3D 0) {
> +			reserved_mem[reserved_mem_count].cma =3D cma;
> +			reserved_mem_count++;
> +
> +			if (of_get_flat_dt_prop(node,
> +						"linux,default-contiguous-region",
> +						NULL))
> +				dma_contiguous_set_default_area(cma);
> +		}
> +	} else if (is_reserved) {
> +		if (memblock_remove(base, size) =3D=3D 0)
> +			reserved_mem_count++;
> +		else
> +			pr_err("Failed to reserve memory for %s\n", uname);
> +	}
> +
> +	return 0;
> +}

> diff --git a/include/asm-generic/dma-coherent.h b/include/asm-generic/dma=
-coherent.h
> index 2be8a2d..06111d00 100644
> --- a/include/asm-generic/dma-coherent.h
> +++ b/include/asm-generic/dma-coherent.h
> @@ -32,4 +32,10 @@ dma_mark_declared_memory_occupied(struct device *dev,
>  #define dma_mmap_from_coherent(dev, vma, vaddr, order, ret) (0)
>  #endif
>=20=20
> +#ifdef CONFIG_OF_RESERVED_MEM
> +void __init dma_reserved_mem_of_reserve(void);
> +#else
> +#define dma_reserved_mem_of_reserve()

+#define dma_reserved_mem_of_reserve() (void)0

> +#endif
> +
>  #endif

--=20
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=3D./ `o
..o | Computer Science,  Micha=C5=82 =E2=80=9Cmina86=E2=80=9D Nazarewicz   =
 (o o)
ooo +----<email/xmpp: mpn@google.com>--------------ooO--(_)--Ooo--
--=-=-=
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: text/plain


--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJR//YLAAoJECBgQBJQdR/026kP/jLSqQy9GQTYL0utEjUyh+ym
hpGh+Bft6L6n0bFXtQZMwnZIbWJYQvgEjvEXoEIyKQSQxGMScWSvIJ9j3QUvQ67d
BLbJlRHgglJD9UaSebgSJPWoBFjbHsJVXXX5ccVQ9ZKJFnCMpShoDX44SPqwH+LY
yAD04G0G80MCXZDJw7a/u2v3otkbiV4YmYeaO57RsfKdu/IMGOYLCE46g1IJBVYB
BFQRlm2VNlIhQYjcbnz/+6e49HOyvcVHvtVDKcHjelJHGjwsyXStiZQIIJawEm/o
a2Au6MoNmOTE9arB0qUxPoeHR0v4QOOHr4w0N81B3B10hAUTxT1yJYm3Nuvkjp3P
j+TrpKS7a/nnJn++CULcn6Y7kVUwEH6sTKI0BpvH9+8nj7Nk/xUprRjpXjc17kTL
+SnDVeQ2UVHTyb5PRKS5TCoQ3WhAnol8djqshCTR0hGCXBjD14UooAGxUUCA48VY
o9ay5MELpi47Spxdm8W66mm05XkJcBRf6mz7C5x1S9u6+EyOkozhohyj3frAR0tx
gnEQ4Y0Y10yJFGi9tRTkR6jCVUv0behJ3Yi+azsojsX9U3YhgwqqJOA+TshxaNou
4XGNSlK0uHv4WXhDqKypbIFeDltwIj1c1K6Ke4jb2Iz7Pl793Nel5WTRpvNa8MTB
9ToHQfhdtYXNvGM0oyCe
=uPAY
-----END PGP SIGNATURE-----
--==-=-=--

--=-=-=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=-=-=--
