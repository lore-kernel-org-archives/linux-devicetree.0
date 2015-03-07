From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 07/18] omap3isp: Rename regulators to better suit the Device Tree
Date: Sun, 08 Mar 2015 01:26:35 +0200
Message-ID: <2755307.Zg8emz7kiC@avalon>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi> <1425764475-27691-8-git-send-email-sakari.ailus@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1425764475-27691-8-git-send-email-sakari.ailus@iki.fi>
Sender: linux-media-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, pali.rohar@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Saturday 07 March 2015 23:41:04 Sakari Ailus wrote:
> Rename VDD_CSIPHY1 as vdd-csiphy1 and VDD_CSIPHY2 as vdd-csiphy2.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@iki.fi>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/omap3isp/isp.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/omap3isp/isp.c
> b/drivers/media/platform/omap3isp/isp.c index 1b5c6df..c045318 100644
> --- a/drivers/media/platform/omap3isp/isp.c
> +++ b/drivers/media/platform/omap3isp/isp.c
> @@ -2292,8 +2292,8 @@ static int isp_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, isp);
> 
>  	/* Regulators */
> -	isp->isp_csiphy1.vdd = devm_regulator_get(&pdev->dev, "VDD_CSIPHY1");
> -	isp->isp_csiphy2.vdd = devm_regulator_get(&pdev->dev, "VDD_CSIPHY2");
> +	isp->isp_csiphy1.vdd = devm_regulator_get(&pdev->dev, "vdd-csiphy1");
> +	isp->isp_csiphy2.vdd = devm_regulator_get(&pdev->dev, "vdd-csiphy2");
> 
>  	/* Clocks
>  	 *

-- 
Regards,

Laurent Pinchart
