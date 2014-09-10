From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/4] mfd/axp20x: rename files to support more devices
Date: Wed, 10 Sep 2014 09:12:01 +0100
Message-ID: <20140910081201.GK30307@lee--X1>
References: <1410267775-4683-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1410267775-4683-2-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1410267775-4683-2-git-send-email-jacob.jun.pan@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: IIO <linux-iio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, DEVICE TREE <devicetree@vger.kernel.org>, Carlo Caione <carlo@caione.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Aaron Lu <aaron.lu@intel.com>, Alan Cox <alan@linux.intel.com>, Jean Delvare <khali@linux-fr.org>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Hartmut Knaack <knaack.h@gmx.de>, Fugang Duan <B38611@freescale.com>, Arnd Bergmann <arnd@arndb.de>, Zubair Lutfullah <zubair.lutfullah@gmail.com>, Sebastian Reichel <sre@debian.org>, Johannes Thumshirn <johannes.thumshirn@men.de>, Philippe Reynes <tremyfr@yahoo.fr>, Angelo Compagnucci <angelo.compagnu>
List-Id: devicetree@vger.kernel.org

On Tue, 09 Sep 2014, Jacob Pan wrote:

> More XPowers PMIC devices can be supported by extending this driver, =
so
> rename it to axp2xx to cover axp288 variant.
>=20
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>  drivers/mfd/Kconfig                      | 7 ++++---
>  drivers/mfd/Makefile                     | 2 +-
>  drivers/mfd/{axp20x.c =3D> axp2xx.c}       | 2 +-
>  include/linux/mfd/{axp20x.h =3D> axp2xx.h} | 0
>  4 files changed, 6 insertions(+), 5 deletions(-)
>  rename drivers/mfd/{axp20x.c =3D> axp2xx.c} (99%)
>  rename include/linux/mfd/{axp20x.h =3D> axp2xx.h} (100%)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index de5abf2..42a70a3 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -67,14 +67,15 @@ config MFD_BCM590XX
>  	help
>  	  Support for the BCM590xx PMUs from Broadcom
> =20
> -config MFD_AXP20X
> -	bool "X-Powers AXP20X"
> +config MFD_AXP2XX
> +	bool "X-Powers AXP2XX"
>  	select MFD_CORE
>  	select REGMAP_I2C
>  	select REGMAP_IRQ
>  	depends on I2C=3Dy
>  	help
> -	  If you say Y here you get support for the X-Powers AXP202 and AXP=
209.
> +	  If you say Y here you get support for the X-Powers AXP202, AXP209=
 and
> +	  AXP288 power management IC (PMIC).
>  	  This driver include only the core APIs. You have to select indivi=
dual
>  	  components like regulators or the PEK (Power Enable Key) under th=
e
>  	  corresponding menus.
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index f001487..55d76b3 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -103,7 +103,7 @@ obj-$(CONFIG_PMIC_DA9052)	+=3D da9052-irq.o
>  obj-$(CONFIG_PMIC_DA9052)	+=3D da9052-core.o
>  obj-$(CONFIG_MFD_DA9052_SPI)	+=3D da9052-spi.o
>  obj-$(CONFIG_MFD_DA9052_I2C)	+=3D da9052-i2c.o
> -obj-$(CONFIG_MFD_AXP20X)	+=3D axp20x.o
> +obj-$(CONFIG_MFD_AXP2XX)	+=3D axp2xx.o
> =20
>  obj-$(CONFIG_MFD_LP3943)	+=3D lp3943.o
>  obj-$(CONFIG_MFD_LP8788)	+=3D lp8788.o lp8788-irq.o
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp2xx.c
> similarity index 99%
> rename from drivers/mfd/axp20x.c
> rename to drivers/mfd/axp2xx.c
> index dee6539..c534443 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp2xx.c
> @@ -21,7 +21,7 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/regulator/consumer.h>
> -#include <linux/mfd/axp20x.h>
> +#include <linux/mfd/axp2xx.h>
>  #include <linux/mfd/core.h>
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp2xx.h
> similarity index 100%
> rename from include/linux/mfd/axp20x.h
> rename to include/linux/mfd/axp2xx.h

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
