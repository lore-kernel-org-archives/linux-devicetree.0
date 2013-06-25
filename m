From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 2/6] misc: sram: add ability to mark sram sections as
 reserved
Date: Tue, 25 Jun 2013 12:17:05 +0200
Message-ID: <1372155425.3981.67.camel@pizza.hi.pengutronix.de>
References: <201306251046.04873.heiko@sntech.de>
	 <201306251047.12899.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306251047.12899.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

Am Dienstag, den 25.06.2013, 10:47 +0200 schrieb Heiko St=C3=BCbner:
> Some SoCs need parts of their sram for special purposes. So while bei=
ng part
> of the periphal, it should not be part of the genpool controlling the=
 sram.
>=20
> Threfore add an option mmio-sram-reserved to keep arbitary portions o=
f the
> sram from being part of the pool.
>=20
> Suggested-by: Rob Herring <robherring2@gmail.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/misc/sram.txt |    8 +++
>  drivers/misc/sram.c                             |   86 +++++++++++++=
++++++++--
>  2 files changed, 88 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/misc/sram.txt b/Docume=
ntation/devicetree/bindings/misc/sram.txt
> index 4d0a00e..eae080e 100644
> --- a/Documentation/devicetree/bindings/misc/sram.txt
> +++ b/Documentation/devicetree/bindings/misc/sram.txt
> @@ -8,9 +8,17 @@ Required properties:
> =20
>  - reg : SRAM iomem address range
> =20
> +Optional properties:
> +
> +- mmio-sram-reserved: ordered list of reserved chunks inside the sra=
m that
> +  should not become part of the genalloc pool.
> +  Format is <base size>, <base size>, ...; with base being relative =
to the
> +  reg property base.
> +

the keyword to reserve blocks of ram is /memreserve/ - should this
property name be aligned with that?

>  Example:
> =20
>  sram: sram@5c000000 {
>  	compatible =3D "mmio-sram";
>  	reg =3D <0x5c000000 0x40000>; /* 256 KiB SRAM at address 0x5c000000=
 */
> +	mmio-sram-reserved =3D <0x0 0x100>; /* reserve 0x5c000000-0x5c00010=
0 */
>  };
> diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
> index afe66571..5fccbe3 100644
> --- a/drivers/misc/sram.c
> +++ b/drivers/misc/sram.c
> @@ -42,6 +42,8 @@ static int sram_probe(struct platform_device *pdev)
>  	struct sram_dev *sram;
>  	struct resource *res;
>  	unsigned long size;
> +	const __be32 *reserved_list =3D NULL;
> +	int reserved_size =3D 0;
>  	int ret;
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -65,12 +67,89 @@ static int sram_probe(struct platform_device *pde=
v)
>  	if (!sram->pool)
>  		return -ENOMEM;
> =20
> -	ret =3D gen_pool_add_virt(sram->pool, (unsigned long)virt_base,
> -				res->start, size, -1);
> -	if (ret < 0) {
> -		if (sram->clk)
> -			clk_disable_unprepare(sram->clk);
> -		return ret;
> +	if (pdev->dev.of_node) {
> +		reserved_list =3D of_get_property(pdev->dev.of_node,
> +						"mmio-sram-reserved",
> +						&reserved_size);
> +		if (reserved_list) {
> +			reserved_size /=3D sizeof(*reserved_list);
> +			if (!reserved_size || reserved_size % 2) {
> +				dev_warn(&pdev->dev, "wrong number of arguments in mmio-sram-res=
erved\n");
> +				reserved_list =3D NULL;
> +			}
> +		}
> +	}
> +
> +	if (!reserved_list) {
> +		ret =3D gen_pool_add_virt(sram->pool, (unsigned long)virt_base,
> +					res->start, size, -1);
> +		if (ret < 0) {
> +			if (sram->clk)
> +				clk_disable_unprepare(sram->clk);
> +			return ret;
> +		}

Moving the clk_prepare_enable() further down would allow to avoid the
clk_disable_unprepare() in every error path,

> +	} else {
> +		unsigned int cur_start =3D 0;
> +		unsigned int cur_size;
> +		unsigned int rstart;
> +		unsigned int rsize;
> +		int i;
> +
> +		for (i =3D 0; i < reserved_size; i +=3D 2) {
> +			/* get the next reserved block */
> +			rstart =3D be32_to_cpu(*reserved_list++);
> +			rsize =3D be32_to_cpu(*reserved_list++);
> +
> +			/* catch unsorted list entries */
> +			if (rstart < cur_start) {
> +				dev_err(&pdev->dev, "unsorted reserved list (0x%x before current=
 0x%x)\n",
> +					rstart, cur_start);
> +				if (sram->clk)
> +					clk_disable_unprepare(sram->clk);

like here

> +				return -EINVAL;
> +			}
> +
> +			dev_dbg(&pdev->dev, "found reserved block 0x%x-0x%x\n",
> +				 rstart, rstart + rsize);
> +
> +			/* current start is in a reserved block */
> +			if (rstart <=3D cur_start) {
> +				cur_start =3D rstart + rsize;
> +				continue;
> +			}
> +
> +			/*
> +			 * allocate the space between the current starting
> +			 * address and the following reserved block
> +			 */
> +			cur_size =3D rstart - cur_start;
> +
> +			dev_dbg(&pdev->dev, "adding chunk 0x%x-0x%x\n",
> +				 cur_start, cur_start + cur_size);
> +			ret =3D gen_pool_add_virt(sram->pool,
> +					(unsigned long)virt_base + cur_start,
> +					res->start + cur_start, cur_size, -1);
> +			if (ret < 0) {
> +				if (sram->clk)
> +					clk_disable_unprepare(sram->clk);

and here.

> +				return ret;
> +			}
> +
> +			/* next allocation after this reserved block */
> +			cur_start =3D rstart + rsize;
> +		}
> +
> +		/* allocate the space after the last reserved block */
> +		if (cur_start < size) {
> +			cur_size =3D size - cur_start;
> +
> +			dev_dbg(&pdev->dev, "adding chunk 0x%x-0x%x\n",
> +				 cur_start, cur_start + cur_size);
> +			ret =3D gen_pool_add_virt(sram->pool,
> +					(unsigned long)virt_base + cur_start,
> +					res->start + cur_start, cur_size, -1);
> +		}
> +
>  	}
> =20
>  	platform_set_drvdata(pdev, sram);

Also, I think you could reduce the duplication of gen_pool_add_virt()
function calls, somehow like this:

	unsigned int cur_start =3D 0;
	unsigned int cur_size;
	unsigned int rstart;
	unsigned int rsize;
	int i =3D 0;

	if (!reserved_list)
		reserved_size =3D 0;

	for (i =3D 0; i < (reserved_size + 2); i +=3D 2) {
		if (i < reserved_size) {
			/* get the next reserved block */
			rstart =3D be32_to_cpu(*reserved_list++);
			rsize =3D be32_to_cpu(*reserved_list++);

			/* catch unsorted list entries */
			if (rstart < cur_start) {
				dev_err(&pdev->dev,
					"unsorted reserved list (0x%x before current 0x%x)\n",
					rstart, cur_start);
				return -EINVAL;
			}

			dev_dbg(&pdev->dev,
				"found reserved block 0x%x-0x%x\n",
				rstart, rstart + rsize);
		} else {
			/* the last chunk extends to the end of the region */
			rstart =3D size;
		}

		/* current start is in a reserved block */
		if (rstart <=3D cur_start) {
			cur_start =3D rstart + rsize;
			continue;
		}

		/*
		 * allocate the space between the current starting
		 * address and the following reserved block, or the
		 * end of the region.
		 */
		cur_size =3D rstart - cur_start;

		dev_dbg(&pdev->dev, "adding chunk 0x%x-0x%x\n",
			cur_start, cur_start + cur_size);
		ret =3D gen_pool_add_virt(sram->pool,
				(unsigned long)virt_base + cur_start,
				res->start + cur_start, cur_size, -1);
		if (ret < 0)
			return ret;
	}

regards
Philipp
