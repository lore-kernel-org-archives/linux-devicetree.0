From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCHv4 4/5] of/mtd/nand: add generic binding and helper for
 NAND_BBT_NO_OOB_BBM
Date: Wed, 23 Jul 2014 19:06:27 -0700
Message-ID: <20140724020627.GD3711@ld-irv-0074>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-3-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-4-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-5-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1402579245-13377-5-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-doc@vger.kernel.org, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mtd@lists.infradead.org, Michael Grzeschik <m.grzeschik@pengutronix.de>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Jingoo Han <jg1.han@samsung.com>, Shawn Guo <shawn.guo@freescale.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Michael Opdenacker <michael.opdenacker@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>, linux-kernel@vger.kernel.org, Huang
List-Id: devicetree@vger.kernel.org

(BTW, that's a mighty CC list you have! I'm not sure all CC'd parties
are interested in this series; e.g., Russel and the ARM list seem
unrelated)

Hi Lothar,

Sorry for the delay on this. I get busy enough that I can't/don't reply
to everything quickly...

On Thu, Jun 12, 2014 at 03:20:44PM +0200, Lothar Wa=DFmann wrote:
> add a boolean property 'nand-no-oob-bbm' and helper function to be
> able to set the NAND_BBT_NO_OOB_BBM flag in DT capable NAND drivers
> and use it for i.MX and MXS nand drivers.

If I'm understanding your previous conversations with Huang correctly,
you *must* use NAND_BBT_NO_OOB_BBM if you're going to use the
fsl,no-blockmark-swap option. Correct? If so, then you might not need
a separate 'nand-no-oob-bbm' binding; your driver should imply from
'fsl,no-blockmark-swap' that it must also enable NAND_BBT_NO_OOB_BBM.

Also, as I noted in [1], I don't really like exposing a ton of
individual boolean DT properties like this. (At least this property is
orthogonal to the bad block table; I was a little off-base in [1].)

Brian

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-July/054764.html

> Signed-off-by: Lothar Wa=DFmann <LW@KARO-electronics.de>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt |    1 +
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c         |    3 +++
>  drivers/mtd/nand/mxc_nand.c                    |    2 ++
>  drivers/of/of_mtd.c                            |   12 ++++++++++++
>  include/linux/of_mtd.h                         |    6 ++++++
>  5 files changed, 24 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentati=
on/devicetree/bindings/mtd/nand.txt
> index b53f92e..e46bfbe 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -5,6 +5,7 @@
>    "soft_bch".
>  - nand-bus-width : 8 or 16 bus width if not present 8
>  - nand-on-flash-bbt: boolean to enable on flash bbt option if not presen=
t false
> +- nand-no-oob-bbm: boolean to disable writing bad block markers to flash
>  =

>  - nand-ecc-strength: integer representing the number of bits to correct
>  		     per ECC step.
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index 959cb9b..37537b4 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1724,6 +1724,9 @@ static int gpmi_nand_init(struct gpmi_nand_data *th=
is)
>  	if (of_get_nand_on_flash_bbt(this->dev->of_node)) {
>  		chip->bbt_options |=3D NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
>  =

> +		if (of_get_nand_no_oob_bbm(this->dev->of_node))
> +			chip->bbt_options |=3D NAND_BBT_NO_OOB_BBM;
> +
>  		if (of_property_read_bool(this->dev->of_node,
>  						"fsl,no-blockmark-swap"))
>  			this->swap_block_mark =3D false;
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index dba262b..bb54a2a 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -1496,6 +1496,8 @@ static int mxcnd_probe(struct platform_device *pdev)
>  		this->bbt_md =3D &bbt_mirror_descr;
>  		/* update flash based bbt */
>  		this->bbt_options |=3D NAND_BBT_USE_FLASH;
> +		if (of_get_nand_no_oob_bbm(pdev->dev.of_node))
> +			this->bbt_options |=3D NAND_BBT_NO_OOB_BBM;
>  	}
>  =

>  	init_completion(&host->op_completion);
> diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
> index b7361ed..d947acc 100644
> --- a/drivers/of/of_mtd.c
> +++ b/drivers/of/of_mtd.c
> @@ -117,3 +117,15 @@ bool of_get_nand_on_flash_bbt(struct device_node *np)
>  	return of_property_read_bool(np, "nand-on-flash-bbt");
>  }
>  EXPORT_SYMBOL_GPL(of_get_nand_on_flash_bbt);
> +
> +/**
> + * of_get_nand_no_oob_bbm - Get nand no oob bbm for given device_node
> + * @np:	Pointer to the given device_node
> + *
> + * return true if present, false otherwise
> + */
> +bool of_get_nand_no_oob_bbm(struct device_node *np)
> +{
> +	return of_property_read_bool(np, "nand-no-oob-bbm");
> +}
> +EXPORT_SYMBOL_GPL(of_get_nand_no_oob_bbm);
> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
> index e266caa..6ece1a9 100644
> --- a/include/linux/of_mtd.h
> +++ b/include/linux/of_mtd.h
> @@ -17,6 +17,7 @@ int of_get_nand_ecc_step_size(struct device_node *np);
>  int of_get_nand_ecc_strength(struct device_node *np);
>  int of_get_nand_bus_width(struct device_node *np);
>  bool of_get_nand_on_flash_bbt(struct device_node *np);
> +bool of_get_nand_no_oob_bbm(struct device_node *np);
>  =

>  #else /* CONFIG_OF_MTD */
>  =

> @@ -45,6 +46,11 @@ static inline bool of_get_nand_on_flash_bbt(struct dev=
ice_node *np)
>  	return false;
>  }
>  =

> +static inline bool of_get_nand_no_oob_bbm(struct device_node *np)
> +{
> +	return false;
> +}
> +
>  #endif /* CONFIG_OF_MTD */
>  =

>  #endif /* __LINUX_OF_MTD_H */
