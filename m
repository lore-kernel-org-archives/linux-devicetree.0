From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 2/3] dmaengine: imx-sdma: sdma_get_firmware does not
	need to copy fw_name
Date: Mon, 5 Sep 2011 11:20:35 +0200
Message-ID: <20110905092035.GC19678@pengutronix.de>
References: <1310723066-567-1-git-send-email-shawn.guo@linaro.org>
	<1310723066-567-3-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1310723066-567-3-git-send-email-shawn.guo@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Vinod Koul <vinod.koul@intel.com>, devicetree-discuss@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 15, 2011 at 05:44:25PM +0800, Shawn Guo wrote:
> It does not need to allocate space and copy fw_name in function
> sdma_get_firmware().
> =

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Vinod Koul <vinod.koul@intel.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
(appointed to act for Sascha who is on vacation)

Thanks
Uwe

> ---
>  drivers/dma/imx-sdma.c |   12 ++----------
>  1 files changed, 2 insertions(+), 10 deletions(-)
> =

> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 4a7aa72..6b839a2 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -1125,22 +1125,14 @@ static int __init sdma_get_firmware(struct sdma_e=
ngine *sdma,
>  		const char *fw_name)
>  {
>  	const struct firmware *fw;
> -	char *fwname;
>  	const struct sdma_firmware_header *header;
>  	int ret;
>  	const struct sdma_script_start_addrs *addr;
>  	unsigned short *ram_code;
>  =

> -	fwname =3D kasprintf(GFP_KERNEL, "%s", fw_name);
> -	if (!fwname)
> -		return -ENOMEM;
> -
> -	ret =3D request_firmware(&fw, fwname, sdma->dev);
> -	if (ret) {
> -		kfree(fwname);
> +	ret =3D request_firmware(&fw, fw_name, sdma->dev);
> +	if (ret)
>  		return ret;
> -	}
> -	kfree(fwname);
>  =

>  	if (fw->size < sizeof(*header))
>  		goto err_firmware;
> -- =

> 1.7.4.1
> =

> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> =


-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
