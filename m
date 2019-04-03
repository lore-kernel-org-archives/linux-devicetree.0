From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: pwm-fan: Disable PWM if fetching cooling data
 fails
Date: Wed, 3 Apr 2019 06:18:39 -0700
Message-ID: <20190403131839.GA31325@roeck-us.net>
References: <1554295713-18656-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554295713-18656-1-git-send-email-stefan.wahren@i2se.com>
Sender: stable-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "# 4 . 14" <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 03, 2019 at 02:48:33PM +0200, Stefan Wahren wrote:
> In case pwm_fan_of_get_cooling_data() fails we should disable the PWM
> just like in the other error cases.
> 
> Reported-by: Guenter Rock <linux@roeck-us.net>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Fixes: 2e5219c77183 ("hwmon: (pwm-fan) Read PWM FAN configuration from device tree")
> Cc: <stable@vger.kernel.org> # 4.14

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pwm-fan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 167221c..e4c5197 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -271,7 +271,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  
>  	ret = pwm_fan_of_get_cooling_data(&pdev->dev, ctx);
>  	if (ret)
> -		return ret;
> +		goto err_pwm_disable;
>  
>  	ctx->pwm_fan_state = ctx->pwm_fan_max_state;
>  	if (IS_ENABLED(CONFIG_THERMAL)) {
