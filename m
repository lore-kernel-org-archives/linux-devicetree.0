From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: silence warnings due to max() usage
Date: Fri, 3 Jun 2016 07:27:20 -0500
Message-ID: <20160603122720.GC8472@rob-hp-laptop>
References: <20160531093856.75c0b04d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160531093856.75c0b04d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Liu <r64343@freescale.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 31, 2016 at 09:38:56AM +1000, Stephen Rothwell wrote:
> pageblock_order can be (at least) an unsigned int or an unsigned long
> depending on the kernel config and architecture, so use max_t(unsigne=
d
> long ...) when comparing it.
>=20
> fixes these warnings:
>=20
> In file included from include/linux/list.h:8:0,
>                  from include/linux/kobject.h:20,
>                  from include/linux/of.h:21,
>                  from drivers/of/of_reserved_mem.c:17:
> drivers/of/of_reserved_mem.c: In function =E2=80=98__reserved_mem_all=
oc_size=E2=80=99:
> include/linux/kernel.h:748:17: warning: comparison of distinct pointe=
r types lacks a cast
>   (void) (&_max1 =3D=3D &_max2);  \
>                  ^
> include/linux/kernel.h:747:9: note: in definition of macro =E2=80=98m=
ax=E2=80=99
>   typeof(y) _max2 =3D (y);   \
>          ^
> drivers/of/of_reserved_mem.c:131:48: note: in expansion of macro =E2=80=
=98max=E2=80=99
>    align =3D max(align, (phys_addr_t)PAGE_SIZE << max(MAX_ORDER - 1, =
pageblock_ord
>                                                 ^
> include/linux/kernel.h:748:17: warning: comparison of distinct pointe=
r types lacks a cast
>   (void) (&_max1 =3D=3D &_max2);  \
>                  ^
> include/linux/kernel.h:747:21: note: in definition of macro =E2=80=98=
max=E2=80=99
>   typeof(y) _max2 =3D (y);   \
>                      ^
> drivers/of/of_reserved_mem.c:131:48: note: in expansion of macro =E2=80=
=98max=E2=80=99
>    align =3D max(align, (phys_addr_t)PAGE_SIZE << max(MAX_ORDER - 1, =
pageblock_ord
>                                                 ^
>=20
> Fixes: 1cc8e3458b51 ("drivers: of: of_reserved_mem: fixup the alignme=
nt with CMA setup")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/of/of_reserved_mem.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> Hi guys, this has been irking me for some time now ... I will add thi=
s
> to my fixes tree in linux-next today.  Please apply and send to Linus=
=2E

Applied, thanks.

Rob
