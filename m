From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [PATCH 4/4] mtd: mchp23k256: Add support for mchp23lcv1024
Date: Thu, 18 May 2017 04:36:00 +0000
Message-ID: <54db7f06847c4026a91a7ae2cb72a790@svr-chch-ex1.atlnz.lc>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-5-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "andrew-g2DYL2Zd6BY@public.gmane.org" <andrew-g2DYL2Zd6BY@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17/05/17 17:39, Chris Packham wrote:=0A=
> The mchp23lcv1024 is software compatible with the mchp23k256, the=0A=
> only difference (from a software point of view) is the size. There=0A=
> is no way to detect the size so we must be told via a Device Tree.=0A=
=0A=
=0A=
I've just noticed that another difference between the 2 chips is 16-bit =0A=
vs 24-bit addressing. So that will also need to be handled.=0A=
=0A=
=0A=
> =0A=
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>=0A=
> ---=0A=
>   .../bindings/mtd/microchip,mchp23k256.txt           |  2 +-=0A=
>   drivers/mtd/devices/mchp23k256.c                    | 21 ++++++++++++++=
+++++--=0A=
>   2 files changed, 20 insertions(+), 3 deletions(-)=0A=
> =0A=
> diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.t=
xt b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt=0A=
> index 25e5ad38b0f0..7328eb92a03c 100644=0A=
> --- a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt=0A=
> +++ b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt=0A=
> @@ -3,7 +3,7 @@=0A=
>   Required properties:=0A=
>   - #address-cells, #size-cells : Must be present if the device has sub-n=
odes=0A=
>     representing partitions.=0A=
> -- compatible : Must be "microchip,mchp23k256"=0A=
> +- compatible : Must be one of "microchip,mchp23k256" or "microchip,mchp2=
3lcv1024"=0A=
>   - reg : Chip-Select number=0A=
>   - spi-max-frequency : Maximum frequency of the SPI bus the chip can ope=
rate at=0A=
>   =0A=
> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp2=
3k256.c=0A=
> index 02c6b9dcbd3e..d1eba587633c 100644=0A=
> --- a/drivers/mtd/devices/mchp23k256.c=0A=
> +++ b/drivers/mtd/devices/mchp23k256.c=0A=
> @@ -21,6 +21,8 @@=0A=
>   #include <linux/spi/spi.h>=0A=
>   #include <linux/of_device.h>=0A=
>   =0A=
> +enum chips { mchp23k256, mchp23lcv1024 };=0A=
> +=0A=
>   struct mchp23k256_flash {=0A=
>   	struct spi_device	*spi;=0A=
>   	struct mutex		lock;=0A=
> @@ -128,6 +130,7 @@ static int mchp23k256_probe(struct spi_device *spi)=
=0A=
>   	struct mchp23k256_flash *flash;=0A=
>   	struct flash_platform_data *data;=0A=
>   	int err;=0A=
> +	enum chips chip;=0A=
>   =0A=
>   	flash =3D devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);=0A=
>   	if (!flash)=0A=
> @@ -143,15 +146,28 @@ static int mchp23k256_probe(struct spi_device *spi)=
=0A=
>   =0A=
>   	data =3D dev_get_platdata(&spi->dev);=0A=
>   =0A=
> +	if (spi->dev.of_node)=0A=
> +		chip =3D (enum chips)of_device_get_match_data(&spi->dev);=0A=
> +	else=0A=
> +		chip =3D mchp23k256;=0A=
> +=0A=
>   	mtd_set_of_node(&flash->mtd, spi->dev.of_node);=0A=
>   	flash->mtd.dev.parent	=3D &spi->dev;=0A=
>   	flash->mtd.type		=3D MTD_RAM;=0A=
>   	flash->mtd.flags	=3D MTD_CAP_RAM;=0A=
>   	flash->mtd.writesize	=3D 1;=0A=
> -	flash->mtd.size		=3D SZ_32K;=0A=
>   	flash->mtd._read	=3D mchp23k256_read;=0A=
>   	flash->mtd._write	=3D mchp23k256_write;=0A=
>   =0A=
> +	switch (chip){=0A=
> +	case mchp23lcv1024:=0A=
> +		flash->mtd.size		=3D SZ_128K;=0A=
> +		break;=0A=
> +	default:=0A=
> +		flash->mtd.size		=3D SZ_32K;=0A=
> +		break;=0A=
> +	}=0A=
> +=0A=
>   	flash->mtd.erasesize =3D PAGE_SIZE;=0A=
>   	while (flash->mtd.size & (flash->mtd.erasesize - 1))=0A=
>   		flash->mtd.erasesize >>=3D 1;=0A=
> @@ -172,7 +188,8 @@ static int mchp23k256_remove(struct spi_device *spi)=
=0A=
>   }=0A=
>   =0A=
>   static const struct of_device_id mchp23k256_of_table[] =3D {=0A=
> -	{ .compatible =3D "microchip,mchp23k256" },=0A=
> +	{ .compatible =3D "microchip,mchp23k256", .data =3D (void *)mchp23k256 =
},=0A=
> +	{ .compatible =3D "microchip,mchp23lcv1024", .data =3D (void *)mchp23lc=
v1024 },=0A=
>   	{}=0A=
>   };=0A=
>   MODULE_DEVICE_TABLE(of, mchp23k256_of_table);=0A=
> =0A=
=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
