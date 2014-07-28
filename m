From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCHv4 5/5] mtd: gpmi: prevent creating a new BBT when
 blockmark swapping is disabled
Date: Sun, 27 Jul 2014 22:29:06 -0700
Message-ID: <20140728052906.GA3095@norris-Latitude-E6410>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-3-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-4-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-5-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-6-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1402579245-13377-6-git-send-email-LW@KARO-electronics.de>
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

Hi Lothar,

On Thu, Jun 12, 2014 at 03:20:45PM +0200, Lothar Wa=DFmann wrote:
> Without blockmark swapping, there is no use in creating a BBT from
> scratch, so use a BBT descriptor with NAND_BBT_CREATE unset in this
> case.

I'm curious: what is your plan if there is no BBT available on your
device, or if it ever gets corrupted? IIUC, nand_bbt will just assume
you have no bad blocks, and it will never write a bad block table to
flash. This also means no subsequent discoverable bad blocks can be
recorded across power cycles, I believe.

Maybe you don't want to specify your own nand_bbt_descr's at all, but
you just need to set:

	chip->bbt_options |=3D NAND_BBT_CREATE_EMPTY | NAND_BBT_NO_OOB;

(Note: there's a little bit of fuzziness about NAND_BBT_* flags, where
some are targeted for the nand_chip::bbt_options field, and others
belong in struct nand_bbt_descr::options.)

But if for some reason we need to keep this patch, a comment below:

> Signed-off-by: Lothar Wa=DFmann <LW@KARO-electronics.de>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   28 ++++++++++++++++++++++++++=
+-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index 37537b4..fc710d7 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -43,6 +43,29 @@ static struct nand_bbt_descr gpmi_bbt_descr =3D {
>  	.pattern	=3D scan_ff_pattern
>  };
>  =

> +static uint8_t bbt_pattern[] =3D {'B', 'b', 't', '0' };
> +static uint8_t mirror_pattern[] =3D {'1', 't', 'b', 'B' };
> +
> +static struct nand_bbt_descr bbt_main_no_oob_descr =3D {
> +	.options =3D NAND_BBT_LASTBLOCK | NAND_BBT_WRITE |
> +	NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP |
> +	NAND_BBT_NO_OOB,

Please indent the above two lines a bit, preferably matching the
indentation of NAND_BBT_LASTBLOCK. It should be clear that this is a
continuation of the '.options' initialization.

> +	.len =3D 4,
> +	.veroffs =3D 4,
> +	.maxblocks =3D NAND_BBT_SCAN_MAXBLOCKS,
> +	.pattern =3D bbt_pattern,
> +};
> +
> +static struct nand_bbt_descr bbt_mirror_no_oob_descr =3D {
> +	.options =3D NAND_BBT_LASTBLOCK | NAND_BBT_WRITE |
> +	NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP |
> +	NAND_BBT_NO_OOB,

Same here.

> +	.len =3D 4,
> +	.veroffs =3D 4,
> +	.maxblocks =3D NAND_BBT_SCAN_MAXBLOCKS,
> +	.pattern =3D mirror_pattern,
> +};
> +
>  /*
>   * We may change the layout if we can get the ECC info from the datashee=
t,
>   * else we will use all the (page + OOB).
> @@ -1728,8 +1751,11 @@ static int gpmi_nand_init(struct gpmi_nand_data *t=
his)
>  			chip->bbt_options |=3D NAND_BBT_NO_OOB_BBM;
>  =

>  		if (of_property_read_bool(this->dev->of_node,
> -						"fsl,no-blockmark-swap"))
> +						"fsl,no-blockmark-swap")) {
>  			this->swap_block_mark =3D false;
> +			chip->bbt_td =3D &bbt_main_no_oob_descr;
> +			chip->bbt_md =3D &bbt_mirror_no_oob_descr;

My initial recommendation for this patch and the previous patch means
that you could just drop both patches and replace them with the
following:

			/* Comment here to explain why... */
			chip->bbt_options |=3D NAND_BBT_CREATE_EMPTY |
					     NAND_BBT_NO_OOB |
					     NAND_BBT_NO_OOB_BBM;
> +		}
>  	}
>  	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
>  		this->swap_block_mark ? "en" : "dis");

Brian
