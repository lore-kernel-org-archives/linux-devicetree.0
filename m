From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] MIPS: PowerTV: Add device tree support
Date: Thu, 29 Jul 2010 12:56:23 -0600
Message-ID: <AANLkTim7MEyGFiedDrbWiNiZb18Qy3a5ZZ=aYBh4Jj7L@mail.gmail.com>
References: <20100727215337.GA29365@dediao-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100727215337.GA29365-xfMjgo8mR/VtOC46+g3osbQa8qPdvLwY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dezhong Diao <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Just noticed something....

On Tue, Jul 27, 2010 at 3:53 PM, Dezhong Diao <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
> V2:
> =A0 =A0Synchronize with test-devicetree branch of device tree.
>
> V1:
> =A0 =A0Add device tree support for PowerTV.
> =A0 =A0Customize user-defined memory scan function.
>
> Signed-off-by: Dezhong Diao <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> ---
> =A0arch/mips/configs/powertv_defconfig =A0 =A0 =A0 =A0| =A0293 ++++++++++=
+++++++++++-------
> =A0arch/mips/include/asm/mach-powertv/asic.h =A0| =A0 =A08 +-
> =A0arch/mips/include/asm/mach-powertv/mdesc.h | =A0 51 +++++
> =A0arch/mips/powertv/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0arch/mips/powertv/asic/asic_devices.c =A0 =A0 =A0| =A0 22 --
> =A0arch/mips/powertv/mdesc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0224 =
+++++++++++++++++++++
> =A0arch/mips/powertv/memory.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0242 ++=
++++++++++++---------
> =A07 files changed, 649 insertions(+), 193 deletions(-)
> =A0create mode 100644 arch/mips/include/asm/mach-powertv/mdesc.h
> =A0create mode 100644 arch/mips/powertv/mdesc.c
>
> diff --git a/arch/mips/powertv/mdesc.c b/arch/mips/powertv/mdesc.c
> new file mode 100644
> index 0000000..8a7b972
> --- /dev/null
> +++ b/arch/mips/powertv/mdesc.c
[...]
> +static int __init early_init_dt_scan_extent(unsigned long node,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *uname, int depth, void *data)
> +{
> + =A0 =A0 =A0 char buf[8 + log10_extent(MEM_EXTENT_MAX)];
> + =A0 =A0 =A0 unsigned long l;
> + =A0 =A0 =A0 char *memory_type;
> + =A0 =A0 =A0 enum Memory_Type type;
> + =A0 =A0 =A0 cell_t *reg, *endp;
> + =A0 =A0 =A0 unsigned long phys_base, bus_base;
> + =A0 =A0 =A0 unsigned long size;
> +
> + =A0 =A0 =A0 snprintf(buf, sizeof(buf), "memory@%d", num_extent);
> +
> + =A0 =A0 =A0 if (strcmp(uname, buf) !=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 memory_type =3D of_get_flat_dt_prop(node, "memory_type", &l=
);
> + =A0 =A0 =A0 if (memory_type =3D=3D NULL || l <=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 if (strcmp(memory_type, "low") =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 type =3D MEM_EXTENT_LOW;
> + =A0 =A0 =A0 else if (strcmp(memory_type, "high") =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 type =3D MEM_EXTENT_HIGH;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 type =3D MEM_EXTENT_OTHER;
> +
> + =A0 =A0 =A0 reg =3D (cell_t *)of_get_flat_dt_prop(node, "reg", &l);
> + =A0 =A0 =A0 if (reg =3D=3D NULL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 endp =3D reg + (l / sizeof(cell_t));
> +
> + =A0 =A0 =A0 pr_info("memory scan node %s, reg size %ld, data: %x %x %x\=
n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uname, l, reg[0], reg[1], reg[2]);
> +
> + =A0 =A0 =A0 while ((endp - reg) >=3D (num_addr_cells + num_size_cells))=
 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 phys_base =3D dt_mem_next_cell(1, &reg);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus_base =3D dt_mem_next_cell(1, &reg);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 size =3D dt_mem_next_cell(1, &reg);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (size =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mem_desc_add(phys_base, bus_base, size, typ=
e);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 1;
> +}

What is the purpose of this function.  Why doesn't the normal memory
binding work for MIPS?

> +int __init early_init_dt_scan_memory_arch(unsigned long node,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *uname, int depth, void *data)
> +{
> + =A0 =A0 =A0 u32 *prop;
> +
> + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#address-cells", NULL);
> + =A0 =A0 =A0 num_addr_cells =3D (prop =3D=3D NULL) ? 2 : *prop;
> +
> + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#size-cells", NULL);
> + =A0 =A0 =A0 num_size_cells =3D (prop =3D=3D NULL) ? 1 : *prop;

Nack.  Fix your device tree data.  :-)

g.
