From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2] gpio: davinci: fix gpio selection for OF
Date: Wed, 5 Mar 2014 15:12:57 +0200
Message-ID: <531722D9.9020904@ti.com>
References: <5316FFCE.1060603@ti.com>
	<1394018461-757-1-git-send-email-holler@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1394018461-757-1-git-send-email-holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alexander,

On 03/05/2014 01:21 PM, Alexander Holler wrote:
> The driver missed an of_xlate function to translate gpio numbers
> as found in the DT to the correct chip and number.
>
> While there I've set #gpio_cells to a fixed value of 2.
>
> I've used gpio-pxa.c as template for those changes and tested my changes
> successfully on a da850 board using entries for gpio-leds in a DT. So I didn't
> reinvent the wheel but just copied and tested stuff.
>
> Thanks to Grygorii Strashko for the hint to the existing code in gpio-pxa.
>
> Signed-off-by: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>

Looks good to me now. Thanks.

> ---
>   drivers/gpio/gpio-davinci.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
>   Changes in v2: replaced static variables by indirections.
>
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 7629b4f..92574a0 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -172,6 +172,27 @@ of_err:
>   	return NULL;
>   }
>
> +#ifdef CONFIG_OF_GPIO
> +static int davinci_gpio_of_xlate(struct gpio_chip *gc,
> +			     const struct of_phandle_args *gpiospec,
> +			     u32 *flags)
> +{
> +	struct davinci_gpio_controller *chips = dev_get_drvdata(gc->dev);
> +	struct davinci_gpio_platform_data *pdata = dev_get_platdata(gc->dev);
> +
> +	if (gpiospec->args[0] > pdata->ngpio)
> +		return -EINVAL;
> +
> +	if (gc != &chips[gpiospec->args[0] / 32].chip)
> +		return -EINVAL;
> +
> +	if (flags)
> +		*flags = gpiospec->args[1];
> +
> +	return gpiospec->args[0] % 32;
> +}
> +#endif
> +
>   static int davinci_gpio_probe(struct platform_device *pdev)
>   {
>   	int i, base;
> @@ -236,6 +257,9 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>   			chips[i].chip.ngpio = 32;
>
>   #ifdef CONFIG_OF_GPIO
> +		chips[i].chip.of_gpio_n_cells = 2;
> +		chips[i].chip.of_xlate = davinci_gpio_of_xlate;
> +		chips[i].chip.dev = dev;
>   		chips[i].chip.of_node = dev->of_node;
>   #endif
>   		spin_lock_init(&chips[i].lock);
>
