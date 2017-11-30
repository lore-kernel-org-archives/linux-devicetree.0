From: James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>
Subject: Re: [PATCH v4 3/8] MIPS: Octeon: Add a global resource manager.
Date: Thu, 30 Nov 2017 22:53:33 +0000
Message-ID: <20171130225333.GI27409@jhogan-linux.mipstec.com>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-4-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zq44+AAfm4giZpo5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171129005540.28829-4-david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--zq44+AAfm4giZpo5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2017 at 04:55:35PM -0800, David Daney wrote:
> From: Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>=20
> Add a global resource manager to manage tagged pointers within
> bootmem allocated memory. This is used by various functional
> blocks in the Octeon core like the FPA, Ethernet nexus, etc.
>=20
> Signed-off-by: Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Steven J. Hill <Steven.Hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/mips/cavium-octeon/Makefile       |   3 +-
>  arch/mips/cavium-octeon/resource-mgr.c | 371 +++++++++++++++++++++++++++=
++++++
>  arch/mips/include/asm/octeon/octeon.h  |  18 ++
>  3 files changed, 391 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/cavium-octeon/resource-mgr.c
>=20
> diff --git a/arch/mips/cavium-octeon/Makefile b/arch/mips/cavium-octeon/M=
akefile
> index 7c02e542959a..0a299ab8719f 100644
> --- a/arch/mips/cavium-octeon/Makefile
> +++ b/arch/mips/cavium-octeon/Makefile
> @@ -9,7 +9,8 @@
>  # Copyright (C) 2005-2009 Cavium Networks
>  #
> =20
> -obj-y :=3D cpu.o setup.o octeon-platform.o octeon-irq.o csrc-octeon.o
> +obj-y :=3D cpu.o setup.o octeon-platform.o octeon-irq.o csrc-octeon.o \
> +	 resource-mgr.o

Maybe put that on a separate line like below.

>  obj-y +=3D dma-octeon.o
>  obj-y +=3D octeon-memcpy.o
>  obj-y +=3D executive/
> diff --git a/arch/mips/cavium-octeon/resource-mgr.c b/arch/mips/cavium-oc=
teon/resource-mgr.c
> new file mode 100644
> index 000000000000..ca25fa953402
> --- /dev/null
> +++ b/arch/mips/cavium-octeon/resource-mgr.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Resource manager for Octeon.
> + *
> + * This file is subject to the terms and conditions of the GNU General P=
ublic
> + * License.  See the file "COPYING" in the main directory of this archive
> + * for more details.
> + *
> + * Copyright (C) 2017 Cavium, Inc.
> + */
> +#include <linux/module.h>
> +
> +#include <asm/octeon/octeon.h>
> +#include <asm/octeon/cvmx-bootmem.h>
> +
> +#define RESOURCE_MGR_BLOCK_NAME		"cvmx-global-resources"
> +#define MAX_RESOURCES			128
> +#define INST_AVAILABLE			-88
> +#define OWNER				0xbadc0de
> +
> +struct global_resource_entry {
> +	struct global_resource_tag tag;
> +	u64 phys_addr;
> +	u64 size;
> +};
> +
> +struct global_resources {
> +#ifdef __LITTLE_ENDIAN_BITFIELD
> +	u32 rlock;
> +	u32 pad;
> +#else
> +	u32 pad;
> +	u32 rlock;
> +#endif
> +	u64 entry_cnt;
> +	struct global_resource_entry resource_entry[];
> +};
> +
> +static struct global_resources *res_mgr_info;
> +
> +
> +/*
> + * The resource manager interacts with software running outside of the
> + * Linux kernel, which necessitates locking to maintain data structure
> + * consistency.  These custom locking functions implement the locking
> + * protocol, and cannot be replaced by kernel locking functions that
> + * may use different in-memory structures.
> + */
> +
> +static void res_mgr_lock(void)
> +{
> +	unsigned int tmp;
> +	u64 lock =3D (u64)&res_mgr_info->rlock;

presumably this could be a u32 *, avoid the cast to u64, and still work
just fine below.

> +
> +	__asm__ __volatile__(
> +		".set noreorder\n"
> +		"1: ll   %[tmp], 0(%[addr])\n"
> +		"   bnez %[tmp], 1b\n"
> +		"   li   %[tmp], 1\n"

I believe the convention for .S files is for instructions in branch
delay slots to be indented an additional space for readability. Maybe
that would be worthwhile here.

> +		"   sc   %[tmp], 0(%[addr])\n"
> +		"   beqz %[tmp], 1b\n"
> +		"   nop\n"

and here also.

> +		".set reorder\n" :

nit: strictly speaking there's no need for \n on the last line.

> +		[tmp] "=3D&r"(tmp) :
> +		[addr] "r"(lock) :
> +		"memory");

minor style thing: its far more common to have : at the beginning of the
line rather than the end.

> +}
> +
> +static void res_mgr_unlock(void)
> +{
> +	u64 lock =3D (u64)&res_mgr_info->rlock;

same again

> +
> +	/* Wait until all resource operations finish before unlocking. */
> +	mb();
> +	__asm__ __volatile__(
> +		"sw $0, 0(%[addr])\n" : :
> +		[addr] "r"(lock) :
> +		"memory");
> +
> +	/* Force a write buffer flush. */
> +	mb();
> +}
> +
> +static int res_mgr_find_resource(struct global_resource_tag tag)
> +{
> +	struct global_resource_entry *res_entry;
> +	int i;
> +
> +	for (i =3D 0; i < res_mgr_info->entry_cnt; i++) {
> +		res_entry =3D &res_mgr_info->resource_entry[i];
> +		if (res_entry->tag.lo =3D=3D tag.lo && res_entry->tag.hi =3D=3D tag.hi)
> +			return i;
> +	}
> +	return -1;
> +}
> +
> +/**
> + * res_mgr_create_resource - Create a resource.
> + * @tag: Identifies the resource.
> + * @inst_cnt: Number of resource instances to create.
> + *
> + * Returns 0 if the source was created successfully.
> + * Returns <0 for error codes.

Only -1 seems to be returned. Is it worth returning some standard Linux
error codes instead?

> + */
> +int res_mgr_create_resource(struct global_resource_tag tag, int inst_cnt)
> +{
> +	struct global_resource_entry *res_entry;
> +	u64 size;
> +	u64 *res_addr;
> +	int res_index, i, rc =3D 0;
> +
> +	res_mgr_lock();
> +
> +	/* Make sure resource doesn't already exist. */
> +	res_index =3D res_mgr_find_resource(tag);
> +	if (res_index >=3D 0) {
> +		rc =3D -1;
> +		goto err;
> +	}
> +
> +	if (res_mgr_info->entry_cnt >=3D MAX_RESOURCES) {
> +		pr_err("Resource max limit reached, not created\n");
> +		rc =3D -1;
> +		goto err;
> +	}
> +
> +	/*
> +	 * Each instance is kept in an array of u64s. The first array element
> +	 * holds the number of allocated instances.
> +	 */
> +	size =3D sizeof(u64) * (inst_cnt + 1);
> +	res_addr =3D cvmx_bootmem_alloc_range(size, CVMX_CACHE_LINE_SIZE, 0, 0);
> +	if (!res_addr) {
> +		pr_err("Failed to allocate resource. not created\n");
> +		rc =3D -1;
> +		goto err;
> +	}
> +
> +	/* Initialize the newly created resource. */
> +	*res_addr =3D inst_cnt;
> +	for (i =3D 1; i < inst_cnt + 1; i++)

or "i <=3D inst_cnt"?

> +		*(res_addr + i) =3D INST_AVAILABLE;

Nit: IMO res_addr[i] is marginally more readable

> +
> +	res_index =3D res_mgr_info->entry_cnt;
> +	res_entry =3D &res_mgr_info->resource_entry[res_index];
> +	res_entry->tag.lo =3D tag.lo;
> +	res_entry->tag.hi =3D tag.hi;

or res_entry->tag =3D tag;?

> +	res_entry->phys_addr =3D virt_to_phys(res_addr);
> +	res_entry->size =3D size;
> +	res_mgr_info->entry_cnt++;
> +
> +err:
> +	res_mgr_unlock();
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL(res_mgr_create_resource);
> +
> +/**
> + * res_mgr_alloc_range - Allocate a range of resource instances.

I don't know how strict kerndoc is on this, but I think it should be
res_mgr_alloc_range() here. Same elsewhere.

> + * @tag: Identifies the resource.
> + * @req_inst: Requested start of instance range to allocate.
> + *	      Range instances are guaranteed to be sequential
> + *	      (-1 for don't care).
> + * @req_cnt: Number of instances to allocate.
> + * @use_last_avail: Set to request the last available instance.
> + * @inst: Updated with the allocated instances.
> + *
> + * Returns 0 if the source was created successfully.
> + * Returns <0 for error codes.
> + */
> +int res_mgr_alloc_range(struct global_resource_tag tag, int req_inst,
> +			int req_cnt, bool use_last_avail, int *inst)
> +{
> +	struct global_resource_entry *res_entry;
> +	int res_index;
> +	u64 *res_addr;
> +	u64 inst_cnt;
> +	int alloc_cnt, i, rc =3D -1;
> +
> +	/* Start with no instances allocated. */
> +	for (i =3D 0; i < req_cnt; i++)
> +		inst[i] =3D INST_AVAILABLE;
> +
> +	res_mgr_lock();
> +
> +	/* Find the resource. */
> +	res_index =3D res_mgr_find_resource(tag);
> +	if (res_index < 0) {
> +		pr_err("Resource not found, can't allocate instance\n");
> +		goto err;
> +	}
> +
> +	/* Get resource data. */
> +	res_entry =3D &res_mgr_info->resource_entry[res_index];
> +	res_addr =3D phys_to_virt(res_entry->phys_addr);
> +	inst_cnt =3D *res_addr;
> +
> +	/* Allocate the requested instances. */
> +	if (req_inst >=3D 0) {
> +		/* Specific instance range requested. */
> +		if (req_inst + req_cnt >=3D inst_cnt) {
> +			pr_err("Requested instance out of range\n");
> +			goto err;
> +		}
> +
> +		for (i =3D 0; i < req_cnt; i++) {
> +			if (*(res_addr + req_inst + 1 + i) =3D=3D INST_AVAILABLE)
> +				inst[i] =3D req_inst + i;
> +			else {

braces on all branches if on any.

> +				inst[0] =3D INST_AVAILABLE;
> +				break;
> +			}
> +		}
> +	} else if (use_last_avail) {
> +		/* Last available instance requested. */
> +		alloc_cnt =3D 0;
> +		for (i =3D inst_cnt; i > 0; i--) {
> +			if (*(res_addr + i) =3D=3D INST_AVAILABLE) {
> +				/*
> +				 * Instance off by 1 (first element holds the
> +				 * count).
> +				 */
> +				inst[alloc_cnt] =3D i - 1;
> +
> +				alloc_cnt++;
> +				if (alloc_cnt =3D=3D req_cnt)
> +					break;
> +			}
> +		}
> +
> +		if (i =3D=3D 0)
> +			inst[0] =3D INST_AVAILABLE;
> +	} else {
> +		/* Next available instance requested. */
> +		alloc_cnt =3D 0;
> +		for (i =3D 1; i <=3D inst_cnt; i++) {
> +			if (*(res_addr + i) =3D=3D INST_AVAILABLE) {
> +				/*
> +				 * Instance off by 1 (first element holds the
> +				 * count).
> +				 */
> +				inst[alloc_cnt] =3D i - 1;
> +
> +				alloc_cnt++;
> +				if (alloc_cnt =3D=3D req_cnt)
> +					break;
> +			}
> +		}
> +
> +		if (i > inst_cnt)
> +			inst[0] =3D INST_AVAILABLE;
> +	}
> +
> +	if (inst[0] !=3D INST_AVAILABLE) {
> +		for (i =3D 0; i < req_cnt; i++)
> +			*(res_addr + inst[i] + 1) =3D OWNER;
> +		rc =3D 0;
> +	}
> +
> +err:
> +	res_mgr_unlock();
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL(res_mgr_alloc_range);
> +
> +/**
> + * res_mgr_alloc - Allocate a resource instance.
> + * @tag: Identifies the resource.
> + * @req_inst: Requested instance to allocate (-1 for don't care).
> + * @use_last_avail: Set to request the last available instance.
> + *
> + * Returns: Allocated resource instance if successful.
> + * Returns <0 for error codes.
> + */
> +int res_mgr_alloc(struct global_resource_tag tag, int req_inst, bool use=
_last_avail)
> +{
> +	int inst, rc;
> +
> +	rc =3D res_mgr_alloc_range(tag, req_inst, 1, use_last_avail, &inst);
> +	if (!rc)
> +		return inst;
> +	return rc;
> +}
> +EXPORT_SYMBOL(res_mgr_alloc);
> +
> +/**
> + * res_mgr_free_range - Free a resource instance range.
> + * @tag: Identifies the resource.
> + * @req_inst: Requested instance to free.

the parameter is called inst.

Other than these minor / style comments, it doesn't look unreasonable to
me.

Cheers
James

> + * @req_cnt: Number of instances to free.
> + */
> +void res_mgr_free_range(struct global_resource_tag tag, const int *inst,=
 int req_cnt)
> +{
> +	struct global_resource_entry *res_entry;
> +	int res_index, i;
> +	u64 *res_addr;
> +
> +	res_mgr_lock();
> +
> +	/* Find the resource. */
> +	res_index =3D res_mgr_find_resource(tag);
> +	if (res_index < 0) {
> +		pr_err("Resource not found, can't free instance\n");
> +		goto err;
> +	}
> +
> +	/* Get the resource data. */
> +	res_entry =3D &res_mgr_info->resource_entry[res_index];
> +	res_addr =3D phys_to_virt(res_entry->phys_addr);
> +
> +	/* Free the resource instances. */
> +	for (i =3D 0; i < req_cnt; i++) {
> +		/* Instance off by 1 (first element holds the count). */
> +		*(res_addr + inst[i] + 1) =3D INST_AVAILABLE;
> +	}
> +
> +err:
> +	res_mgr_unlock();
> +}
> +EXPORT_SYMBOL(res_mgr_free_range);
> +
> +/**
> + * res_mgr_free - Free a resource instance.
> + * @tag: Identifies the resource.
> + * @req_inst: Requested instance to free.
> + */
> +void res_mgr_free(struct global_resource_tag tag, int inst)
> +{
> +	res_mgr_free_range(tag, &inst, 1);
> +}
> +EXPORT_SYMBOL(res_mgr_free);
> +
> +static int __init res_mgr_init(void)
> +{
> +	struct cvmx_bootmem_named_block_desc *block;
> +	int block_size;
> +	u64 addr;
> +
> +	cvmx_bootmem_lock();
> +
> +	/* Search for the resource manager data in boot memory. */
> +	block =3D cvmx_bootmem_phy_named_block_find(RESOURCE_MGR_BLOCK_NAME, CV=
MX_BOOTMEM_FLAG_NO_LOCKING);
> +	if (block) {
> +		/* Found. */
> +		res_mgr_info =3D phys_to_virt(block->base_addr);
> +	} else {
> +		/* Create it. */
> +		block_size =3D sizeof(struct global_resources) +
> +			sizeof(struct global_resource_entry) * MAX_RESOURCES;
> +		addr =3D cvmx_bootmem_phy_named_block_alloc(block_size, 0, 0,
> +				CVMX_CACHE_LINE_SIZE, RESOURCE_MGR_BLOCK_NAME,
> +				CVMX_BOOTMEM_FLAG_NO_LOCKING);
> +		if (!addr) {
> +			pr_err("Failed to allocate name block %s\n",
> +			       RESOURCE_MGR_BLOCK_NAME);
> +		} else {
> +			res_mgr_info =3D phys_to_virt(addr);
> +			memset(res_mgr_info, 0, block_size);
> +		}
> +	}
> +
> +	cvmx_bootmem_unlock();
> +
> +	return 0;
> +}
> +device_initcall(res_mgr_init);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Cavium, Inc. Octeon resource manager");
> diff --git a/arch/mips/include/asm/octeon/octeon.h b/arch/mips/include/as=
m/octeon/octeon.h
> index 92a17d67c1fa..0411efdb465c 100644
> --- a/arch/mips/include/asm/octeon/octeon.h
> +++ b/arch/mips/include/asm/octeon/octeon.h
> @@ -346,6 +346,24 @@ void octeon_mult_restore3_end(void);
>  void octeon_mult_restore2(void);
>  void octeon_mult_restore2_end(void);
> =20
> +/*
> + * This definition must be kept in sync with the one in
> + * cvmx-global-resources.c
> + */
> +struct global_resource_tag {
> +	uint64_t lo;
> +	uint64_t hi;
> +};
> +
> +void res_mgr_free(struct global_resource_tag tag, int inst);
> +void res_mgr_free_range(struct global_resource_tag tag, const int *inst,
> +			int req_cnt);
> +int res_mgr_alloc(struct global_resource_tag tag, int req_inst,
> +		  bool use_last_avail);
> +int res_mgr_alloc_range(struct global_resource_tag tag, int req_inst,
> +			int req_cnt, bool use_last_avail, int *inst);
> +int res_mgr_create_resource(struct global_resource_tag tag, int inst_cnt=
);
> +
>  /**
>   * Read a 32bit value from the Octeon NPI register space
>   *
> --=20
> 2.14.3
>=20

--zq44+AAfm4giZpo5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlogi+UACgkQbAtpk944
dnoG/A/7BcxQ7y9IRrVoZqV6hRWhFHoUtXqRCBNkdPHgN28+reyyiKvSlO6k9vl8
v8ZrSad8QiYr29H3R9BkIeQ3h95IBzXkwiV9kW+Z0ClylV7Qi6ulTIiVem205tkY
40gdlh+xvzfYxF4Tusyc/irXQ/gXJWraK+SaHZmtG4o5TdLJEn3a36vPWzVKPpTe
kNwfvizGw5OrlGb3DVCpn0tpK9K+ZwgHtBeajlZITnPFFV/NNye+ALZq0us0x09F
niuQf8TargySHLvNLBgg+QXj268Ir2K7U97i+dOudc+quZvPjUBO168uskpwxgEp
Jy+D3zzskQWSYDBDV83vBfZl6OvCjjUB7dbp5jicJBYjrzU1JU4oFDs7BmaDUmCR
YJD1o1TNpS2zuTj9CubpPfXdQ8MwNwZ9Zs6Z3xst7HTxRFAg0sK0drK844Yla3FA
B3DLmNJQHY038pHL05kZNkuHGtd6UH2yHreYB/TN2Hhh6BOUwbDk2dHA77ckfa1b
uWw50xj6Xmk0FlRLK134gnV1cqwG9CMP0FR1HVASupa43iCy9yxbWKEqXIsCRdh6
iLVNkZogN8rgp93nBDH6cmHhLxMr6cB5K30b/BIya1PIlJMU9dkeWOPQ8Haiwjwa
ApLAmd6omstmKLY4nggpmKzHvmQzUN5nnAtsUs3jlSeV4oBeqE0=
=V/X5
-----END PGP SIGNATURE-----

--zq44+AAfm4giZpo5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
