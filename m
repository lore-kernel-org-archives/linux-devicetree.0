From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] mfd: wm8994: Add device ID data to WM8994 OF device IDs
Date: Thu, 11 Apr 2013 11:53:33 +0200
Message-ID: <5166881D.6000808@samsung.com>
References: <1365604763-13122-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1365604763-13122-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On 04/10/2013 04:39 PM, Mark Brown wrote:
> We can actually read this back from the device but we use this when
> registered using standard I2C board data registration so make sure
> it's there for OF too.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
> 
> Untested at present.

I have tested this with wm1811 codec, together with the second patch.
The device type was set correctly.

FWIW, Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

>  drivers/mfd/wm8994-core.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
> index cdea84e..3f8d591 100644
> --- a/drivers/mfd/wm8994-core.c
> +++ b/drivers/mfd/wm8994-core.c
> @@ -673,9 +673,9 @@ static void wm8994_device_exit(struct wm8994 *wm8994)
>  }
>  
>  static const struct of_device_id wm8994_of_match[] = {
> -	{ .compatible = "wlf,wm1811", },
> -	{ .compatible = "wlf,wm8994", },
> -	{ .compatible = "wlf,wm8958", },
> +	{ .compatible = "wlf,wm1811", .data = (void *)WM1811 },
> +	{ .compatible = "wlf,wm8994", .data = (void *)WM8994 },
> +	{ .compatible = "wlf,wm8958", .data = (void *)WM8958 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, wm8994_of_match);

Thanks,
Sylwester
