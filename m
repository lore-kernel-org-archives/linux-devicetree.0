From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers: staging: imx-drm Fix checkpatch warning
Date: Wed, 29 Oct 2014 17:25:33 +0800
Message-ID: <20141029092533.GA5886@kroah.com>
References: <1413427044-9980-1-git-send-email-gascoar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1413427044-9980-1-git-send-email-gascoar@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: grant.likely@linaro.org, devel@driverdev.osuosl.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 15, 2014 at 11:37:24PM -0300, Gaston Gonzalez wrote:
> Fix line over 80 characters in imx-tve.c
> 
> Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> ---
>  drivers/staging/imx-drm/imx-tve.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/imx-drm/imx-tve.c b/drivers/staging/imx-drm/imx-tve.c
> index 3e8b0a1..a46905f 100644
> --- a/drivers/staging/imx-drm/imx-tve.c
> +++ b/drivers/staging/imx-drm/imx-tve.c
> @@ -665,7 +665,8 @@ static int imx_tve_bind(struct device *dev, struct device *master, void *data)
>  
>  	ret = regmap_read(tve->regmap, TVE_COM_CONF_REG, &val);
>  	if (ret < 0) {
> -		dev_err(dev, "failed to read configuration register: %d\n", ret);
> +		dev_err(dev, "failed to read configuration register: %d\n",
> +			ret);
>  		return ret;
>  	}
>  	if (val != 0x00100000) {

Does not apply :(
