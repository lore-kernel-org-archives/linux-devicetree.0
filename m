From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 19/21] MIPS memblock: Add print out method of kernel
 virtual memory layout
Date: Mon, 19 Dec 2016 13:02:37 +0000
Message-ID: <20161219130236.GJ27950@jhogan-linux.le.imgtec.org>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
 <1482113266-13207-20-git-send-email-fancer.lancer@gmail.com>
 <db27f41e-4121-bb83-6533-6727c26b9c5b@imgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y0Ed1hDcWxc3B7cn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <db27f41e-4121-bb83-6533-6727c26b9c5b@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com, Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--y0Ed1hDcWxc3B7cn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Mon, Dec 19, 2016 at 12:04:54PM +0000, Matt Redfearn wrote:
> On 19/12/16 02:07, Serge Semin wrote:
> > It's useful to have some printed map of the kernel virtual memory,
> > at least for debugging purpose.
> >
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > ---

> > @@ -106,6 +107,49 @@ static void __init zone_sizes_init(void)
> >   }
> >  =20
> >   /*
> > + * Print out kernel memory layout
> > + */
> > +#define MLK(b, t) b, t, ((t) - (b)) >> 10
> > +#define MLM(b, t) b, t, ((t) - (b)) >> 20
> > +#define MLK_ROUNDUP(b, t) b, t, DIV_ROUND_UP(((t) - (b)), SZ_1K)
> > +static void __init mem_print_kmap_info(void)
> > +{
> > +	pr_notice("Virtual kernel memory layout:\n"
> > +		  "    lowmem  : 0x%08lx - 0x%08lx   (%4ld MB)\n"
> > +		  "    vmalloc : 0x%08lx - 0x%08lx   (%4ld MB)\n"
> > +#ifdef CONFIG_HIGHMEM
> > +		  "    pkmap   : 0x%08lx - 0x%08lx   (%4ld MB)\n"
> > +#endif
> > +		  "    fixmap  : 0x%08lx - 0x%08lx   (%4ld kB)\n"
> > +		  "      .text : 0x%p" " - 0x%p" "   (%4td kB)\n"
> > +		  "      .data : 0x%p" " - 0x%p" "   (%4td kB)\n"
> > +		  "      .init : 0x%p" " - 0x%p" "   (%4td kB)\n",
> > +		MLM(PAGE_OFFSET, (unsigned long)high_memory),
> > +		MLM(VMALLOC_START, VMALLOC_END),
> > +#ifdef CONFIG_HIGHMEM
> > +		MLM(PKMAP_BASE, (PKMAP_BASE) + (LAST_PKMAP)*(PAGE_SIZE)),
> > +#endif
> > +		MLK(FIXADDR_START, FIXADDR_TOP),
> > +		MLK_ROUNDUP(_text, _etext),
> > +		MLK_ROUNDUP(_sdata, _edata),
> > +		MLK_ROUNDUP(__init_begin, __init_end));
>=20
> Please drop printing the kernel addresses, or at least only do it if=20
> KASLR is not turned on, otherwise you're removing the advantage of=20
> KASLR, that critical kernel addresses cannot be determined easily from=20
> userspace.

According to Documentation/printk-formats.txt, this is what %pK is for.
Better to use that instead?

Cheers
James

>=20
> It may be better to merge the functionality of show_kernel_relocation
> http://lxr.free-electrons.com/source/arch/mips/kernel/relocate.c#L354
> into this function, but only print it under the same conditions as=20
> currently, i.e.
> #if defined(CONFIG_DEBUG_KERNEL) && defined(CONFIG_DEBUG_INFO)
> http://lxr.free-electrons.com/source/arch/mips/kernel/setup.c#L530
>=20
> Thanks,
> Matt

--y0Ed1hDcWxc3B7cn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYV9psAAoJEGwLaZPeOHZ6AOcQAIg5aU60b73zBLz7whKWI2Oc
O5KfLoRmtNPb8rAJLTV1pFIamjhmNWKulnmFywPclWfWKrl59OLjf86QJiw93iXM
SuWb1FHkJ6AswvaR+vgW+poHhH9rpzcQQ0pOEJvimt5pLQBKuI9FF78K9xl0lHc8
LArFZC8/+pHnu8xH7Eqj4OG8Ju9P1b02GdMZgCKsT3Tegn5m3uWRKgGoTfHUN9nS
bKePLKoqeNDWAEd3ifXzsctJNPBdcuJjutrJzQEJEOP/2HQW2OhncAqhfKuNi3As
cXD5mP6Rqg0DPFPOSvmCr1ED/jmWhWfjiNan2D0Ds3UVu42wVqgTfeqZ1mHHperV
ubV29vU/gmjlzAieLGWYZ02S4Q5s3C9KfdCP90KLt16wS7Lnqa13bmau1jn3nF1h
0dQa5Ucxam+2z99EtW+r9DfqlIXdgUwrXIT8mVsSIS9y1mABvONDx+rct2tNEKLL
PYxTFCWFn3vA8SgUxmxgsvi9NSx+YW4iFZLt5DaBj79K5weNkiHIk1P5eOdef0wN
2erB0Vkcy04K/hyzUKk5W7dR9bKBWI/4zGznS8aoKH48oq+Un75PQ90sf60pKmdF
fJbmvFfhIqFZom2dqbksuhWYH1escVsZuZyvMPNkbiwfVraPCHW9aNwpQyEztaBv
hJTu8+aXxZsMQAGgThNC
=RD0L
-----END PGP SIGNATURE-----

--y0Ed1hDcWxc3B7cn--
