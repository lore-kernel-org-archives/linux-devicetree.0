From: Michal Nazarewicz <mina86@mina86.com>
Subject: Re: [PATCH v4 1/4] drivers: dma-contiguous: clean source code and
 prepare for device tree
Date: Mon, 05 Aug 2013 16:06:17 +0200
Message-ID: <xa1twqo0ut9i.fsf@mina86.com>
References: <1375275119-12787-1-git-send-email-m.szyprowski@samsung.com>
 <1375275119-12787-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1375275119-12787-2-git-send-email-m.szyprowski@samsung.com>
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
> This patch cleans the initialization of dma contiguous framework. The
> all-in-one dma_declare_contiguous() function is now separated into
> dma_contiguous_reserve_area() which only steals the the memory from
> memblock allocator and dma_contiguous_add_device() function, which
> assigns given device to the specified reserved memory area. This improves
> the flexibility in defining contiguous memory areas and assigning device
> to them, because now it is possible to assign more than one device to
> the given contiguous memory area. Such split in initialization procedure
> is also required for upcoming device tree support.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Acked-by: Michal Nazarewicz <mina86@mina86.com>

Even though I have some comments.

> @@ -124,22 +124,29 @@ void __init dma_contiguous_reserve(phys_addr_t limi=
t)
>  #endif
>  	}
>=20=20
> -	if (selected_size) {
> +	if (selected_size && !dma_contiguous_default_area) {

Perhaps check this earlier in the function?  Also, maybe WARN would be
in order when dma_contiguous_reserve is called with
dma_contiguous_default_area already reserved.

>  		pr_debug("%s: reserving %ld MiB for global area\n", __func__,
>  			 (unsigned long)selected_size / SZ_1M);
>=20=20
> -		dma_declare_contiguous(NULL, selected_size, 0, limit);
> +		dma_contiguous_reserve_area(selected_size, 0, limit,
> +					    &dma_contiguous_default_area);
>  	}
>  };
>=20=20
>  static DEFINE_MUTEX(cma_mutex);


> -int __init dma_declare_contiguous(struct device *dev, phys_addr_t size,
> -				  phys_addr_t base, phys_addr_t limit)
> +int __init dma_contiguous_reserve_area(phys_addr_t size, phys_addr_t bas=
e,
> +				       phys_addr_t limit, struct cma **res_cma)

> @@ -277,10 +245,11 @@ int __init dma_declare_contiguous(struct device *de=
v, phys_addr_t size,
>  	 * Each reserved area must be initialised later, when more kernel
>  	 * subsystems (like slab allocator) are available.
>  	 */
> -	r->start =3D base;
> -	r->size =3D size;
> -	r->dev =3D dev;
> -	cma_reserved_count++;
> +	cma->base_pfn =3D PFN_DOWN(base);
> +	cma->count =3D size >> PAGE_SHIFT;
> +	*res_cma =3D cma;

Alternatively it could return a pointer, but either way=E2=80=A6

> +	cma_area_count++;
> +
>  	pr_info("CMA: reserved %ld MiB at %08lx\n", (unsigned long)size / SZ_1M,
>  		(unsigned long)base);
>=20=20

> +int __init dma_contiguous_add_device(struct device *dev, struct cma *cma)
> +{
> +	dev_set_cma_area(dev, cma);
> +	return 0;
> +}

This never fails and it is used in dma_declare_contiguous w/o checking
for errors so perhaps it should return void?  Applies to some other
functions as well.

Moreover, this function is so tiny, it makes me wonder why does it exist
in the first place (why would anyone call it rather then
dev_set_cma_area?  is it just matter of name?), and since it exists, why
not put it to a header file as a static inline.

> +int __init dma_contiguous_set_default_area(struct cma *cma)
> +{
> +	dma_contiguous_default_area =3D cma;
> +	return 0;
>  }

Ditto.

> +static inline int dma_declare_contiguous(struct device *dev, phys_addr_t=
 size,
> +					 phys_addr_t base, phys_addr_t limit)
> +{
> +	struct cma *cma;
> +	int ret;

+	if (WARN_ON(!dev))
+		return -EINVAL;

> +	ret =3D dma_contiguous_reserve_area(size, base, limit, &cma);
> +	if (ret =3D=3D 0)
> +		dma_contiguous_add_device(dev, cma);
> +
> +	return ret;
> +}

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

iQIcBAEBAgAGBQJR/7FZAAoJECBgQBJQdR/0+3IP/3PaEV+O+5XzVZV8r3eLBF3I
FOUdGBBiWIlulG4agodTVkCL6AdmKQ8ocEr+pBMxYoPTxbofblVANXSmj33q/Cpb
bFkIppWY+8IAC4v0WJUTbeDT0soVNIKXPwWrIgag6NGFdPK7f+CD2psLRI6KOFM2
MGlZFhhBVt3HMGDE6lZ8oCq3It5dWBe7Am2dwXgXL4vKfhJZqp2bsVH55NbZVI/+
tTtLT1vmZ2shSqxWqdnwUM8oPuIam0G0ZlEAjimBFqLmPvEeLq8atOhUomz+A+1L
vdynCKU0PqCwkfM7mnSxPFhwNFo75kx6dLb5II5VhPAua6mty4KbrtYMET6yLCPt
RSuJz+t7ljA+F1lx6S6LtVe0jJZU3hK6/2zjnCi6ccCZ02yib9HisiXadGXUSJbD
r/wemhrabxk1QE9XPAUbFJx7NB784ZEmlrwADGqOC5T8GyH4Q7Ds1VnEpTS00Qos
5FH2Gl9r+U9PAKiJ3LdpHERn6MTX8MIgXaKpIhY38EM4Dx1ohzz1T4Q7USbJOVpD
gdZHpm2keklcv4rpeaARMnDY21s1WE1px56PUESatqOoPuNWotFYfAUP/VkkwFAU
5jslxg0j8BBC3eCdm28sD1oXVNGAVmB1EFftstea1UH+YFsV5giS/QIJAkSYqDDy
NmlBzntJwubr8P1MiEho
=HCxf
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
