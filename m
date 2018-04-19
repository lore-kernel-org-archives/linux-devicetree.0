From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 01/15] media: staging/imx: add support to media dev for
 no IPU systems
Date: Thu, 19 Apr 2018 15:06:06 +0300
Message-ID: <20180419120606.p32pl5at7wky7u3y@mwanda>
References: <20180419101812.30688-1-rui.silva@linaro.org>
 <20180419101812.30688-2-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20180419101812.30688-2-rui.silva@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 19, 2018 at 11:17:58AM +0100, Rui Miguel Silva wrote:
> Some i.MX SoC do not have IPU, like the i.MX7, add to the the media device
> infrastructure support to be used in this type of systems that do not have
> internal subdevices besides the CSI.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  drivers/staging/media/imx/imx-media-dev.c        | 16 +++++++++++-----
>  .../staging/media/imx/imx-media-internal-sd.c    |  3 +++
>  drivers/staging/media/imx/imx-media.h            |  3 +++
>  3 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
> index f67ec8e27093..a8afe0ec4134 100644
> --- a/drivers/staging/media/imx/imx-media-dev.c
> +++ b/drivers/staging/media/imx/imx-media-dev.c
> @@ -92,6 +92,9 @@ static int imx_media_get_ipu(struct imx_media_dev *imxmd,
>  	struct ipu_soc *ipu;
>  	int ipu_id;
>  
> +	if (imxmd->no_ipu_present)

It's sort of nicer if variables don't have a negative built in because
otherwise you get confusing double negatives like "if (!no_ipu) {".
It's not hard to invert the varible in this case, because the only thing
we need to change is imx_media_probe() to set:

+	imxmd->ipu_present = true;

regards,
dan carpenter
