From: Michal Nazarewicz <mina86@mina86.com>
Subject: Re: [PATCH v4 4/4] ARM: init: add support for reserved memory defined
 by device tree
Date: Mon, 05 Aug 2013 16:31:50 +0200
Message-ID: <xa1tr4e8us2x.fsf@mina86.com>
References: <1375275119-12787-1-git-send-email-m.szyprowski@samsung.com>
 <1375275119-12787-5-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1375275119-12787-5-git-send-email-m.szyprowski@samsung.com>
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
> Enable reserved memory initialization from device tree.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Acked-by: Michal Nazarewicz <mina86@mina86.com>

> ---
>  arch/arm/mm/init.c |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 15225d8..82db8d8 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -20,6 +20,7 @@
>  #include <linux/highmem.h>
>  #include <linux/gfp.h>
>  #include <linux/memblock.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/dma-contiguous.h>
>  #include <linux/sizes.h>
>=20=20
> @@ -377,6 +378,8 @@ void __init arm_memblock_init(struct meminfo *mi, str=
uct machine_desc *mdesc)
>  	if (mdesc->reserve)
>  		mdesc->reserve();
>=20=20
> +	dma_reserved_mem_of_reserve();
> +
>  	/*
>  	 * reserve memory for DMA contigouos allocations,
>  	 * must come from DMA area inside low memory
> --=20
> 1.7.9.5
>

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

iQIcBAEBAgAGBQJR/7dWAAoJECBgQBJQdR/0ETwP/R4WrBghz6R8BQP8anTT9Fo8
KFqiTpNWTlkSgsnveE2DMd/GAA4koGpCnwfwiVXQBeqKtU8mShLM7iqqwP/bLZiS
KLm+Ap0IFWX2ksKNwXGJL2ZC9t2WmXMzSgD4fCjm8/fSEZq2s8LLbMKqqXvEV0eZ
xz+HRZ+JxowsHDzFBYERl0psANkgPVKWxrnSOi3XYVyKIa+ZpI7AXYhNx2Bv3J/N
fuITzZeBv1Ztjqd0cc9RaBRQecKp3SXYLq3NpQfwY98b+uHDH8ERYq1Km9+zeIfT
R23XrxcLBfXX8Ze5HOyOh2waYJx5evIuvQKU3IirtjKAktmEhEGoua/ZznHcQG5E
ER951SwU0GPeDHSuS1tEwQiFGKSLj51wVi0PRLZeQwdRsWKVwoySusBVSOZp2m4X
LGJYAKGMcE+Dw/nH+N8COfRGE5MTYeDEGiVxnwfHk2Be3ACti1Pvk6wV6j+ZBs8d
jp67vi+aKCTy9i2VhIVf50f3BZrlAoZgpcsHAKz9vPv2uTJVyB36lNbD8SJjaTPn
1khE/3K/LI6k7dvi57KTUnxtsrT3JbxxK71tYaTYZby/4BPjoofwdPe4hZrIY1gY
U/0SoQELHKarnKiCaKfqa9Y/Iwol4VlJ3xHtcaDJDKKqpXME7yGawc6F8hgku7xE
cV3vcALUUHjVnQ+V+3Q7
=FGU5
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
