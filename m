From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 1/2] [media] s5p-g2d: Add DT based discovery support
Date: Wed, 30 Jan 2013 22:38:32 +0100
Message-ID: <510992D8.9030800@gmail.com>
References: <1359107722-9974-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1359107722-9974-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-media-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, k.debski@samsung.com, inki.dae@samsung.com, ajaykumar.rs@samsung.com, patches@linaro.org, s.nawrocki@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Sachin,

On 01/25/2013 10:55 AM, Sachin Kamat wrote:
> This patch adds device tree based discovery support to G2D driver
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   drivers/media/platform/s5p-g2d/g2d.c |   17 ++++++++++++++++-
>   1 files changed, 16 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
> index 7e41529..210e142 100644
> --- a/drivers/media/platform/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/s5p-g2d/g2d.c
> @@ -18,6 +18,7 @@
>   #include<linux/slab.h>
>   #include<linux/clk.h>
>   #include<linux/interrupt.h>
> +#include<linux/of.h>
>
>   #include<linux/platform_device.h>
>   #include<media/v4l2-mem2mem.h>
> @@ -796,7 +797,8 @@ static int g2d_probe(struct platform_device *pdev)
>   	}
>
>   	def_frame.stride = (def_frame.width * def_frame.fmt->depth)>>  3;
> -	dev->variant = g2d_get_drv_data(pdev);
> +	if (!pdev->dev.of_node)
> +		dev->variant = g2d_get_drv_data(pdev);

Don' you need something like:

	else {
		of_id = of_match_node(exynos_g2d_match, pdev->dev.of_node);
		if (!of_id)
			return -ENODEV;
		dev->variant = (struct g2d_variant *)of_id->data;
	}
?

Otherwise dev->variant is left uninitialized...?

>   	return 0;
>
> @@ -844,6 +846,18 @@ static struct g2d_variant g2d_drvdata_v4x = {
>   	.hw_rev = TYPE_G2D_4X, /* Revision 4.1 for Exynos4X12 and Exynos5 */
>   };
>
> +static const struct of_device_id exynos_g2d_match[] = {
> +	{
> +		.compatible = "samsung,g2d-v3",
> +		.data =&g2d_drvdata_v3x,
> +	}, {
> +		.compatible = "samsung,g2d-v41",
> +		.data =&g2d_drvdata_v4x,

Didn't you consider adding "exynos" to these compatible strings ?
I'm afraid g2d may be too generic.

> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, exynos_g2d_match);
> +
>   static struct platform_device_id g2d_driver_ids[] = {
>   	{
>   		.name = "s5p-g2d",
> @@ -863,6 +877,7 @@ static struct platform_driver g2d_pdrv = {
>   	.driver		= {
>   		.name = G2D_NAME,
>   		.owner = THIS_MODULE,
> +		.of_match_table = of_match_ptr(exynos_g2d_match),

of_match_ptr() could be dropped, since exynos_g2d_match[] is
always compiled in.

--

Thanks,
Sylwester
