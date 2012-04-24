From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 03/10] mtd: mxc_nand: move function pointers to a per-SOC
 struct
Date: Tue, 24 Apr 2012 09:24:57 +0200
Message-ID: <20120424072457.GL3852@pengutronix.de>
References: <20120423092240.GA18013@pengutronix.de>
 <1335173022-22371-3-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1335173022-22371-3-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 23, 2012 at 11:23:35AM +0200, Uwe Kleine-K=F6nig wrote:
> This prepares switching to platform ids and of-tree probing.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/mtd/nand/mxc_nand.c |  197 ++++++++++++++++++++++++++-----------=
------
>  1 file changed, 118 insertions(+), 79 deletions(-)
> =

> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index a78e763..1672e4b 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -140,6 +140,19 @@
>  =

>  #define NFC_V3_DELAY_LINE		(host->regs_ip + 0x34)
>  =

> +struct mxc_nand_host;
> +
> +struct mxc_nand_devtype_data {
> +	void (*preset)(struct mtd_info *);
> +	void (*send_cmd)(struct mxc_nand_host *, uint16_t, int);
> +	void (*send_addr)(struct mxc_nand_host *, uint16_t, int);
> +	void (*send_page)(struct mtd_info *, unsigned int);
> +	void (*send_read_id)(struct mxc_nand_host *);
> +	uint16_t (*get_dev_status)(struct mxc_nand_host *);
> +	int (*check_int)(struct mxc_nand_host *);
> +	void (*irq_control)(struct mxc_nand_host *, int);
> +};
> +
>  struct mxc_nand_host {
>  	struct mtd_info		mtd;
>  	struct nand_chip	nand;
> @@ -165,14 +178,7 @@ struct mxc_nand_host {
>  	unsigned int		buf_start;
>  	int			spare_len;
>  =

> -	void			(*preset)(struct mtd_info *);
> -	void			(*send_cmd)(struct mxc_nand_host *, uint16_t, int);
> -	void			(*send_addr)(struct mxc_nand_host *, uint16_t, int);
> -	void			(*send_page)(struct mtd_info *, unsigned int);
> -	void			(*send_read_id)(struct mxc_nand_host *);
> -	uint16_t		(*get_dev_status)(struct mxc_nand_host *);
> -	int			(*check_int)(struct mxc_nand_host *);
> -	void			(*irq_control)(struct mxc_nand_host *, int);
> +	const struct mxc_nand_devtype_data *devtype_data;
>  =

>  	/*
>  	 * On i.MX21 the CONFIG2:INT bit cannot be read if interrupts are masked
> @@ -251,20 +257,6 @@ static struct nand_ecclayout nandv2_hw_eccoob_4k =3D=
 {
>  =

>  static const char *part_probes[] =3D { "RedBoot", "cmdlinepart", NULL };
>  =

> -static irqreturn_t mxc_nfc_irq(int irq, void *dev_id)
> -{
> -	struct mxc_nand_host *host =3D dev_id;
> -
> -	if (!host->check_int(host))
> -		return IRQ_NONE;
> -
> -	irq_control(host, 0);
> -
> -	complete(&host->op_completion);
> -
> -	return IRQ_HANDLED;
> -}
> -
>  static int check_int_v3(struct mxc_nand_host *host)
>  {
>  	uint32_t tmp;
> @@ -329,10 +321,25 @@ static void irq_control(struct mxc_nand_host *host,=
 int activate)
>  		else
>  			disable_irq_nosync(host->irq);
>  	} else {
> -		host->irq_control(host, activate);
> +		host->devtype_data->irq_control(host, activate);
>  	}
>  }
>  =

> +static irqreturn_t mxc_nfc_irq(int irq, void *dev_id)
> +{
> +	struct mxc_nand_host *host =3D dev_id;
> +
> +	if (!host->devtype_data->check_int(host))
> +		return IRQ_NONE;
> +
> +	irq_control(host, 0);
> +
> +	complete(&host->op_completion);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +

The move of mxc_nfc_irq seems unnecessary. Also one blank line too much.

>  =

> +/* v1: 21, 27, 31 */

Can we have imx21 here? People familiar with i.MX may instantly
recognize these numbers, others do not.

Sascha


-- =

Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
