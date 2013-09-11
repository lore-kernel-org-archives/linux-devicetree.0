From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/6] extcon-gpio: Do not unnecessarily initialize variables
Date: Wed, 11 Sep 2013 10:16:24 +0900
Message-ID: <522FC468.3010005@samsung.com>
References: <1377836978-24082-1-git-send-email-linux@roeck-us.net>
 <1377836978-24082-2-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1377836978-24082-2-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On 08/30/2013 01:29 PM, Guenter Roeck wrote:
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/extcon/extcon-gpio.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
> index 02bec32..77d35a7 100644
> --- a/drivers/extcon/extcon-gpio.c
> +++ b/drivers/extcon/extcon-gpio.c
> @@ -80,7 +80,7 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  {
>  	struct gpio_extcon_platform_data *pdata = pdev->dev.platform_data;
>  	struct gpio_extcon_data *extcon_data;
> -	int ret = 0;
> +	int ret;
>  
>  	if (!pdata)
>  		return -EBUSY;
> 

Applied it on extcon-linus branch.

Thanks.
Chanwoo Choi
